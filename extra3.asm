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

	.code

	start:
		mov eax, uval(input("Enter position of a fibonachi number: "))
		call fibonachi

	print_result:
		print str$(eax),13,10

	fibonachi:
		push esi
		push ebp
		push esp
		push ebx
		push edi

		cmp eax, 0
		je continue

		cmp eax, 1
		je continue

		push eax
		sub eax, 1
		call fibonachi
		mov ebx, eax
		pop eax

		sub eax, 2
		push ebx
		call fibonachi
		pop ebx
		add eax, ebx

		continue:

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