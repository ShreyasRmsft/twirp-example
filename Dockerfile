FROM golang:1.19

WORKDIR $GOPATH/src/github.com/twitchtv/twirp-example

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Download all the dependencies
RUN go get ./...

RUN go build ./cmd/server/main.go

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["./main"]