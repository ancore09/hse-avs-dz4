    .intel_syntax noprefix
    .text
	.section	.rodata
.LC0:
	.string	"%lld\n"
    .text
	.globl	main
	.type	main, @function
main:
    push rbp            # preambule
    mov rbp, rsp
    mov rax, 1          # rax stores last computed factorial
    mov rcx, 2          # rcx stores current number
    mov rdi, 1          # rdi stores previous number
loop0:
    mul rcx             # compute factorial of current number using previous factorial
    jo end              # if overflow, exit
    mov rdi, rcx        # store current number in rdi
    inc rcx             # increment current number
    jmp loop0           # loop
end:
    mov rsi, rdi        # print last successfully computed factorial
    lea	rdi, .LC0[rip]  # load format string
    call	printf@PLT  # print
    mov	rax, 0          # return 0
    mov rsp, rbp        # epilogue
    pop rbp
    ret
    .size	main, .-main
