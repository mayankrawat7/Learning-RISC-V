# Learning-RISC-V
Working notes on RISC-V architecture — ISA basics, RISC vs CISC, extensions, and what I'm still figuring out
# Learning RISC-V — My Notes 

I'm writing this as I learn RISC-V . This is not a proper article, just my own notes so I understand it better and don't forget it later. I'll keep adding to this as I learn more, so some parts might be incomplete right now.

## Why I'm doing this

I kept seeing RISC-V mentioned along with ARM and x86 but every website explains it in the same way — "open source", "modular", "free" — without really explaining what that means. So I decided to actually go through it properly and write it in my own words instead of just copying definitions.

## What is RISC-V

RISC-V (people say "risk-five") is an ISA. ISA means Instruction Set Architecture — basically it's the set of instructions a processor can understand and run. It's not a physical chip, it's more like a rulebook that chip makers follow when they design a processor.

Some things I learned about it:

- It started at UC Berkeley around 2010
- Now it's managed by an organization called RISC-V International, not one company
- Anyone can use it to make their own chip without paying money or asking permission. This is the big difference from ARM and x86, where you have to pay a license to Arm Holdings or Intel to use their design
- It's based on RISC, which stands for Reduced Instruction Set Computer — meaning the instructions are kept simple

## RISC vs CISC (this confused me at first)

CISC means Complex Instruction Set Computer. x86 is CISC. In CISC one instruction can do many things at once, like reading memory, doing math, and saving the result all in one step.

RISC keeps things simple. Every instruction does one small thing only — like load, or add, or store. It looks slower because you need more instructions to do the same work, but simple instructions are easier for the hardware to run fast, so it balances out.

RISC-V follows this RISC idea but keeps it even more minimal. The basic version only has around 47 instructions, which honestly surprised me because I expected way more.

## The base + extensions thing

This part took me some time to understand properly.

RISC-V doesn't come as one fixed set of instructions. There is a small base set (called RV32I for 32-bit or RV64I for 64-bit) that every RISC-V chip must have. After that, there are extra "extensions" that a chip maker can choose to add if they need them:

- M — for multiply and divide
- A — for atomic operations (used in multi-core stuff, still don't fully get this one)
- F and D — for floating point numbers (single and double precision)
- C — compressed instructions, makes the code smaller

So a small simple device (like a sensor or microcontroller) might only use the base RV32I. But a bigger processor, like something powerful enough to run an OS, would add most of the extensions. That's why people write things like "RV64GC" — G just means a common bundle of extensions.

I think this is actually the most interesting part of RISC-V. It's not one fixed design, it's more like building blocks.

## Registers and instructions (still learning this properly)

- There are 32 general purpose registers, named x0 to x31
- x0 always equals zero, no matter what. At first I thought this was a mistake in my notes but it's actually on purpose. It's used as a shortcut for things like "move" or "negate" without needing separate instructions for them
- Instructions have different formats (R type, I type, S type, etc.) depending on what they do. I still haven't fully understood how the bits are arranged in each format, need to go through this again with actual examples

## Things I still don't understand fully

- How machine mode, supervisor mode and user mode actually work when an OS boots up
- How the compressed (C) extension actually reduces size at the bit level
- Where RISC-V is actually weaker than ARM right now — is it just because ARM has been around longer and has more tools, or is there something architecturally different too

## What I want to do next

- Go through a simple RV32I program instruction by instruction by hand
- Understand the calling convention (how functions pass arguments etc.)
- Compare RISC-V and ARM assembly for the same simple C program
- Read more about privilege levels and interrupts

---

These are just my own learning notes . Might have mistakes, will fix them as I understand things better.