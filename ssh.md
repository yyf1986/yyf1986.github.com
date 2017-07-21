#### ssh
```
package main

import (
	"flag"
	"fmt"
	"os"
	"strings"
	"sync"
	"time"

	"golang.org/x/crypto/ssh"
)

func connect(user, password, host string, port int) (*ssh.Session, error) {
	var (
		auth         []ssh.AuthMethod
		addr         string
		clientConfig *ssh.ClientConfig
		client       *ssh.Client
		session      *ssh.Session
		err          error
	)
	// get auth method
	auth = make([]ssh.AuthMethod, 0)
	auth = append(auth, ssh.Password(password))

	clientConfig = &ssh.ClientConfig{
		User:            user,
		Auth:            auth,
		HostKeyCallback: ssh.InsecureIgnoreHostKey(),
		Timeout:         3 * time.Second,
	}

	// connet to ssh
	addr = fmt.Sprintf("%s:%d", host, port)

	if client, err = ssh.Dial("tcp", addr, clientConfig); err != nil {
		return nil, err
	}

	// create session
	if session, err = client.NewSession(); err != nil {
		return nil, err
	}

	return session, nil
}

func run(username, password, ip, cmd string, port int) {
	session, err := connect(username, password, ip, port)
	if err != nil {
		fmt.Println("=========="+ip+"==========\n", "Please check agrs or username/password is ok")
		<-c
		wg.Done()
	} else {
		defer session.Close()
		//直接输出到屏幕
		//session.Stdout = os.Stdout
		//session.Stderr = os.Stderr
		//session.Run(cmd)
		ret, err := session.Output(cmd)
		if err != nil {
			fmt.Println("=========="+ip+"==========\n", "Please check command")
		} else {
			fmt.Println("=========="+ip+"===========\n", string(ret))
		}
		<-c
		wg.Done()
	}
}

func help() {
	help := `
	-ip 服务器IP，多个IP逗号分隔
	-port 服务器端口号
	-ssh_username 服务器用户名
	-ssh_password 服务器密码
	-cmd 需要执行的命令
	-h help
	        `
	fmt.Println(help)
}

var c = make(chan int, 50)
var wg sync.WaitGroup

func main() {
	if len(os.Args) <= 1 {
		help()
		os.Exit(0)
	}
	if os.Args[1] == "-h" {
		help()
	} else {
		ip := flag.String("ip", "", "ip,[ip],[ip],...")
		port := flag.Int("port", 22, "ssh port")
		username := flag.String("ssh_username", "root", "ssh username")
		password := flag.String("ssh_password", "root", "ssh password")
		cmd := flag.String("cmd", "", "run command")

		flag.Parse()
		ips := strings.Split(*ip, ",")
		for _, ip := range ips {
			c <- 1
			go run(*username, *password, ip, *cmd, *port)
			wg.Add(1)
		}
		wg.Wait()
	}

```
