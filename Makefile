build:
	tailwindcss -i main.css | esbuild --loader=css --minify > static/main.css
	esbuild --bundle main.js --minify --outfile=static/main.js
	templ generate
	go build -o ./tmp/main .

dev:
	air
