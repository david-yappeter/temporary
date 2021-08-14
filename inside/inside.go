package inside

import "fmt"

func init() {
	fmt.Println("nested Init . . .")
}

func NeedSomething() {
    fmt.Println("NeedSomething Run . .")
}