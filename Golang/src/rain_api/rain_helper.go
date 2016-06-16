package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

type getVMer interface {
	getNewestVMs(string) ([]string, error)
}

type githubGetVMer struct{}

func (vm githubGetVMer) GetNewestVMs(url string) ([]string, error) {
	var m []string
	r, err := http.Get(url)
	rawData, _ := ioutil.ReadAll(r.Body)
	defer r.Body.Close()
	json.Unmarshal(rawData, &m)
	return m, err
}

func slicePrinter(slice []string) {
	fmt.Printf("%v", len(slice))
	for _, ip := range slice {
		fmt.Printf("\t%v\n", ip)
	}
}

func panicError(err error) {
	if err != nil {
		panic(err.Error())
	}
}
