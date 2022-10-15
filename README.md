# Linux CLI and Bash Scripting Practice

The purpose of this repository is to practice Linux CLI and bash scripting. There is an explaination of what Linux is, some resources, Getting Ready steps, and then 3 exercise to ease you into using Linux CLI and Bash Scripting!

__Note:__ This is still very much a work in progress!

## What is Linux?
 __Sourced from https://www.linux.com/what-is-linux/__

Just like Windows, iOS, and Mac OS, Linux is an operating system. In fact, one of the most popular platforms on the planet, Android, is powered by the Linux operating system. An operating system is software that manages all of the hardware resources associated with your desktop or laptop. To put it simply, the operating system manages the communication between your software and your hardware. Without the operating system (OS), the software wouldn’t function.

The Linux operating system comprises several different pieces:

> - **Bootloader** –  The software that manages the boot process of your computer. For most users, this will simply be a splash screen that pops up and eventually goes away to boot into the operating system.
> - **Kernel** – This is the one piece of the whole that is actually called ‘Linux’. The kernel is the core of the system and manages the CPU, memory, and peripheral devices. The kernel is the lowest level of the OS.
> - **Init system** – This is a sub-system that bootstraps the user space and is charged with controlling daemons. One of the most widely used init systems is systemd, which also happens to be one of the most controversial. It is the init system that manages the boot process, once the initial booting is handed over from the bootloader (i.e., GRUB or GRand Unified Bootloader).
> - **Daemons** – These are background services (printing, sound, scheduling, etc.) that either start up during boot or after you log into the desktop.
> - **Graphical server** – This is the sub-system that displays the graphics on your monitor. It is commonly referred to as the X server or just X.
> - **Desktop environment** – This is the piece that the users actually interact with. There are many desktop environments to choose from (GNOME, Cinnamon, Mate, Pantheon, Enlightenment, KDE, Xfce, etc.). Each desktop environment includes built-in applications (such as file managers, configuration tools, web browsers, and games).
> - **Applications** – Desktop environments do not offer the full array of apps. Just like Windows and macOS, Linux offers thousands upon thousands of high-quality software titles that can be easily found and installed. Most modern Linux distributions (more on this below) include App Store-like tools that centralize and simplify application installation. For example, Ubuntu Linux has the Ubuntu Software Center (a rebrand of GNOME Software) which allows you to quickly search among the thousands of apps and install them from one centralized location.

## Resources

- [Online Bash Interpreter](https://www.onlinegdb.com/online_bash_shell#)
- [Git for Windows](https://gitforwindows.org/)
- [REGEX Easy Mode](https://regexr.com/)

## Getting Ready for the Exercises

For the following training, you'll need access to the following:

- linux command line (CLI), Linux/MAC OS, or Windows Subsystem for Linux (WSL)(see below)
- `git` CLI installed
  - Linux: `sudo apt-get install git`
  - Windows: [Git for Windows](https://gitforwindows.org/)

Once you have the above, create a folder in which you can create and practice in and open a terminal in that working directory.

### Git Clone
For the Exercises, it will be helpful to have access to the files and documentation. This can be pulled locally with:

`git clone https://github.com/Michael-Burke/basic-linux-training.git`

This will create a file duplicate of all the training materials.

### WSL Install

Open the Windows Store and search for `Ubuntu`, and 'get' the un-versioned Ubuntu.

It may ask state: "Please enable the Virtual Machine Platform Windows feature and ensure virtualization is enabled in the BIOS." In this case you'll need to enable this in your BIOS and in Windows Features to get access to WSL.

## Exercise 1: Concerning Piping, STDIN, and STDOUT

We're going to install a few silly packages to understand more about applications, using them, piping values, and STDIN/STDOUT.

The applications we're going to use are fortune, cowsay, and lolcat.

- `fortune` is an application that generates a random fortune based on a local database of quotes from the application
- `cowsay` is an application that displays a cow with a speech bubble in your terminal!
- `lolcat` takes the STDOUT from another application and rainbow colors the input

```bash
# The below commands runs as an Admin (root) and tells the Linux Advanced Packaging Tool (APT) to `install` the three applications
sudo apt-get install fortune cowsay lolcat

# You can remove them just as easily with the same command but replacing `install` with `remove`
```

Now that you have those three applications, lets try and get the output of one as the input into another

```bash
# This tells the application `fortune` to run and the `|` sends what is generated, or the standard output (STDOUT) to the next application as an INPUT or STDIN. Cowsay then takes the STDIN, processes it and prints it to the console:
fortune | cowsay

# Lets add some flare:
fortune | cowsay | lolcat
```

If successful, you should have a multi-colored cow and your own fortune-cookie style fortune printed in your terminal!

## Exercise 2: Find and Replace

You'll want to go learn about REGEX before continuing

We want to modify a log file in a single command. First lets get our log file and make a copy: `cp ./exercise-2/my_secret_log_log ./my_log_copy.log`. Next, lets look at the log text using `cat` which is short for `concatenate` and will take all the text from your file and print it to the console.

`cat my_log_copy.log`

Now this is nice but you can't do anything with the text. We want to modify it and this is where `sed` comes in. `sed` is "Stream Editor" and takes a 'stream' from STDOUT and can modify it, sort of how some text editors loads all the text into memory so you can edit it and then later save it.

Using `sed` we can modify the standard INPUT or 'STDIN' from our first `cat` command and use Regular Expression (REGEX) to filter/find/replace values. Given our log file, we can find and replace who created the logs:

```bash
cat my_log_copy.log | sed -E 's/HACKER/EMPLOYEE/' > my_modified_secret_log.log
cat my_modified_secret_log.log

# If we want to merely look for a string in a file you can use `grep`. This searches through the file to find the pattern "PID" and prints anywhere it finds it.
cat my_modified_secret_log.log | grep PID
```

We first read the file using `cat` and then pipe it into `sed` which uses a REGEX (`-E`) pattern to find (-s) the first pattern (__HACKER__) and replace it with (__EMPLOYEE__), and then output the stream (`>`) to a file (`my_modified_secret_log.log`). Using these tools you could replace a hostname incorrectly used multiple times in a 1500 line config file!

A useful website for learning about Regex and how to use it is [Regexr](https://regexr.com/)

## Exercise 3: Bash Scripting

`bash` scripting is taking Linux CLI commands and putting them into a file that will then execute those commands in a seperate shell, like an `.exe` file.

Start by creating a file: `touch script.sh` and then give it execute privilege: `chmod +x script.sh`.

Edit the script with nano/vim and at the top, start with `#!/bin/bash`. A clever mnemonic to remember that is "Sha-Bang-Wack".

The following is basic examples of commands, variable declaration, if statements, for loops, while conditionals, and a practical example at the bottom.

```bash
#!/bin/bash

# Prints the value to the terminal
echo "Hello User"

# Basic variable declaration
my_string_var="String"
my_number_var=5
my_true_bool_var=True
my_false_bool_var=False

# Basic IF statement structure; notice I'm using the variable with a `$` preceeding it.
if [-z $my_string_var ]
    then
        echo "My Value is TRUE"
    else
        echo "My Value is FALSE"
fi

# Basic FOR LOOP structure
for i in {1..5} # this is a number range from 0 to 5
    do
        echo "Hello number $i!"
    done

# Basic While statement structure
while [ $my_number_var -lt 5 ]
do
   counter=$(( $my_number_var - 1 ))
   echo "$my_number_var"
done

# Get all files ending with '.yml' and then move them into a new directory for '.yml' files
mkdir yaml_files_dir
for $i in $(ls *.yml)
do
    mv $i ./yaml_files_dir/$i
done

```
