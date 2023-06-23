; 70Hz vsync fix for Hand386
; Copyright (c) 2023 Ian Scott
; Licensed under the BSD 3-clause license (see COPYING)
;
; This sets the C&T 65535 to "CRT mode" to allow it to have vertical sync ranges outside
; of the 60Hz that it gets forced to because it's in flat panel mode. The Hand386 uses
; a Realtek flat panel controller that takes a VGA signal, and it has no problem syncing
; to the 70Hz VGA modes.

; References: Chips & Technology 65535 datasheet, available at: 
; https://www.yyzkevin.com/pc110/65535-2/

org 100h

section .text

start:
    ; Extension index register
    mov dx,3d6h
    ; XR51 display type register
    mov al,51h
    ; Write to register
    out dx,al
    ; Extension register
    mov dx,3d7h
    ; Initial Boot-Up Extension Register Values for VGA Display on an Analog CRT Monitor 
    mov al,63h
    ; Write to register
    out dx,al
    
    ; Select video mode 3 (80x25, 70Hz)
    mov ah,0
    mov al,3
    int 10h

    mov al,6eh
    mov bl,byte [82h]
    cmp al,bl
    je noblue

    ; Clear the screen with a blue background to help auto-adjust
    mov ah, 06h
    mov al, 00h
    mov bh, 17h
    mov cx, 0000h
    mov dx, 184fh
    int 10h

    ; Output a string
    mov ah,09h
    mov dx,message
    int 21h
    
    ; Output a string
    mov ah,09h
    mov dx,bluemsg
    int 21h

    ; Exit program
    int 20h

noblue:
    ; Output a string
    mov ah,09h
    mov dx,message
    int 21h
    
    ; Exit program
    int 20h
    
section .data

message:
    db 'Hand386 70Hz vsync fix (c) 2023 Ian Scott',13,10,'60Hz forced video now disabled!',13,10,'$'

bluemsg:
    db 'Setting blue background to help autoadjust.',13,10,'Run "handfix n" to leave default background.',13,10,'$'
