FROM golang:1.18 AS builder

WORKDIR /app

COPY app/go.* ./
COPY app/*.go ./

RUN GOOS=linux GOARCH=amd64 go build -o go.bin .
RUN ls

FROM scratch

COPY --from=builder app/go.bin .

ENTRYPOINT [ "./go.bin" ]