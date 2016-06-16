package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"testing"
)

func TestToken(t *testing.T) {

	const jsonStream = `[`

	r, err := http.Get("https://app.rainforestqa.com:443/api/1/vm_stack.json")
	dec := json.NewDecoder(r.Body)
	defer r.Body.Close()
	panicError(err)
	token := readToken(dec)
	fmt.Printf("Token type: %T", jsonStream)
	//ar expected = json.Delim(`[`)
	if token != jsonStream {
		t.Error(token)
	}
}
