# `Make` tutorial

-------------

## TL; DR

- Check that you have `GNU Make` on your device
- Make sure you have these three packages installed: `here`, `tidyverse`, `modelsummary`
- DON'T CLONE/FORK UNTL THIS BULLET IS GONE

-------------

> **Don't clone or fork this just yet!** (I'll be making some last-minute changes on the dev-branch. Once this text is gone, you should be ok to clone)

## The goal

We'll simulate everyone's nightmaare:

- You have built your "coding pipeline" (see `scripts` and `draft.Rmd`) and are ready to do something with it
- Then, you (or a colleague) finds an error in the raw data (crisis!!!)
- You fix the error, and now have to rerun the ENTIRE analysis (which script did what, again? What depended on what?)
- By the time you are done figuring this out, you've also gotten your hands on more data so... gotta re-run everything again

The solution to this: one file (`Makefile`) and one command: `Make`

## What you'll need

### Do I have `GNU Make`?

Open a terminal (or use the `Terminal` pane in RStudio) and type:

```
make -v #checks version of GNU make
```

Should show something like this (really, anything that is not an error _should_ work):

```
>GNU Make 3.81
>Copyright (C) 2006  Free Software Foundation, Inc.
>This is free software; see the source for copying conditions.
>There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
>PARTICULAR PURPOSE.
```

https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows

### R packages

There are two options to make sure you have all the dependencies for this project.

Simply use the included `renv` environment:

```
renv::restore() # Follow the instructions
```

OR, manually install them if you don't already have them

```
renv::deactivate()                             # Deactivate the renv environment first
pkgs <- c("tidyverse", "here", "modelsummary") # List of packages needed
lapply(pkgs, install.packages)                 # Install all packages
```

## Other resources

### General

- [Great example from simple to complex](https://kbroman.org/minimal_make/)
- [GNU Make documentation](https://www.gnu.org/software/make/)

### R-specific:

- [drake](https://github.com/ropensci/drake)
- [makeR]()