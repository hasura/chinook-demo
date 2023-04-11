package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	_ "github.com/lib/pq"

	"github.com/jmoiron/sqlx"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

type Invoice struct {
	Id                int       `db:"id"`
	CustomerId        int       `db:"customer_id"`
	DeviceId          *string   `db:"device_id"`
	InvoiceDate       time.Time `db:"invoice_date"`
	BillingAddress    *string   `db:"billing_address"`
	BillingCity       *string   `db:"billing_city"`
	BillingState      *string   `db:"billing_state"`
	BillingCountry    *string   `db:"billing_country"`
	BillingPostalCode *string   `db:"billing_postal_code"`
	Total             float32   `db:"total"`
}

type InvoiceLines struct {
	Id        int     `db:"id"`
	InvoiceId int     `db:"invoice_id"`
	TrackId   int     `db:"track_id"`
	UnitPrice float32 `db:"unit_price"`
	Quantity  int     `db:"quantity"`
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

	getInvoicesHandler := func(context echo.Context) error {
		customerId := context.QueryParam("customerId")
		offset := context.QueryParam("offset")
		limit := context.QueryParam("limit")
		fmt.Println("customerId:", customerId)
		fmt.Println("offset:", offset)
		fmt.Println("limit:", limit)
		invoices := []Invoice{}

		invoicesQuery := "SELECT * FROM invoices"
		if len(customerId) > 0 {
			invoicesQuery = invoicesQuery + " WHERE customer_id = " + customerId
		}
		if len(limit) > 0 {
			invoicesQuery = invoicesQuery + " LIMIT " + limit
		}
		if len(offset) > 0 {
			invoicesQuery = invoicesQuery + " OFFSET " + offset
		}
		err := db.Select(&invoices, invoicesQuery)

		if err != nil {
			log.Fatalln(err)
			context.String(http.StatusInternalServerError, string(`Error retrieving invoices`))
		}
		return context.JSON(http.StatusOK, invoices)
	}

	getInvoiceHandler := func(context echo.Context) error {
		invoiceId := context.Param("invoiceId")
		invoice := Invoice{}
		err := db.Get(&invoice, "SELECT * FROM invoices WHERE id = $1", invoiceId)

		if err != nil {
			log.Fatalln(err)
			context.String(http.StatusInternalServerError, string(`Error retrieving invoice`))
		}
		return context.JSON(http.StatusOK, invoice)
	}

	getInvoiceLinesHandler := func(context echo.Context) error {
		invoiceId := context.Param("invoiceId")
		invoiceLines := []InvoiceLines{}
		err := db.Select(&invoiceLines, "SELECT * FROM invoice_lines WHERE invoice_id = $1", invoiceId)

		if err != nil {
			log.Fatalln(err)
			context.String(http.StatusInternalServerError, string(`Error retrieving invoice lines`))
		}
		return context.JSON(http.StatusOK, invoiceLines)
	}

	/*kvGetHandler := func(context echo.Context) error {
		dataKey := fmt.Sprintf("data|%s", context.Param("kvKey"))
		typeKey := fmt.Sprintf("type|%s", context.Param("kvKey"))
		data, closer, err := kvStore.Get([]byte(dataKey))
		if err != nil {
			log.Fatal(err)
		}
		if err := closer.Close(); err != nil {
			log.Fatal(err)
		}
		contentType, closer, err := kvStore.Get([]byte(typeKey))
		if err != nil {
			log.Fatal(err)
		}
		if err := closer.Close(); err != nil {
			log.Fatal(err)
		}
		return context.Blob(http.StatusOK, string(contentType), data)
	}*/

	httpServer := echo.New()
	httpServer.Use(middleware.Logger())
	httpServer.Use(middleware.Recover())

	// Routes
	httpServer.GET("/invoices", getInvoicesHandler)
	httpServer.GET("/invoices/:invoiceId", getInvoiceHandler)
	httpServer.GET("/invoices/:invoiceId/lines", getInvoiceLinesHandler)

	// Start server
	httpServer.Logger.Fatal(httpServer.Start(":" + servicePort))
}
