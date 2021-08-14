package temporary

import (
	"fmt"

	"github.com/david-yappeter/temporary/inside"
)

var (
	A int
	B string
)

func init() {
	fmt.Println("library init run . . .")
	A = 10
	B = "testing"
}

func PrintVal() {
	fmt.Println(A, B)
	inside.NeedSomething()
}
