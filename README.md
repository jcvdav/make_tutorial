# `Make` tutorial

End-to-end reproducibility

-------------

## TL; DR

- Clone this repo (make sure to start a new Rproject associated with it)
- Check that you have `GNU Make` on your device
- Make sure you have these three packages installed: `here`, `tidyverse`, `modelsummary`

-------------

## The goal

We'll simulate everyone's nightmare:

- You have built your "coding pipeline" (see `scripts` and `draft.Rmd`) and are ready to do something with it
- Then, you (or a colleague) finds an error in the raw data (crisis!!!)
- You fix the error, and now have to rerun the ENTIRE analysis (which script did what, again? What depended on what?)
- By the time you are done figuring this out, you've also gotten your hands on more data so... gotta re-run everything again

The solution to this: one file (`Makefile`) and one command: `Make`

## What you'll need

### Get the materials

This repository contains everything we'll need for the session. Having `git` installed will make it easier (simply clone this repo). But, if you don't have it yet you can either [follow this other tutorial](https://github.com/eco-data-science/github-intro) or, simply download the entire thing as a compressed folder.

### Do I have `GNU make`?

Open a terminal (or use the `Terminal` pane in RStudio) and type:

```
make -v                                     #checks version of GNU make
```

Should show something like this (really, anything that is not an error _should_ work):

```
>GNU Make 3.81
>Copyright (C) 2006  Free Software Foundation, Inc.
>This is free software; see the source for copying conditions.
>There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
>PARTICULAR PURPOSE.
```

Don't have it? This might help:

- [Mac homebrew formulae](https://formulae.brew.sh/formula/make)
- [Windows solutions](https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows)

### R packages

There are two options to make sure you have all the dependencies for this project.

Simply use the included `renv` environment:

```
renv::restore()                                # Follow the instructions
```

OR, manually install them if you don't already have them

```
renv::deactivate()                             # Deactivate the renv environment first
pkgs <- c("tidyverse", "here", "modelsummary") # List of packages needed
lapply(pkgs, install.packages)                 # Install all packages
```

### Optional dependencies

- [makefile2graph](https://github.com/lindenb/makefile2graph.git) To convert your makefile into a graph
- [graphviz](https://www.graphviz.org/) To visualize that graph

To install both, follow the instructions [here](https://gist.github.com/carlislerainey/9a1e49cb195076165a4f07a683ce05a7#setting-up)

## Other resources

### General

- [GNU Make documentation](https://www.gnu.org/software/make/)
- [Great example from simple to complex](https://kbroman.org/minimal_make/)
- [Cool short example of makefile2graph and graphviz](https://gist.github.com/carlislerainey/9a1e49cb195076165a4f07a683ce05a7)

### R-specific:

- [drake](https://github.com/ropensci/drake)
- [makeR]()