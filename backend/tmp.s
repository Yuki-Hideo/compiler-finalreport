IO:
	.string "%lld"
	.text
	.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	.data
L1:	.string "You must give 2 integers.\n"
	.text
	leaq L1(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L2:	.string "First integer: "
	.text
	leaq L2(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq %rax, %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq scanf
	.data
L3:	.string "Second integer: "
	.text
	leaq L3(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -16(%rax), %rax
	movq %rax, %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq scanf
	movq %rbp, %rax
	leaq -8(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	leaq -24(%rax), %rax
	popq (%rax)
	movq %rbp, %rax
	leaq -16(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	leaq -32(%rax), %rax
	popq (%rax)
	movq %rbp, %rax
	leaq -24(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	leaq -32(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq %rbx
	popq %rax
	cqto
	idivq %rbx
	pushq %rdx
	movq %rbp, %rax
	leaq -48(%rax), %rax
	popq (%rax)
	.data
L4:	.string "1: "
	.text
	leaq L4(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -48(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L5:	.string "\n"
	.text
	leaq L5(%rip), %rdi
	movq $0, %rax
	callq printf
	pushq $10
	movq %rbp, %rax
	leaq -56(%rax), %rax
	popq (%rax)
	movq %rbp, %rax
	leaq -56(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	leaq -32(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq %rbx
	popq %rax
	movq $1, %rcx
	cmpq $0, %rbx
	jle L6
L6:
	imulq %rax, %rcx
	decq %rbx
	cmpq $0, %rbx
	jg L6
	pushq %rcx
	movq %rbp, %rax
	leaq -64(%rax), %rax
	popq (%rax)
	.data
L7:	.string "2&3: "
	.text
	leaq L7(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -64(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L8:	.string "\n"
	.text
	leaq L8(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -24(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	leaq -72(%rax), %rax
	popq (%rax)
	movq %rbp, %rax
	leaq -72(%rax), %rax
	movq (%rax), %rbx
	pushq %rbx
	incq %rbx
	movq %rbx, (%rax)
	movq %rbp, %rax
	leaq -56(%rax), %rax
	popq (%rax)
	.data
L9:	.string "4: "
	.text
	leaq L9(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -56(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L10:	.string "  "
	.text
	leaq L10(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -56(%rax), %rax
	movq (%rax), %rbx
	pushq %rbx
	incq %rbx
	movq %rbx, (%rax)
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L11:	.string "  "
	.text
	leaq L11(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -56(%rax), %rax
	movq (%rax), %rbx
	pushq %rbx
	incq %rbx
	movq %rbx, (%rax)
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L12:	.string "  "
	.text
	leaq L12(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -56(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L13:	.string "  "
	.text
	leaq L13(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -56(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L14:	.string "\n"
	.text
	leaq L14(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -24(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	leaq -80(%rax), %rax
	popq (%rax)
	movq %rbp, %rax
	leaq -24(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	movq %rbp, %rax
	leaq -32(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq %rax
	addq %rax, (%rsp)
	movq %rbp, %rax
	leaq -80(%rax), %rax
	popq (%rax)
	.data
L15:	.string "5 first + second: "
	.text
	leaq L15(%rip), %rdi
	movq $0, %rax
	callq printf
	movq %rbp, %rax
	leaq -80(%rax), %rax
	movq (%rax), %rax
	pushq %rax
	popq  %rsi
	leaq IO(%rip), %rdi
	movq $0, %rax
	callq printf
	.data
L16:	.string "\n"
	.text
	leaq L16(%rip), %rdi
	movq $0, %rax
	callq printf
	leaveq
	retq
