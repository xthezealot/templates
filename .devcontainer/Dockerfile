FROM golang:1.22-alpine

RUN apk add --update --no-cache make git nodejs npm tzdata && \
	npm install -g tailwindcss esbuild && \
	go install github.com/cosmtrek/air@latest && \
	go install github.com/a-h/templ/cmd/templ@latest
