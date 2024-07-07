# BC (A Brainfuck Compiler / Transpiler)
This is a fast Compiler / Transpiler power by V.

This Compiler have the optimize by default in the frontend // > v0.0.2

# Mandel benchmark
## v0.0.3 (C backend)
| Speed (S) | Flags                                  |
|-----------|----------------------------------------|
| 1.448     | -b c -i test/mandel.bf                 |
| 0.638     | -b c -O -i test/mandel.bf              |

## v0.0.2 & v0.0.3 (V backend)
| Speed (S) | Flags                   |
|-----------|-------------------------|
| 7.043     | -i test/mandel.bf       |
| 1.073     | -O -i test/mandel.bf    |

## v0.0.1 (V backend)
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
BC v0.0.3
-----------------------------------------------
Usage: BC [options] [ARGS]

Description: Brainfuck Compiler / Transpiler

Options:
  -b, --backend <string>    Backend (V, C)
  --size <int>              Tape Size
  -t, --translate           New Line Translation (Off)
  -k, --keep                Keep
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

# Note
Recommend clang user use the cflag -Ofast to boost more performance // Look at the comment at `src/main.v`
