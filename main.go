package main

import (
	"net/http"
	"project/components"

	"github.com/a-h/templ"
)

func main() {
	http.Handle("/", templ.Handler(components.Home()))

	http.ListenAndServe(":8080", nil)
}
