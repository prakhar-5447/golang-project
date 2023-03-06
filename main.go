package main

import (
	"fmt"
)

func main() {
	fmt.Println("Hello World")
	fmt.Println(add(5, 10))
}

func add(x int, y int) int {
	var a = x
	var b = y
	return a + b
}
