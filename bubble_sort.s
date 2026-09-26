.data
array:      .word 5, 3, 8, 1, 9, 2
size:       .word 6

.text
main:
    la   s0, array       # s0 = base address of the array
    lw   s1, size         # s1 = number of elements (n)
    addi s2, s1, -1        # s2 = outer loop counter, counts down from n-1

outer_loop:
    beqz s2, done            # if outer counter hit 0, we're done sorting

    li   s3, 0                # s3 = inner loop index j, resets each pass
    addi s4, s1, -1            # s4 = how far the inner loop should go (n-1)

inner_loop:
    bge  s3, s4, next_pass       # if j >= n-1, this pass is finished

    slli t0, s3, 2                # t0 = j * 4 (word offset)
    add  t1, s0, t0                 # t1 = address of array[j]
    lw   t2, 0(t1)                   # t2 = array[j]
    lw   t3, 4(t1)                    # t3 = array[j+1]

    ble  t2, t3, no_swap                # already in order, skip the swap

    sw   t3, 0(t1)                       # array[j] = old array[j+1]
    sw   t2, 4(t1)                        # array[j+1] = old array[j]

no_swap:
    addi s3, s3, 1                # j++
    j    inner_loop

next_pass:
    addi s2, s2, -1               # one full pass done, decrease outer counter
    j    outer_loop

done:
    li   a7, 10                     # exit syscall
    ecall