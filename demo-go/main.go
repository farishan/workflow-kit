package main

import (
	"fmt"
	"os"
)

func Add(a, b int) int { return a + b }

func main() {
	fmt.Println(Add(2, 3))
	if len(os.Args) > 1 && os.Args[1] == "--fail" {
		os.Exit(1)
	}
}
