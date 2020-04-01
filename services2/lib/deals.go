package lib

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	schema "./schema"
)

func GetDeals(w http.ResponseWriter, r *http.Request) {
	// func GetDeals() {
	resp, err := http.Get("http://45.127.133.96:3000/get-deals")
	if err != nil {
		fmt.Println(err)
	}
	defer resp.Body.Close()

	w.Header().Set("Content-Type", "application/json")
	body, _ := ioutil.ReadAll(resp.Body)

	input := `{"data":` + string(body) + `}`
	data := schema.Deal2struct(input)
	json.NewEncoder(w).Encode(data)
}
