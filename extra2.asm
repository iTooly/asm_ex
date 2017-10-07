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

	str1 db "Hello", 0
	str2 db "Hello", 0

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

	.code

	start:
		mov esi, offset str1
		mov edi, offset str2
		call strcmp

	print_result:
		print str$(eax),13,10

	strcmp:
		push esi
		push ebp
		push esp
		push ebx
		push edi

		mov ecx, sizeof str1
		repz cmpsb
		mov eax, -1
		jnz result
		mov eax, 0

		result:

		pop esi
		pop ebp
		pop esp
		pop ebx
		pop edi

		ret

	exit:
		exit

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

	end start