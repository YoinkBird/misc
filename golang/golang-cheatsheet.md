Explicit and literal/anonymous 
```go
## Arrays and Slices

var a [2]int // array
var a = [2]int{1,2}
   a := [2]int{1,2}

var a []int
var a = []int {1, 2, 3, 4}
   a := []int{1, 2, 3, 4}

## Maps

m := make(map[string]int)

var m = map[string]Vertex

## Structs
struct {} // empty struct

type Vertex struct

point := struct { 
  X,Y int
}{1,2}

## Interfaces

type Awesomizer interface {
Awesomize() string
}

## Pointers
p := Vertex{1,2}
r := &Vertex{1,2}
var t *Vertex = &p
var s *Vertex = new(Vertex)
*s = Vertex{-1,-1}
```
