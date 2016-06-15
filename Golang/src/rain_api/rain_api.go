package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

func main() {
	fmt.Printf("%v\n", "List of virtual machines")
	var m interface{}
	r, err := http.Get("https://app.rainforestqa.com:443/api/1/vm_stack.json")
	dec := json.NewDecoder(r.Body)
	defer r.Body.Close()
	if err != nil {
		panic(err.Error())
	}

	//read open bracket
	t, err := dec.Token()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%v\n", t)

	for dec.More() {
		// decode an array value (Message)
		dec.Decode(&m)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("	%v\n", m)
	}
	// read closing bracket
	t, err = dec.Token()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%v\n", t)

	r.Body.Close()
}
