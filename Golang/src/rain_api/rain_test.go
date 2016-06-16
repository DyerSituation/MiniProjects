package main

import "testing"

type FakeGetVMer struct {
	msg []string
	err error
}

func (f FakeGetVMer) getNewestVMs(url string) ([]string, error) {
	if f.err != nil {
		return nil, f.err
	}
	return f.msg, nil
}

func TestVMs(t *testing.T) {
	f := FakeGetVMer{
		msg: []string{"localhost:8000"},
		err: nil,
	}

	expectedSlice := []string{"localhost:8000"}
	msg, err := f.getNewestVMs("test string")

	if err != nil {
		t.Fatalf("Expected err to be nil but it was %s", err)
	}
	for i, ip := range msg {
		if expectedSlice[i] != ip {
			t.Fatalf("Expected %s but got %s", expectedSlice[i], ip)
		}
	}
}
