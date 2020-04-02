package lib

import "fmt"

// Development for testing functions
func Development() {
	// e := NewEnvirontment()
	// e.ShowLink()
	// e.showlink()
	// fmt.Println(e.Link1)

	e := new(Env)
	fmt.Println(e.link)
}
