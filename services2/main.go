package main

import (
	"net/http"

	lib "./lib"
	"github.com/gorilla/mux"
)

func main() {
	// lib.Development()

	var route string = "3001"

	router := mux.NewRouter().StrictSlash(true)

	router.HandleFunc("/merchants", lib.GetMerchants).Methods("GET")
	router.HandleFunc("/deals", lib.GetDeals).Methods("GET")
	http.ListenAndServe(":"+route, router)
}
