# 5-stage-RISC-V-pipelined-processor
RISC-V processor
* This project contains 5-stage pipelined RISC-V processor in Verilog
* Key details of this project are:
  - The datapath supports R-type, I-type, S-type, B-type, J-type, U-type instructions
  - Zero register which does not change the value
  - Forwarding Unit for managing Data Hazards (Ex hazard and Mem hazard)
  - Stalling Unit that stalls the processor for a clock cycle (that is inserts a bubble in the instructions)
  - Branching Unit for predicting the branch dynamically using 2-bit saturation counter
  - Flushing Unit for removing all the instructions in the pipe, if the predicted branch is incorrect
  - Load and Store instructions supports byte, half word and full word (32 bit) transfer
* This processor supports execution of the below instructions

![risc-v](https://user-images.githubusercontent.com/66362155/176839231-f831babd-5c43-4d68-9c85-c8158f8d4cab.png)
> Reference image credits: https://www.studocu.com/en-us/document/new-york-university/computer-architecture/riscv-card-riscv-instructions-list/18454935
