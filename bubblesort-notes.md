# Bubble Sort in RISC-V

I wanted to try something more than just writing small instructions, so I picked bubble sort since it's a sorting algorithm I already know from my programming classes, and I tried to actually write it out in RISC-V assembly instead of just C or Python.

## What bubble sort actually does (in case I forget later)

It goes through the array again and again. Every time it looks at two numbers next to each other, and if they are in the wrong order it swaps them. It keeps doing full passes over the array until nothing needs to be swapped anymore, which means the array is sorted. It's not the fastest sorting method but it's the easiest to understand and write by hand.

## How I built it

- The array is stored in `.data` as 6 numbers: `5, 3, 8, 1, 9, 2`
- `s0` holds the starting address of the array, so I can find any element by adding an offset to it
- `s1` holds how many elements there are (6 in this case)
- I used two loops, like I would in a normal programming language:
  - the **outer loop** (`s2`) counts how many full passes are left
  - the **inner loop** (`s3`) walks through the array comparing pairs

## The part that confused me the most

Since RISC-V doesn't have arrays like a normal language, I had to calculate the memory address myself every time. Each number takes 4 bytes, so to get to `array[j]` I had to do `j * 4` and add that to the base address. I used `slli t0, s3, 2` for this, which means "shift left by 2", and shifting left by 2 is the same as multiplying by 4. Took me a while to actually understand why shifting does multiplication like that.

## Comparing and swapping

- `lw` loads the two numbers I want to compare into registers
- `ble` checks if the first one is less than or equal to the second one — if yes, they're already in order so I skip the swap
- if not, I just store them back in the opposite order using `sw`

## What I'd like to improve

- Right now it always compares the same number of pairs every pass, even though the last few elements are already sorted after each pass — a real bubble sort can skip those to be a bit faster
- Add a way to actually print the sorted array at the end so I can check the output instead of just trusting the logic
- Try implementing a different sort (maybe selection sort) to compare how much simpler or harder it is in assembly
