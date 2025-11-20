


Title Assignment 7

COMMENT !
*****************
date:
*****************
!

include irvine32.inc
; ===============================================
.data
  
  ; Fill your data here

;=================================================
.code
main proc

  
    
	; FILL YOUR CODE HERE 
	; YOU NEED TO CALL ENTER_ELEM, SORT_ARR AND PRINT_ARR PROCEDURES
	; 
	
   

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
	
    ; FILL YOUR CODE HERE

enter_elem endp

; ================================================
; void print_arr(arr_addr,arr_len)
;
; Input:
;   ?
; Output:
;   ?
; Operation:
;  print out the array
;

print_arr proc

  ; FILL YOUR CODE HERE

print_arr endp

; ================================================
; void sort_arr(arr_addr,arr_len)
;
; Input:
;   ?
; Output:
;   ?
; Operation:
;   sort the array
;

sort_arr proc

   ; FILL YOUR CODE HERE
   ; YOU NEED TO CALL COMPARE_AND_SWAP PROCEDURE 

sort_arr endp

; ===============================================
; void compare_and_swap(x_addr,y_addr)
;
; Input:
;   ?
; Output:
;   ?
; Operation:
;  compare and call SWAP ONLY IF Y < X 
;

compare_and_swap proc

   ; FILL YOUR CODE HERE
   ; YOU NEED TO CALL SWAP PROCEDURE 

compare_and_swap endp

; =================================================
; void swap(x_addr,y_addr)
;
; Input:
;   ?
; Output:
;   ?
; Operation:
;  swap the two inputs
;

swap proc

   ; FILL YOUR CODE HERE

swap endp

end main