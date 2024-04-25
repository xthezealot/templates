package main

import (
	"embed"
	"log"
	"net/http"
	"os"
	"project/components"
	"time"

	"github.com/a-h/templ"
	_ "github.com/joho/godotenv/autoload"
)

//go:embed static
var staticFiles embed.FS

func main() {
	// Routes

	http.Handle("GET /static/", http.FileServer(http.FS(staticFiles)))

	http.Handle("GET /", templ.Handler(components.Home()))

	http.HandleFunc("GET /about", func(w http.ResponseWriter, r *http.Request) {
		components.Home().Render(r.Context(), w)
	})

	// Server run

	log.Println("Listening on " + os.Getenv("ADDR"))
	log.Panicln(http.ListenAndServe(os.Getenv("ADDR"), http.TimeoutHandler(http.DefaultServeMux, time.Hour, "")))
}
