package stack

/*
     1 -> 2 -> 3
next nil  1    2
top  1    2    3
*/

// Stack is structure.
type Stack struct {
	top  *element
	node *element
}

type element struct {
	next *element
	data interface{}
}

// CreateStack is constructer.
func CreateStack() *Stack {
	s := new(Stack)
	return s
}

// firstStack is constructer.
func (s *Stack) firstStack(item interface{}) {
	s.node = new(element)
	s.node.data = item
	s.top = new(element)
	s.top = s.node
}

// Node is constructer.
func node(item interface{}) *element {
	e := new(element)
	e.data = item
	return e
}

// Pop is method of Stack.
func (s *Stack) Pop() interface{} {
	//空ならnilを返す
	if s.IsEmpty() {
		return nil
	}

	data := s.top.data
	s.top = s.top.next

	return data
}

// Push is method of Stack.
func (s *Stack) Push(item int) {
	if s.IsEmpty() { //最初はオブジェクト作成
		s.firstStack(item)
		return
	}

	n := node(item)

	n.next = s.top
	s.top = n

}

// Peek is method of Stack.
func (s *Stack) Peek() interface{} {
	if s.top == nil {
		return nil
	}
	return s.top.data
}

// IsEmpty is method of Stack.
func (s *Stack) IsEmpty() bool {
	return s.top == nil
}

/*func main() {
	s := CreateStack()
	s.Push(2)
	s.Push(3)

	fmt.Println(s.Pop())
	s.Push(10)
	fmt.Println(s.Pop())
	fmt.Println(s.Pop())
	fmt.Println(s.Pop())
}*/
