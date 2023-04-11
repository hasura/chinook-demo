Build docker image
`docker build -t chinook-devices .`

Run docker image
`docker run --name devices -it -p 8017:8080 --rm chinook-devices`