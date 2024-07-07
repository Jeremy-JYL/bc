# BC (A Brainfuck Compiler / Transpiler)
This is a fast Compiler / Transpiler power by V.
This Compiler have the optimize by default in the frontend // v0.0.2

# Mandel benchmark
## v0.0.2
| Speed (S) | Flags                   |
|-----------|-------------------------|
| 7.043     | -i test/mandel.bf       |
| 1.073     | -O -i test/mandel.bf    |

## v0.0.1
| Speed (S) | Flags                   |
|-----------|-------------------------|
| 13.860    | -t -i test/mandel.bf    |
| 1.073     | -t -O -i test/mandel.bf |

Note: Those result was test on my MacBook Air with M2 Chip 8G Ram with the time util

# How to install?
First make sure that you have [V compiler](https://www.vlang.io) installed

```
git clone https://github.com/Jeremy-JYL/bc.git
v -prod .
```

# Usage
```
BC v0.0.1
-----------------------------------------------
Usage: BC [options] [ARGS]

Description: Brainfuck Compiler / Transpiler

Options:
  --size <int>              Tape Size
  --type <string>           Tape Type
  -t, --translate           New Line Translation (Off)
  --emitv                   Emit V File
  -O, --optimize            Enable optimize
  -i, --input <string>      File In
  -o, --output <string>     File Out
  -h, --help                display this help and exit
  --version                 output version information and exit
```

# How it work?
```mermaid
flowchart LR;
  UI["User Interface"]
  FR["Front End (Transpiler)"]
  BA["Back End (V Compiler)"]

  UI --> FR;
  FR --> BA;

```
