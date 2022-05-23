package uniList

import "testing"

func Test(t *testing.T) {
	e := new(Element)
	e.Node(1)
	e.AppendToTail(2)
	answer := 1
	if e.Data != answer {
		t.Error("\nデータ： ", e.Data, "\n答え： ", answer)
	}

	answer = 2
	if e.Next.Data != answer {
		t.Error("\nデータ： ", e.Next.Data, "\n答え： ", answer)
	}
}
