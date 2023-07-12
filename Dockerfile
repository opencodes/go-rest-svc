FROM golang:alpine

WORKDIR /app/go-rest

# We want to populate the module cache based on the go.{mod,sum} files.
COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# Build the Go app
RUN go build -o ./out/go-rest .


# This container exposes port 8080 to the outside world
EXPOSE 9008

# Run the binary program produced by `go install`
CMD ["./out/go-rest"]