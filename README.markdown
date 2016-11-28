# Bash Toolbox

### Table of Contents

1. [Welcome](#welcome)
2. [Getting Started](#getting-started)
3. [Contributing](#contributing)
4. [Roadmap](#roadmap)

## Welcome

Welcome to the bash-toolbox project! The bash-toolbox project was born out of
the `build-tool` project, which you can learn about [here](
https://github.com/anthony-chu/build-tool). As a result of a move towards
modularity and reusability, the `src` directory, which contained the scripts
that now reside in the bash-toolbox project, was born. It housed all of the core
functionality of the build-tool project and was reusable across all of the
various scripts within the build-tool project.

It only made sense that, as the project moved towards increased modularity, the
next logical step was to migrate the contents of the build-tool `src` directory
into its own submodule. This, then, is that next logical step.

## Getting started

To start leverage the bash-toolbox library, navigate to your existing project
and execute the following:

```
$ git submodule add https://github.com/anthony-chu/bash-toolbox
```

This will clone the `bash-toolbox` project into your current project as a new
subdirectory with the path `bash-toolbox`.

Next, you'll need to make sure to source `init.sh` in every one of your
top-level project files.

`source bash-toolbox/init.sh`

With this one line in your top-level project file(s), you're now able to
leverage the bash-toolbox library.

## Contributing

Improvements are greatly valued, so please avail yourself to contributing to the
`bash-toolbox` project. In order to do so, you'll need to have a fork of the
project along with a local clone of the repo (not just the submodule clone). You
will be able to submit pull requests from there as you would any other project.

Feel free to also open issues found during the use of this project. No project
is perfect, as we ourselves as the originators of our different projects are not
perfect either.

## Roadmap

Some upcoming features of the bash-toolbox project to look forward to:

- [ ] Documentation of the various functions within the bash-toolbox project