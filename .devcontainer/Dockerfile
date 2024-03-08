FROM golang:1.22-alpine

RUN apk add make nodejs npm && \
	npm install -g tailwindcss esbuild && \
	go install github.com/cosmtrek/air@latest && \
	go install github.com/a-h/templ/cmd/templ@latest
