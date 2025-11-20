# Assembly-Assignment-7
My fifth class assignment for my x86 Assembly class. In this one, we started to learn how to store and restore values in the stack, to avoid passing values using registers.. Uses the Irvine Library.

Instructions: 
Write a complete program that sorts dword unsigned integer array in descending order. Assume that the user doesn’t enter more than 40 integers. You MUST use the template-1-2.asm and follow all the directions there.

Note: you have to review 3 peer assignments.


You can’t add any more procedures to the template.
The procedures can’t use any global variables (variables that are inside .data segment).
The caller of any procedures sends its argument through the stack.
Inside any procedures, if you need to use a register, you have to preserve its original value. You can't use uses, pushad operators.
The callee is in charge of cleaning the stack
Sample run:

Enter up to 40 unsigned dword integers. To end the array, enter 0.

After each element press enter:

1
4
3
8
99
76
34
5
2
17
0
Initial array:
1 4 3 8 99 76 34 5 2 17
Array sorted in descending order:
99 76 34 17 8 5 4 3 2 1
