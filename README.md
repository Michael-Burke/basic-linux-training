# What is Linux?
 __Sourced from https://www.linux.com/what-is-linux/__

> Just like Windows, iOS, and Mac OS, Linux is an operating system. In fact, one of the most popular platforms on the planet, Android, is powered by the Linux operating system. An operating system is software that manages all of the hardware resources associated with your desktop or laptop. To put it simply, the operating system manages the communication between your software and your hardware. Without the operating system (OS), the software wouldn’t function.

The Linux operating system comprises several different pieces:

> - **Bootloader** –  The software that manages the boot process of your computer. For most users, this will simply be a splash screen that pops up and eventually goes away to boot into the operating system.
> - **Kernel** – This is the one piece of the whole that is actually called ‘Linux’. The kernel is the core of the system and manages the CPU, memory, and peripheral devices. The kernel is the lowest level of the OS.
> - **Init system** – This is a sub-system that bootstraps the user space and is charged with controlling daemons. One of the most widely used init systems is systemd, which also happens to be one of the most controversial. It is the init system that manages the boot process, once the initial booting is handed over from the bootloader (i.e., GRUB or GRand Unified Bootloader).
> - **Daemons** – These are background services (printing, sound, scheduling, etc.) that either start up during boot or after you log into the desktop.
> - **Graphical server** – This is the sub-system that displays the graphics on your monitor. It is commonly referred to as the X server or just X.
> - **Desktop environment** – This is the piece that the users actually interact with. There are many desktop environments to choose from (GNOME, Cinnamon, Mate, Pantheon, Enlightenment, KDE, Xfce, etc.). Each desktop environment includes built-in applications (such as file managers, configuration tools, web browsers, and games).
> - **Applications** – Desktop environments do not offer the full array of apps. Just like Windows and macOS, Linux offers thousands upon thousands of high-quality software titles that can be easily found and installed. Most modern Linux distributions (more on this below) include App Store-like tools that centralize and simplify application installation. For example, Ubuntu Linux has the Ubuntu Software Center (a rebrand of GNOME Software) which allows you to quickly search among the thousands of apps and install them from one centralized location.

## Resources

[Bash Interpreter](https://www.onlinegdb.com/online_bash_shell#)

## Getting Started and Ready

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

## Exercise 1: fortune, cowsay, and lolcat

We're going to install a few silly packages to understand more about applications, using them, and piping values. The applications are fortune, cowsay, and lolcat.

> - `fortune` is an application that generates a random fortune based on a local database of quotes from the application
> - `cowsay` is an application that displays a cow with a speech bubble in your terminal!
> - `lolcat` takes the STDOUT from another application and rainbow colors the input

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

## Exercise 2: Formating and Find / Replace

You'll want to go learn about REGEX before continuing

**Warning! Hacker information ahead!** Let's say you want to find a specific value in a log file and replace it or remove it to cover your tracks. How can we use piping to make this a small, portable, and easy to run command or script?

First, lets get the log text using `cat` which is short for `concatenate` and will take all the text from your file and print it to the console.

`cat my_secret_log.log`

Now this is nice but you can't do anything with the text. We want to modify it and this is where `sed` comes in. `sed` is "Stream Editor" and takes a 'stream' from STDOUT and can modify it, sort of how some text editors loads all the text into memory so you can edit it and then later save it.
