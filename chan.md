#### 带缓冲的chan
```
package main

import (
	"fmt"
	"time"
	"sync"
)

func run() {
	time.Sleep(time.Second * 20)
	fmt.Println("recive",<-a)
	wg.Done()

}
var a = make(chan int,20)
var wg sync.WaitGroup
func main() {
	for i:= 1; i < 100; i++ {
		a <- i
		fmt.Println("send message",i)
		wg.Add(1)
		go run()
		
	}
	
	wg.Wait()
}
```

#### 不带缓冲的chan
```
package main

import (
	"fmt"
	"time"
)

// 不带缓冲的chan
func run(i int) {
	time.Sleep(time.Second * 2)
	fmt.Println(i)
	fmt.Println("close",<-a)
}

var a = make(chan int)

func main() {

	for i:= 1; i < 10; i++ {
		fmt.Println("send message",i)
		go run(i)
		a <- i
	}
}
```
#### WaitGroup
```
package main

import (
	"fmt"
	"time"
	"sync"
)

func run(i int) {
	time.Sleep(time.Second * 20)
	fmt.Println(i)
	wg.Done()

}
var a = make(chan int,2)
var wg sync.WaitGroup
func main() {
	for i:= 1; i < 100; i++ {
		fmt.Println("send message",i)
		wg.Add(1)
		go run(i)
		
	}
	
	wg.Wait()
}
```
