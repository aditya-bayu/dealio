package lib

import "fmt"

type Env struct {
	Link1 string
	link  string
}

// NewEnvirontment for general variable
func NewEnvirontment() Env {
	return Env{
		Link1: "http://45.127.133.96:3000",
	}
}

// ShowLink returns blablabla
func (e Env) ShowLink() {
	fmt.Println(e.Link1)
}

func (e Env) showlink() {
	fmt.Println(e.Link1)
}
