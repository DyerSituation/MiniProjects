package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

func readToken(dec *json.Decoder) (t json.Token) {
	t, err := dec.Token()
	panicError(err)
	fmt.Printf("%v\n", t)
	return
}

func panicError(err error) {
	if err != nil {
		panic(err.Error())
	}
}

func main() {
	fmt.Printf("%v\n", "List of virtual machines")
	var m interface{}
	r, err := http.Get("https://app.rainforestqa.com:443/api/1/vm_stack.json")
	dec := json.NewDecoder(r.Body)
	defer r.Body.Close()
	panicError(err)

	//read open bracket
	readToken(dec)

	for dec.More() {
		// decode an array value (Message)
		dec.Decode(&m)
		panicError(err)
		fmt.Printf("	%v\n", m)
	}
	// read closing bracket
	readToken(dec)

	r.Body.Close()
}
