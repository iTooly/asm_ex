; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

		.486																		; create 32 bit code
		.model flat, stdcall										; 32 bit memory model
		option casemap :none										; case sensitive

		include \masm32\include\windows.inc
		include \masm32\macros\macros.asm

		; -----------------------------------------------------------------
		; include files that have MASM format prototypes for function calls
		; -----------------------------------------------------------------
		include \masm32\include\masm32.inc
		include \masm32\include\gdi32.inc
		include \masm32\include\user32.inc
		include \masm32\include\kernel32.inc
		include \masm32\include\msvcrt.inc

		; ------------------------------------------------
		; Library files that have definitions for function
		; exports and tested reliable prebuilt code.
		; ------------------------------------------------
		includelib \masm32\lib\masm32.lib
		includelib \masm32\lib\gdi32.lib
		includelib \masm32\lib\user32.lib
		includelib \masm32\lib\kernel32.lib
		includelib \masm32\lib\msvcrt.lib

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

.data
	msg	db 'Please enter a number:', 00h

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

.code

	start:
		mov eax, uval(input("Please enter a number: "))
		mov ebx, uval(input("Please enter a number: "))
		mov ecx, uval(input("Please enter a number: "))

		cmp ebx, ecx
		jg ebx_bigger

		mov ebx, ecx

		ebx_bigger:
			cmp eax, ebx
			jg print_value

			mov eax, ebx

	print_value:
		movzx eax, bl
		print str$(eax),13,10
		jmp exit_prog

	exit_prog:
		exit

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

	end start