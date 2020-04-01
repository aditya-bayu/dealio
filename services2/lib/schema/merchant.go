package schema

import "encoding/json"

type merchants struct {
	Data []merchant `json:"data"`
}

type merchant struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Image string `json:"image"`
}

func Resp2struct(input string) merchants {
	data := merchants{
		Data: []merchant{},
	}
	json.Unmarshal([]byte(input), &data)
	return data
}
