package slice

//Push is 最後に追加
func Push(slice []int, number int) []int {
	return append(slice, number)
}

//Pop is 最後を削除
func Pop(slice []int) ([]int, int) {
	return slice[:len(slice)-1], slice[len(slice)-1]
}

//Enq is 最初に追加
func Enq(slice []int, number int) []int {
	return append([]int{number}, slice...)
}

//Deq is 最初を削除
func Deq(slice []int) ([]int, int) {
	return slice[1:], slice[0]
}

//Insert is 指定の位置に追加
func Insert(slice []int, number int, idx int) []int {
	//[1 2 3 4], 5, 2
	//[1 2 3 4 0]
	//[1 2 3], [3, 4] = [1 2 3 3 4]
	// [1 2 5 3 4]
	slice = append(slice, 0)
	slice = append(slice[:idx+1], slice[idx:len(slice)-1]...)
	slice[idx] = number
	return slice
}

//Remove is 指定の位置を削除
func Remove(slice []int, idx int) ([]int, int) {
	return append(slice[:idx], slice[idx+1:]...), slice[idx]
}
