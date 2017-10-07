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

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

.code

	start:
		xor eax, eax
		xor ecx, ecx

		mov ecx, uval(input("Check if the number is power of 2: "))
		mov eax, ecx
		dec ecx

		and eax, ecx
		jz print_result

		mov eax, 0FFFFFFFFh

	print_result:
		push eax
		print chr$("0x")
		pop eax
		print uhex$(eax),13,10

	exit_prog:
		exit

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

	end start