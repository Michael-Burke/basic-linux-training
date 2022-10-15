# What is Piping?

__Sourced from [guru99.com][https://www.guru99.com/linux-pipe-grep.html]__
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

## Excercise 1: fortune, cowsay, and lolcat

We're going to install a few silly packages to understand more about applications, using them, and piping values. The applications are fortune, cowsay, and lolcat.

> `fortune` is an application that generates a random fortune based on a local database of quotes from the application
> `cowsay` is an application that displays a cow with a speech bubble in your terminal!
> `lolcat` takes the STDOUT from another application and rainbow colors the input

```bash
# The below commands puts runs as an Admin (root), tells the linux Advanced Packaging Tool (APT) to `install` the three applications
sudo apt-get install fortune cowsay lolcat

# You can remove them just as easily with the same command but replacing `install` with `remove`
```

Now that you have those three applications, lets try and get the output of one as the input into another

```bash
# This tells the application `fortune` to run and the `|` sends what is generated, or the standard output (STDOUT) to the next application as an INPUT. Cowsay then takes the INPUT and uses it and prints to the console.
fortune | cowsay

# Lets add some flare:
fortune | cowsay | lolcat
```

If successful, you should have a multi-colored cow and fortune printed in your terminal!

## Excercise 2: Formating and Find / Replace

You'll want to go learn about REGEX before continuing

Warning! Hacker information ahead! Let's say you want to find a specific value in a log file and replace it or remove it to cover your tracks. How can we use piping to make this a small, portable, and easy to run command or script?

First, lets get the log text using `cat` which is short for `concatenate` and will take all the text from your file and print it to the console.

`cat my_secret_log.log`

Now this is nice but you can't do anything with the text. We want to modify it and this is where `sed` comes in. `sed` is "Stream Editor" and takes a 'stream' from STDOUT and can modify it, sort of how some text editors loads all the text into memory so you can edit it and then later save it.
