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
	http.Handle("/static/", http.FileServer(http.FS(staticFiles)))

	http.Handle("/", templ.Handler(components.Home()))

	log.Println("Listening on " + os.Getenv("ADDR"))
	log.Panicln(http.ListenAndServe(os.Getenv("ADDR"), http.TimeoutHandler(http.DefaultServeMux, time.Hour, "")))
}
