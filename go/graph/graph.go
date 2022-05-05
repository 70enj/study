package main

//重み無し有向グラフ
import "fmt"

// Graph is structure.
type Graph struct {
	nodes []node
}

type node struct {
	name     string
	children []*node
}

// NewGraph is constructer.
func NewGraph() *Graph {
	return new(Graph)
}

// newNode is constructer.
func newNode(name string) node {
	n := new(node)
	n.name = name
	return *n
}

//AddNode is method of Graph.
//グラフにノード追加
func (g *Graph) AddNode(name string, children []*node) {
	if g.nodeForName(name) != nil {
		fmt.Println("nodo名", name, "は既に登録済みです。")
		return
	}
	n := newNode(name)

	if len(children) != 0 {
		n.addChildren(children)
	}

	g.nodes = append(g.nodes, n)

}

//AddChild is method of Graph.
//parentName(親ノード)にchildNmae(子ノード)を連結する
func (g *Graph) AddChild(parentName string, childName string) {
	if parentName == "" || childName == "" || parentName == childName {
		return
	}

	parent := g.nodeForName(parentName)
	child := g.nodeForName(childName)

	if parent == nil || child == nil {
		return
	}

	children := []*node{child}
	parent.addChildren(children)
}

// DisplayChildInfo is method of Graph.
func (g *Graph) DisplayChildInfo(name string) {
	if name == "" {
		fmt.Println("nameが空です。")
		return
	}

	n := g.nodeForName(name)

	if n == nil {
		fmt.Println("name: ", name, " が見つかりません。")
	}

	fmt.Println(*n)
}

//引数のnameと一致するノードポインタを返す
func (g *Graph) nodeForName(name string) *node {
	for i := 0; i < len(g.nodes); i++ {
		if g.nodes[i].name == name {
			return &g.nodes[i]
		}
	}
	return nil
}

//addChildren is method of node.
func (n *node) addChildren(children []*node) {
	n.children = append(n.children, children...)
}

func main() {
	g := NewGraph()
	g.AddNode("A", nil)
	g.AddNode("B", nil)
	g.AddNode("C", nil)

	g.AddChild("A", "B")
	g.AddChild("A", "C")
	g.AddChild("B", "C")
	g.DisplayChildInfo("A")
	g.DisplayChildInfo("B")
	g.DisplayChildInfo("C")
}
