package uniList

//単方向連結リスト

import (
	"fmt"
)

// Element is structure.
type Element struct {
	Next *Element
	Data int
}

// Node is method of Element.
func (e *Element) Node(d int) {
	e.Next = nil
	e.Data = d
}

// AppendToTail is method of Element.
func (e *Element) AppendToTail(d int) {
	end := new(Element)
	end.Node(d)
	for e.Next != nil {
		e = e.Next
	}
	e.Next = end
}

// AppendToTailList is method of Element
func (e *Element) AppendToTailList(l *Element) {
	for e.Next != nil {
		e = e.Next
	}
	e.Next = l
}

// DisplayList is method.
func (e *Element) DisplayListString() {
	for e != nil {
		fmt.Print(e, " ")
		e = e.Next
	}
	fmt.Println()
}

/*func main() {
	e := new(Element)
	e.Node(1)
	e.AppendToTail(2)
	e.DisplayList()
}*/
