package main

import (
	"net/http"
	"path"
)

// cleanPathHandler cleans the request path and redirects if necessary.
func cleanPathHandler(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		cleanedPath := path.Clean(r.URL.Path)
		if r.URL.Path != cleanedPath {
			http.Redirect(w, r, cleanedPath, http.StatusTemporaryRedirect)
			return
		}
		next.ServeHTTP(w, r)
	})
}
