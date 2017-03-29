# Bash Toolbox

### Table of Contents

1. [Welcome](#welcome)
2. [Getting Started](#getting-started)
3. [Using the toolbox](#using-the-toolbox)
4. [Contributing](#contributing)
5. [Roadmap](#roadmap)

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

```bash
$ git submodule add https://github.com/anthony-chu/bash-toolbox
```

This will clone the `bash-toolbox` project into your current project as a new
subdirectory with the path `bash-toolbox`.

Next, you'll need to make sure to source `init.sh` in every one of your
top-level project files.

`source bash-toolbox/init.sh`

With this one line in your top-level project file(s), you're now able to
leverage the bash-toolbox library.

## Using the toolbox

As previously mentioned, in order to use the toolbox, you'll need to source it:

```bash
source bash-toolbox/init.sh
```

Once you've sourced the init script, you can include any of the bash-toolbox
function classes using the following format:

```bash
include path.to.file.FunctionClassName
```

For example, if your script requires the use of the StringValidator function
class, you'll need to have this in the header of the file after the init source:

```bash
include string.validator.StringValidator
```

Every path is assumed to be within the bash-toolbox directory, so there is no
need to explicitly add the bash-toolbox directory (in fact, you can't; it will
fail to include the specified file). With that, you're ready to use the rest of
the bash-toolbox! Happy coding!

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