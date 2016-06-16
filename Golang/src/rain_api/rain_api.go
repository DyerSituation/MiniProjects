package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

func panicError(err error) {
	if err != nil {
		panic(err.Error())
	}
}

func main() {
	fmt.Println("List of virtual machines")
	var m []string

	r, err := http.Get("https://app.rainforestqa.com:443/api/1/vm_stack.json")
	rawData, _ := ioutil.ReadAll(r.Body)
	json.Unmarshal(rawData, m)
	for _, ip := range m {
		fmt.Printf("\t%v\n", ip)
	}

	//dec := json.NewDecoder(r.Body)
	defer r.Body.Close()
	panicError(err)
}
