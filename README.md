# classicRTLcode
some classic RTL designs

## Open-Source Tools

- [Icarus Verilog](https://github.com/steveicarus/iverilog) for synthesis.
- [GTKWave](https://gtkwave.sourceforge.net/) for wave viewing.

Some alias

```Bash
alias iveri='iverilog -o compiled -c'
alias irun='vvp compiled'
alias wave='gtkwave'
```

## Verification Methodologies

### SVA

### UVM

## Designs

- **TinyALU_UVM**: a tiny ALU design based on *The UVM Primer*. Verified by UVM.
- **syncFIFO&RAM**: a synchronous FIFO that can push and pop data from a dual port RAM. Verified by SVA.
- **practice**: some simple RTL code for practice.
- **interview_questions**: some small designs and answers to interviews questions from real interviews, mock interviews, related sources.
