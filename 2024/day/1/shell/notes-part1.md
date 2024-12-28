# Advent of code 1

## Summary

We first use awk to separate out the columns, then use sort to sort them separately and write them to a temporary file. We then use paste to stick them back together, allowing us to run further awk commands (like subtracting every row). Finally we use awk to sum all the differences.

```sh
#!/bin/sh
awk '{print $1}' input | sort > list1.tmp
awk '{print $2}' input | sort > list2.tmp
paste list1.tmp list2.tmp | awk '{print $2-$1}' | awk '{if ($1>0) { print $1 } else {print -$1} }' | awk '{s+=$1} END {print s}'
rm list1.tmp
rm list2.tmp
```

The code is available on [github](https://github.com/victorelgersma/advent-of-code)

## Explanation / Method

We are given two lists which we need to sort, then create a third list which is the difference of the two lists, and then sum that third list.

We can get the first (second) column with awk using the `print $1` or `print $2` function, as follows: 

```sh
$ awk '{print $2}' input | head
35627
34597
51032
53096
40302
25771
99650
70796
74579
98650
```

Sorting the second list:

```sh
$ awk '{print $2}' input | sort | head 

10010
10083
10303
10537
10899
11086
11111
11171
11314
```

Let's cat these into temporary files, list1.tmp and list2.tmp

I know that awk can allow us to run scripts like '{ print $1-$2}' to find the difference between the files, the issue is how do we create a new file that contains both columns. 

We can do this with paste.

```sh
$ paste list1.tmp list2.tmp | head
10004	10010
10484	10083
10539	10303
10609	10537
10721	10899
10722	11086
10752	11111
11192	11171
11203	11314
```

Looking pretty good! Now we just need to diff these: 

```sh
$ paste list1.tmp list2.tmp | awk '{print $2- $1}'
0
6
-401
-236
-72
178
364
359
-21
111
```

Ok this is nice but we actually want the absolute values

## Making them all positive

```sh
paste list1.tmp list2.tmp | awk '{print $2-$1}' | awk '{if ($1>0) {print $1} else {print -$1} }'| head
```

## Summing numbers with awk

We can sum numbers in awk as follows

```sh
$ echo '1\n2\n3' | awk '{s+=$1} END {print s}'
6
```

Final result:

```sh
$ paste list1.tmp list2.tmp| awk '{print $2-$1}' | awk '{if ($1>0) {print $1}else {print -$1} }' | awk '{s+=$1} END {print s}'
1603498
```

## Debrief

* discovered the `paste` command - an incredible little utility! 

## References

[The Awk Programming Language](https://github.com/cjl3080434008/2014/blob/master/read_book/The%20AWK%20Programming%20Language.pdf)

[Handy Awk Reference](https://www.grymoire.com/Unix/Awk.html)
