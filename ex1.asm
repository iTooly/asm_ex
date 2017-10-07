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

		; ------------------------------------------------
		; Library files that have definitions for function
		; exports and tested reliable prebuilt code.
		; ------------------------------------------------
		includelib \masm32\lib\masm32.lib
		includelib \masm32\lib\gdi32.lib
		includelib \masm32\lib\user32.lib
		includelib \masm32\lib\kernel32.lib

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

	.code

	start:
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		mov ecx, 64h

	increment:
		inc ebx
		add eax, ebx
		cmp ebx, ecx
		jl increment

	print_value:
		print str$(eax),13,10

	exit:
		exit

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

	end start