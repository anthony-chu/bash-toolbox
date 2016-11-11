# Bash Toolbox

### Table of Contents

1. [Welcome](#welcome)
2. [Getting Started](#getting-started)
3. [Roadmap](#roadmap)

## Welcome

Welcome to the bash-toolbox project! The bash-toolbox project was born out of
the `build-tool` project, which you can learn about [here](
	https://github.com/anthony-chu/build-tool). As a result of a move towards
modularity and reusability, the `src` directory, which contained the scripts
that now reside in the bash-toolbox project, was born. It housed all of the core
functionality of the build-tool project and was reusable across all of the
various scripts within the build-tool project.

It only made sense that, as the next move towards modularity, the next step was
to migrate the contents of the build-tool `src` directory into its own
submodule. This, then, is that next step.

## Getting started

To start leverage the bash-toolbox library, navigate to your existing project
and execute the following:

```
$ git submodule add https://github.com/anthony-chu/bash-toolbox
```

This will clone the `bash-toolbox` project into your current project as a new
subdirectory with the path `bash-toolbox`.

Next, you'll need a few additional files. In order to properly leverage the
`include` and `colorme` functions found throughout this project, you'll need to
create a `lib` directory in your project directory. In your lib directory, add
these following two files:

- [colorme.sh](
	https://github.com/anthony-chu/build-tool/blob/master/lib/colorme.sh)
- [include.sh](
	https://github.com/anthony-chu/build-tool/blob/master/lib/include.sh)

Lastly, you'll need to create an init.sh script like
[this](https://github.com/anthony-chu/build-tool/blob/master/.init.sh) and
source this init script in all your project files. You're now ready to leverage
the bash-toolbox project

## Roadmap

Some upcoming features of the bash-toolbox project to look forward to:

- [ ] Documentation of the various functions within the bash-toolbox project