package main

import (
	"github.com/zhcodingzh/teamwork/cmd"
	pmode "github.com/zhcodingzh/teamwork/config/mode"
)

var (
	version    = "unknown"
	commitHash = "unknown"
	mode       = pmode.Dev
)

func main() {
	pmode.Set(mode)
	cmd.Run(version, commitHash)
}
