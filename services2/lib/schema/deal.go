package schema

import (
	"encoding/json"
)

type deals struct {
	Data []deal `json:"data"`
}

type deal struct {
	ID          int    `json:"id"`
	Name        string `json:"name"`
	AudienceID  int    `json:"audience_id"`
	StartDate   string `json:"start_date"`
	EndDate     string `json:"end_date"`
	Description string `json:"description"`
	Image       string `json:"image"`
	Action      string `json:"action"`
	ActionLink  string `json:"action_link"`
	MerchantID  int    `json:"merchant_id"`
	Date        string `json:"date"`
	Time        string `json:"time"`
	Banner      string `json:"banner"`
}

func Deal2struct(input string) deals {
	data := deals{
		Data: []deal{},
	}
	json.Unmarshal([]byte(input), &data)
	return data
}
