FROM golang:1.22-alpine

RUN apk add --update --no-cache curl git make tzdata && \
	wget -O- https://dprint.dev/install.sh | sh && ln -s ~/.dprint/bin/dprint /usr/local/bin/dprint && \
	wget -O /usr/local/bin/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64 && chmod +x /usr/local/bin/tailwindcss && \
	go install golang.org/x/tools/gopls@latest && \
	go install honnef.co/go/tools/cmd/staticcheck@latest && \
	go install github.com/air-verse/air@latest && \
	go install github.com/a-h/templ/cmd/templ@latest
