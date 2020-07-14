# :package: toledo

A fast and extremely minimal shell prompt with git tracking.

## Features

- Fast
- Minimal
- Lightweight
- Works on `BASH`, `ZSH`, `DASH`, `YASH`. Sorry `ASH`.

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [What is it?](#What-Is-It)
* [Installation](#installation)
* [Prompt Character](#Prompt-Character)

<!-- vim-markdown-toc -->


## What Is It

`toledo` was an attempt to create a minimal prompt that had git functionality. It's a slew of borrowed ideas that worked well together.


## Installation

**Manual**

```
git clone 
https://github.com/mmatongo/toledo.git
```

***

``` .
# Inside your .bashrc, .zshrc, etc.
. /path/to/toledo
```


## Prompt Character

You can customize the prompt character by modifying the lambda `λ` sign on line [17](https://github.com/mmatongo/toledo/blob/master/toledo#L17) .

```
export PS1="\$(parse_git_dirty) λ "
```
