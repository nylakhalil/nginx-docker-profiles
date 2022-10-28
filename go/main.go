package main

import (
    "fmt"
    "log"
    "net/http"
)

func index(w http.ResponseWriter, req *http.Request) {
    log.Println("Go Web Server /")
    fmt.Fprintf(w, `<html lang="en"><head><title>Go Server</title></head><body><p>Go Web Server</p></body></html>`)
}

func ping(w http.ResponseWriter, req *http.Request) {
    log.Println("Go Web Server /ping")
    fmt.Fprintf(w, "OK\n")
}

func main() {
    log.Println("Go Web Server starting")
    http.HandleFunc("/", index)
    http.HandleFunc("/ping", ping)

    log.Println("Go Web Server serving on 3000")
    http.ListenAndServe(":3000", nil)
}
