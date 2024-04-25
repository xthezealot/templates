# Go Web Template

- [Go](https://pkg.go.dev/net/http)
- [PostgreSQL](https://www.postgresql.org/docs/current/index.html)
- [Tailwind CSS](https://tailwindcss.com/docs/installation)
- [Templ](https://templ.guide)

## Download

```sh
git clone --depth=1 --branch=go-web https://github.com/xthezealot/templates.git && rm -r .git && git init
```

## Usage

1. Set .env config
2. Use Makefile commands:
   ```sh
   # Run the server in live-reload mode
   make dev

   # Format all the code
   make fmt

   # Build the final Docker image
   make build
   ```
