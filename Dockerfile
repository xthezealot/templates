FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN apk add --update --no-cache curl git make tzdata && \
	curl -fsSLo /usr/local/bin/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64 && \
	chmod +x /usr/local/bin/tailwindcss && \
	curl -fsSL https://esbuild.github.io/dl/latest | ash && \
	mv esbuild /usr/local/bin && \
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
