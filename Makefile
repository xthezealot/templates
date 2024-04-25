build:
	tailwindcss -m -i main.css -o static/main.css
	templ generate
	go build -o ./tmp/main .

dev:
	air

fmt:
	go fmt ./...
	dprint fmt
