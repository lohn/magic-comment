# Magic Comment

Magic Comment is a little tool that allows you to quickly
add or modify the magic comments that indicate source file
encoding for an entire directory structure, please note that
this tool only sets the comments, and does not perform any
file encoding conversion whatsoever.

If you are looking for a way to convert files to a specific encoding, check out iconv (GNU)

I originally wrote this to get rid of "invalid multibyte char (US-ASCII)"
errors when writing strings containing non ascii characters like éöàüèä
in ruby on rails controllers

## Installation

```
gem install magic-comment
```

## Usage

you can pass the path to where you want the tool to run.

```
magic-comment [path1 [path2 ...]]
```

this will prepend every ".rb", ".rake" and ".haml" file in the working directory (recursively) with the following line :

```
# coding: utf-8
```

Notes :
- existing magic comments are replaced
- the rest of the file remains unchanged
