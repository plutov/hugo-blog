+++
date = "2017-03-28T17:31:07+07:00"
title = "Practice Go. Build Word"
tags = [ "Go", "Golang", "practice-go" ]
type = "post"
+++

Seems like [previous exercise](https://github.com/plutov/practice-go/tree/master/sumdecimal) is a quite difficult to implement :) Here is a [new one](https://github.com/plutov/practice-go/tree/master/buildword).

### Build Word

You have a `word` in lowercase. Your task is to write this word using the `fragments` you are given. Each element of fragments can be used more than once, but they cannot overlap. It is guaranteed that it's always possible to write the word using the given fragments.

What is the minimum number of elements you have to use? Return 0 if it's not possible to build a word.

### Example

```
// bu + uild + wo + rd
BuildWord("buildword", []string{"buil", "dwor", "bu", "uild", "wo", "rd"}) = 4
```

### Run tests with benchmarks

```
go test -bench .
```
