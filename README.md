# `Make` tutorial

## What you'll need

There are two options to make sure you have all the dependencies for this project. You can either manually install the following packages:

Simply use the included `renv` environment:

```
renv::restore() # Follwo the instructions
```

OR, manually install them if you don't already have them

```
renv::deactivate()                             # Deactivate the renv environment first
pkgs <- c("tidyverse", "here", "modelsummary") # List of packages needed
lapply(pkgs, install.packages)                 # Install all packages
```

## The goal

We'll simulate everyone's nightmaare:

- You have built your "coding pipeline" (see `scripts` and `draft.Rmd`) and are ready to do something with it
- Then, you (or a colleague) finds an error in the raw data (crisis!!!)
- You fix the error, and now have to rerun the ENTIRE analysis (which script did what, again? What depended on what?)
- By the time you are done figuring this out, you've also gotten your hands on more data so... gotta re-run everything again

The solution to this: one file (`Makefile`) and one command: `Make`

## Other resources

### General

- [Great example from simple to complex](https://kbroman.org/minimal_make/)
- [GNU Make documentation](https://www.gnu.org/software/make/)

### R-specific:

- [drake](https://github.com/ropensci/drake)
- [makeR]()