FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN apk add --update --no-cache make git nodejs npm tzdata && \
	npm install -g tailwindcss esbuild && \
	go install github.com/cosmtrek/air@latest && \
	go install github.com/a-h/templ/cmd/templ@latest && \
	go mod download && \
	make build

FROM alpine
WORKDIR /app
RUN apk add --update --no-cache tzdata
COPY --from=builder /app/tmp/main .
ENV ENV production
ENV ADDR :80
EXPOSE 80
CMD ["./main"]
