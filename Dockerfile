FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN apk add --update --no-cache git make tzdata && \
	wget -O /usr/local/bin/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64 && chmod +x /usr/local/bin/tailwindcss && \
	go install github.com/a-h/templ/cmd/templ@latest && \
	make build

FROM alpine
WORKDIR /app
RUN apk add --update --no-cache tzdata
COPY --from=builder /app/tmp/main .
ENV ENV=production
ENV ADDR=:80
EXPOSE 80
CMD ["./main"]
