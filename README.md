# BC (A Brainfuck Compiler / Transpiler)
This is a fast Compiler / Transpiler power by V.
With the optimize flag 92% performance increased.

# Mandel benchmark
| Speed (S) | Flags                   |
|-----------|-------------------------|
| 13.860    | -t -i test/mandel.bf    |
| 1.073     | -t -O -i test/mandel.bf |

# How it work?
```mermaid
flowchart LR;
  UI["User Interface"]
  FR["Front End (Transpiler)"]
  BA["Back End (V Compiler)"]

  UI --> FR;
  FR --> BA;

```
