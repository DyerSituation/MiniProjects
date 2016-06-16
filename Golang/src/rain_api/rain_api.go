package main

import (
	"fmt"
)

func main() {
	fmt.Println("List of virtual machines")
	vm := githubGetVMer{}
	msg, err := vm.GetNewestVMs("https://app.rainforestqa.com:443/api/1/vm_stack.json")
	panicError(err)
	slicePrinter(msg)
	//dec := json.NewDecoder(r.Body)
}
