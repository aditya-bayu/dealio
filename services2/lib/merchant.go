package lib

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	schema "./schema"
)

func GetMerchants(w http.ResponseWriter, r *http.Request) {
	resp, err := http.Get("http://45.127.133.96:3000/get-merchant")
	if err != nil {
		fmt.Println(err)
	}
	defer resp.Body.Close()

	w.Header().Set("Content-Type", "application/json")
	body, _ := ioutil.ReadAll(resp.Body)

	input := `{"data":` + string(body) + `}`
	json.NewEncoder(w).Encode(schema.Resp2struct(input))
}
