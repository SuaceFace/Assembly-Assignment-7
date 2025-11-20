


Title Assignment 7

COMMENT !
*****************
date: Nov 19 2025
Description: accepts up to 40 integers as input from user. Prints out values as an array. Sorts the array, the prints out the sorted array(sorted from greatest to smallest)
*****************
!

include irvine32.inc
; ===============================================
.data
  
  ; Fill your data here
  prompt1 BYTE "Enter up to 40 unsigned dword integers. To end the array, enter 0.",0
  prompt2 BYTE "After each element press enter:",0
  output1 BYTE "Initial array:",0
  output2 BYTE "Array sorted in descending order:",0
  myArray DWORD 40 DUP(?)
  arraySize DWORD ?


;=================================================
.code
main proc
	mov edx, offset prompt1		;print input prompts
	call writeString
	call crlf
	mov edx, offset prompt2
	call writeString
	call crlf

	sub esp, 4					;reserve a dword for arraySize
	push offset myArray	
	call enter_elem				;enter elements
	pop eax
	mov arraySize, eax			;store returned dword in arraySize

	mov edx, offset output1
	call writeString
	call crlf

	push arraySize				
	push offset myArray
	call print_arr				;print array normally

	push arraySize
	push offset myArray
	call sort_arr				;sort the array. Pass arraySize and myArray address
   
   call crlf
   mov edx, offset output2
   call writeString
   call crlf

   push arraySize
   push offset myArray
   call print_arr				;print sorted array

   exit
main endp

; ================================================
; int enter_elem(arr_addr)
;
; Input:
;   ARR_ADDRESS THROUGH THE STACK
; Output:
;   ARR_LENGTH THROUGH THE STACK
; Operation:
;   Fill the array and count the number of elements
;
enter_elem proc
	push ebp
	mov ebp, esp
	push ecx
    mov ecx, 40						;loop counter
	push ebx
	mov ebx, [ebp+8]


	InputLoop: 
		call readDec
		cmp eax, 0
		je ExitLoop				;if user enters 0, exit loop. Done with inputs.
		mov [ebx], eax				;save those numbers in a 32-bit integer array.
		add ebx, 4		;shift address
	LOOP InputLoop

	ExitLoop:
	mov eax, 40
	sub eax, ecx					;This is the count of how many values were stored.
	mov [ebp+12], eax
	pop ebx							;restore values
	pop ecx
	pop ebp
	ret 4							;cleans stack of input.
enter_elem endp

; ================================================
; void print_arr(arr_addr,arr_len)
;
; Input:
;   2 DWORDS passed via the stack. arr_addr(an address for an array) and arr_len(the length of that array)
; Output:
;   No return value. 
; Operation:
;  print out the array with space between values.
;

print_arr proc
  push ebp
   mov ebp, esp
   push eax
   push ebx
   push ecx
   mov ecx, [ebp+12] ; loop counter
   mov ebx, [ebp+8]		;array offset

	PrintLoop: 
		mov eax, [ebx]
		call writeDec
		mov al, ' '
		call writeChar
		add ebx, DWORD
	LOOP PrintLoop

	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret 8

print_arr endp

; ================================================
; void sort_arr(arr_addr,arr_len)
;
; Input:
;   2 dwords, arrayaddress and arraylength
; Output:
;   No values returned
; Operation:
;   sort the array
;

sort_arr proc

   ; FILL YOUR CODE HERE
   ; YOU NEED TO CALL COMPARE_AND_SWAP PROCEDURE 
   push ebp
   mov ebp, esp
   push eax
   push ebx
   push ecx
   mov ecx, [ebp+12] ;loop counter
   dec ecx			;outer loop at n-1
   
	SortOuterLoop: 
		;I'm going to brute force a really crappy bubble sort
		push ecx
		mov ebx, [ebp+8]		;Begin each inner loop at array offset
		mov ecx, [ebp+12]		;inner loop does n iterations
		SortInnerLoop:
			push ebx
			add ebx, DWORD		
			push ebx			;Passes address of two values in array to compare_and_swap
			call compare_and_swap
		LOOP SortInnerLoop
		pop ecx
	LOOP SortOuterLoop
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret 8
sort_arr endp

; ===============================================
; void compare_and_swap(x_addr,y_addr)
;
; Input:
;   2 dwords, val_address1 and val_address2
; Output:
;   No return values
; Operation:
;  compare and call SWAP ONLY IF Y < X 
;

compare_and_swap proc

   ; FILL YOUR CODE HERE
   ; YOU NEED TO CALL SWAP PROCEDURE 
   push ebp
   mov ebp, esp
   push eax					
   push ebx	
   push ecx
   push edx

   mov eax, [ebp+8]			;eax = y
   mov ebx, [ebp+12]		;ebx = x
   mov ecx, [ebx]			;dereference
   mov edx, [eax]			;dereference
   cmp ecx, edx
   jl PerformSwap			; if(y < x) {performSwap();}
   jmp Complete				; else{noSwap}
   PerformSwap:
	push eax
	push ebx
	call swap

	Complete:
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret 8

compare_and_swap endp

; =================================================
; void swap(x_addr,y_addr)
;
; Input: 2 dwords, val_address1 and val_address2

;   
; Output:
;   No return values
; Operation:
;  swap the two inputs
;

swap proc
	push ebp
   mov ebp, esp
   push eax				;store values
   push ebx
   push ecx
   push edx

   mov eax, [ebp+8]      
   mov ebx, [ebp+12]    
   mov edx, [eax]        ;This stores the values, then puts them back swapped. eax and ebx are addresses, which is why this is so jank.
   mov ecx, [ebx]        
   mov [eax], ecx        
   mov [ebx], edx 

   pop edx				;restore values
   pop ecx
   pop ebx
   pop eax
   pop ebp
   ret 8				;clean inputs

swap endp

end main
COMMENT @
Sample Run:
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
C:\Users\20631837\Desktop\Project32_VS2022\Debug\Project.exe (process 11372) exited with code 0.
@