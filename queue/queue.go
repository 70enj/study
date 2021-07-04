package queue

/*
         -> 3 -> 2 -> 1
first (nil) 1(3) 1(2) 1
last        3    2    1
next        nil  3    2
*/

// Queue is structure.
type Queue struct {
	first *element
	last  *element
	node  *element
}

type element struct {
	next *element
	data interface{}
}

// New is constructer.
func New() *Queue {
	q := new(Queue)
	return q
}

func node(item interface{}) *element {
	q := new(element)
	q.data = item
	return q
}

// Add is method of Queue.
func (q *Queue) Add(item interface{}) {
	n := node(item)
	if q.last != nil {
		q.last.next = n
	}
	q.last = n
	if q.first == nil {
		q.first = n
	}
}

// Remove is method of Queue.
func (q *Queue) Remove() interface{} {
	//空ならnilを返す。
	if q.first == nil {
		return nil
	}
	data := q.first.data
	q.first = q.first.next
	//削除後空になったらlastもnilにする。
	if q.first == nil {
		q.last = nil
	}
	return data
}

// Peek is method of Queue.
func (q *Queue) Peek() interface{} {
	if q.first == nil {
		return nil
	}
	return q.first.data
}

// IsEmpty is method of Queue.
func (q *Queue) IsEmpty() bool {
	return q.first == nil
}

/*func main() {
	q := New(1)
	fmt.Println(q.Peek())
	q.Add(2)
	fmt.Println(q.Remove())
	fmt.Println(q.Peek())
	fmt.Println(q.IsEmpty())
	q.Add(3)
	fmt.Println(q.Remove())
	fmt.Println(q.Remove())
	fmt.Println(q.Remove())
	fmt.Println(q.Peek())
	fmt.Println(q.IsEmpty())
	q.Add(4)
	fmt.Println(q.Peek())
}*/
