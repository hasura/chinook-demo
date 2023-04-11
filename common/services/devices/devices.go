package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/lib/pq"

	"github.com/jmoiron/sqlx"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

type Device struct {
	Guid        *string `db:"guid"`
	CustomerId  int     `db:"customer_id"`
	Model       *string `db:"model"`
	Name        *string `db:"name"`
	Description *string `db:"description"`
}

func main() {
	servicePort := os.Getenv("SERVICE_PORT")
	//dbConnStr := "postgres://postgres:postgrespassword@localhost:5432/chinook_corp?sslmode=disable"
	dbConnStr := os.Getenv("PG_DB_URL")

	// Connect to database
	db, err := sqlx.Connect("postgres", dbConnStr)
	if err != nil {
		log.Fatal(err)
	}

	getDevicesHandler := func(context echo.Context) error {
		customerId := context.QueryParam("customerId")
		offset := context.QueryParam("offset")
		limit := context.QueryParam("limit")
		devices := []Device{}

		devicesQuery := "SELECT * FROM devices"
		if len(customerId) > 0 {
			devicesQuery = devicesQuery + " WHERE customer_id = " + customerId
		}
		if len(limit) > 0 {
			devicesQuery = devicesQuery + " LIMIT " + limit
		}
		if len(offset) > 0 {
			devicesQuery = devicesQuery + " OFFSET " + offset
		}
		err := db.Select(&devices, devicesQuery)

		if err != nil {
			log.Fatalln(err)
			context.String(http.StatusInternalServerError, string(`Error retrieving devices`))
		}
		return context.JSON(http.StatusOK, devices)
	}

	getDeviceHandler := func(context echo.Context) error {
		deviceId := context.Param("deviceId")
		fmt.Println("deviceId:", deviceId)
		device := Device{}
		err := db.Get(&device, "SELECT * FROM devices WHERE guid = $1", deviceId)

		if err != nil {
			log.Fatalln(err)
			context.String(http.StatusInternalServerError, string(`Error retrieving device`))
		}
		return context.JSON(http.StatusOK, device)
	}

	httpServer := echo.New()
	httpServer.Use(middleware.Logger())
	httpServer.Use(middleware.Recover())

	// Routes
	httpServer.GET("/devices", getDevicesHandler)
	httpServer.GET("/devices/:deviceId", getDeviceHandler)

	// Start server
	httpServer.Logger.Fatal(httpServer.Start(":" + servicePort))
}
