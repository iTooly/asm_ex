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

.data

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

.code

	start:
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx

		mov eax, hval(input("Please enter an hexadecimal number: "))
		mov cl, 16

		mov si, 8

	print_input:
		push eax
		print chr$("You have entered: 0x")
		pop eax
		push eax
		print uhex$(eax),13,10
		pop eax

	step:
		push eax
		mov eax, ebx
		mul ecx
		mov ebx, eax
		pop eax

		div ecx
		add ebx, edx

	condition:
		inc si
		jnz step
		mov eax, ebx

	print_result:
		push eax
		print chr$("Result: 0x")
		pop eax
		push eax
		print uhex$(eax),13,10
		pop eax

	exit_prog:
		exit

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

	end start