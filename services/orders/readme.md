Build docker image
`docker build -t chinook-orders .`

Run docker image
`docker run --name orders -it -p 8016:8080 --rm chinook-orders`