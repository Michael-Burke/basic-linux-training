# What is Piping?

__Sourced from [guru99.com](https://www.guru99.com/linux-pipe-grep.html)__
What is a Pipe in Linux?
The Pipe is a command in Linux that lets you use two or more commands such that output of one command serves as input to the next. In short, the output of each process directly as input to the next one like a pipeline. The symbol ‘|’ denotes a pipe.

Pipes help you mash-up two or more commands at the same time and run them consecutively. You can use powerful commands which can perform complex tasks in a jiffy.

Let us understand this with an example.

When you use ‘cat’ command to view a file which spans multiple pages, the prompt quickly jumps to the last page of the file, and you do not see the content in the middle.

To avoid this, you can pipe the output of the ‘cat’ command to ‘less’ which will show you only one scroll length of content at a time.

```bash
cat filename | less
```

## Why is it useful?

There are a number of reasons you might pipe output from one command into another. Some examples include:

- Finding specifics values in a log, file, or configuration
- Replacing specific values
- Condensing CLI commands into a single continuous command (this also reduces the need for )  
