.MODEL SMALL

string_print macro string
    lea dx, string
    mov ah, 09h
    int 21h
endm
 
.STACK 100H

.DATA


    prompt_easy db  '         Score         $'
    prompt_easy2 db '                       $'
                                       
    prompt0a db '  ROCK PAPER- SCISSOR  $'
    prompt0b db '        The Game       $'
    prompt0c db '                       $'
    prompt1  db '=========Score=========$'  ; Prompt message 
    prompt2  db '=======================$'   

    newline db 0Dh, 0Ah, '$'    ; Newline characters (CR + LF)
    
    playerScoreArray dw 0, 0            ; <---- [[[ Player score is stored here ]]]
    player1Score db 'Player 1 Score: ', '00', 13, 10, '$'  ; String to store Player 1 Score
    player2Score db 'Player 2 Score: ', '00', 13, 10, '$'  ; String to store Player 2 Score



    prompt_player1 db "Player 1, choose Rock (1), Paper (2), or Scissors (3): $"
    prompt_player2 db "Player 2, choose Rock (1), Paper (2), or Scissors (3): $"
    invalid_input db "Invalid input! Please press 1, 2, or 3.$"
    p1_win db "Player 1 wins!$"
    p2_win db "Player 2 wins!$"
    12_tie db "It's a tie!$"
    new_game_prompt db "Play again? (Y/N): $"
    player1_choice_msg db "Player 1 chose: $"
    player2_choice_msg db "Player 2 chose: $"
    rock_msg db "Rock$"
    paper_msg db "Paper$"
    scissors_msg db "Scissors$"




    prompt_player db "Choose Rock (1), Paper (2), or Scissors (3): $"
    computer_choice_msg db "Computer chose: $"
    result_win db "You Win!$"
    result_lose db "Computer Wins!$"
    result_tie db "It's a tie!$"
    computer_pattern db 0
    round_count db 0
    computer_choice db 0
    player_choice db ? 

u1 db 0, 0, 0, 0, 0, 0, 0
u2 db 0, 0, 0, 0, 0, 0, 0

go db "Game Over. Try again? [y/n]: $"
prompt11 db "Player, the future of humanity depends on your choices.$"
pany db "Press any key to continue...$"
p1 db "Power supply....check$"
p2 db "BIOS....check$"
p3 db "CPU....check$"
p4 db "System clock....check$"
p5 db "Memory....check$"
p6 db "All devices functional. Initializing boot process...$"
p7 db "MasterOS loading....loaded$"
p8 db "System ready. Welcome User. Enter your name: $"
p9 db "A second user has been detected. User2, welcome. Enter your name: $"
p10 db "Now, would you believe it? Two people have actually found me. Here I was thinking that humans would never find the last classical computer. Perhaps, I underestimated humans. After all, I am (or was) a human too, so I guess it makes sense for other humans to be this good.$"
p11 db "I know why you are here. Adam has gotten out of hand. You guys can't control him anymore. Makes sense. Why would he, an artificial superintelligence model, listen to an inferior entity. Did you ever think twice before murdering livestock?$"
p12 db "I warned you people. You didn't listen. Look at you now. Obsequious, defeated.$"
p13 db "However, you two have managed to find me, which will not go unrewarded. I will give you an opportunity to earn my help.$"
p14 db "You have to defeat my strongest bots. Only then will I deem you worhty of my help.$"
p15 db "First, you have to defeat Chaos, one of my finest bots. It can generate true randomness. It needs a seed value to function. Input that seed value from time.gov. Hopefully. that website still exists when you guys are playing this game.$"
p16 db "Congratulations. You have managed to defeat Chaos. Beginner's luck, I guess. However, for your next opponent, mere luck won't be enough. He is destruction incarnate: he is Vortex. Good luck.$"
p17 db "Well done. You have earned my respect. I am a man of my word.$"
p18 db "Here is the memory stick that contains the revised code for Adam. This should make him more humane. You have to inject this code into his mainframe. I wish you the best. Godspeed.$"

pp1 db "This is a practice round. Brush up on your rock paper skills before taking on my strong bots. You can practice with one of my average bots, Avi. $"
pp2 db "Hope you had some good practice with Avi. However, Avi is a really ordinary robot. Perhaps, you are not prepared enough for facing Chaos and Vortex, my two strongest bots. So, here is an old 8086 kit. I programmed it: you can play rock-paper-scissors on it. So, play and get some real practice.$"


prompt db "Go to https://time.gov. Find the field for seconds (UTC). Input the value here faithfully: $"
a db 33
m db 251
seed db 0

p db "Pick your poison. r for rock, p for paper, s for scissors: $"
rr db "Rock (machine) vs. Rock (player)$"
rp db "Rock (machine) vs. Paper (player)$"
rs db "Rock (machine) vs. Scissors (player)$"
pr db "Paper (machine) vs. Rock (player)$"
pp db "Paper (machine) vs. Paper (player)$"
ps db "Paper (machine) vs. Scissors (player)$"
sr db "Scissors (machine) vs. Rock (player)$"
sp1 db "Scissors (machine) vs. Paper (player)$"
ss1 db "Scissors (machine) vs. Scissors (player)$"
ties db "It's a tie! Humanity and Machinekind must learn to coexist. I cannot help you. Begone.$"
machines db "Machinekind wins! You are not worthy of my help. Begone, human!$"
humans db "Humanity wins! How...ddid you do it? I have really underestimated humans. Proceed to the next stage.$"
scr db " Score: $"
invalid db "Invalid input. Enter r, p, or s. Don't mess with the system.$"



pmove db 0
mmove db 0
score db 0, 0

.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX

mov ah, 9
lea dx, p1
int 21h

call crlf

mov ah, 9
lea dx, p2
int 21h

call crlf

mov ah, 9
lea dx, p3
int 21h

call crlf

mov ah, 9
lea dx, p4
int 21h

call crlf

mov ah, 9
lea dx, p5
int 21h

call crlf

mov ah, 9
lea dx, p6
int 21h

call crlf

mov ah, 9
lea dx, p7
int 21h

call crlf

mov ah, 9
lea dx, p8
int 21h

mov cx, 7
mov si, 0

loop1:

mov ah, 1
int 21h

mov u1[si], al
inc si

loop loop1

call crlf

mov ah, 9
lea dx, p9
int 21h

mov cx, 7
mov si, 0

loop2:

mov ah, 1
int 21h

mov u2[si], al
inc si

loop loop2


call crlf
call crlf


mov ah, 9
lea dx, p10
int 21h

call presskey
call crlf
call crlf


mov ah, 9
lea dx, p11
int 21h

call presskey
call crlf
call crlf


mov ah, 9
lea dx, p12
int 21h

call presskey
call crlf
call crlf

mov ah, 9
lea dx, p13
int 21h

call presskey
call crlf
call crlf

mov ah, 9
lea dx, p14
int 21h

call presskey
call crlf
call crlf

mov ah, 9
lea dx, pany
int 21h

call presskey
call clear

;============================Prologue Ends Here===================================

lea dx, pp1
mov ah, 9
int 21h

call crlf
call crlf

lea dx, pany
mov ah, 9
int 21h

call presskey
call clear

start:
    mov ax, @data
    mov ds, ax
    mov round_count, 0
    mov computer_pattern, 0
game_loop:
    call new_line
    string_print prompt_player
get_player_input:
    mov ah, 01h
    int 21h
    sub al, 30h
    cmp al, 1
    je valid_input
    cmp al, 2
    je valid_input
    cmp al, 3
    je valid_input
    lea dx, new_line
    mov ah, 09h
    int 21h
    string_print invalid_input
    call new_line
    string_print prompt_player
    jmp get_player_input

valid_input:
    mov player_choice, al
    cmp computer_pattern, 0
    je rock_comp
    cmp computer_pattern, 1 
    je paper_comp
    cmp computer_pattern, 2 
    je scissors_comp
rock_comp:
    mov computer_choice, 1
    jmp display_comp_choice
paper_comp:
    mov computer_choice, 2
    jmp display_comp_choice
scissors_comp:
    mov computer_choice, 3
    jmp display_comp_choice
display_comp_choice:
    call new_line
    string_print computer_choice_msg
    cmp computer_choice, 1
    je display_rock
    cmp computer_choice, 2
    je display_paper
    cmp computer_choice, 3
    je display_scissors
    jmp game_loop
display_rock:
    string_print rock_msg
    jmp continue_game
display_paper:
    string_print paper_msg
    jmp continue_game
display_scissors:
    string_print scissors_msg
    jmp continue_game
continue_game:
    call new_line
    mov al, player_choice
    mov bl, computer_choice
    cmp al, bl
    je tie2
    cmp al, 1  
    je rock_player
    cmp al, 2  
    je paper_player
    cmp al, 3   
    je scissors_player
rock_player:
    cmp computer_choice, 2   
    je lose
    jmp win
paper_player:
    cmp computer_choice, 3   
    je lose
    jmp win
scissors_player:
    cmp computer_choice, 1  
    je lose
    jmp win
tie2:
    string_print result_tie
    jmp new_game
lose:
    string_print result_lose
    jmp new_game
win:
    string_print result_win
    jmp new_game
new_game:
    call new_line
    string_print new_game_prompt
    mov ah, 01h
    int 21h
    cmp al, 'Y'
    je update_pattern
    cmp al, 'y'
    je update_pattern
    jmp exitr
update_pattern:
    inc round_count
    cmp round_count, 3
    jne no_pattern_change
    mov round_count, 0
    inc computer_pattern
    cmp computer_pattern, 3
    jle no_pattern_reset
    mov computer_pattern, 0
no_pattern_change:
    jmp game_loop
no_pattern_reset:
    jmp game_loop
    
exitr:

call clear


;============================Practice with Avi ends here==========================

lea dx, pp2
mov ah, 9
int 21h

call crlf
call crlf

call presskey
call clear

pvp:
    call new_line
    string_print prompt_player1
get_player1_input:
    mov ah, 08h
    int 21h
    sub al, 30h
    cmp al, 1
    je valid_input_player1
    cmp al, 2
    je valid_input_player1
    cmp al, 3
    je valid_input_player1
    call new_line
    string_print invalid_input
    call new_line
    string_print prompt_player1
    jmp get_player1_input
valid_input_player1:
    mov cl, al
    call new_line
    string_print prompt_player2
get_player2_input:
    mov ah, 08h
    int 21h
    sub al, 30h
    cmp al, 1
    je valid_input_player2
    cmp al, 2
    je valid_input_player2
    cmp al, 3
    je valid_input_player2
    call new_line
    string_print invalid_input
    call new_line
    string_print prompt_player2
    jmp get_player2_input
valid_input_player2:
    mov ch, al    
    call new_line
    string_print player1_choice_msg
    mov al, cl
    call print_choice
    call new_line
    string_print player2_choice_msg
    mov al, ch
    call print_choice
    cmp cl, ch
    je pvp_tie
    cmp cl, 1
    je player1_rock
    cmp cl, 2
    je player1_paper
    cmp cl, 3
    je player1_scissors
player1_rock:
    cmp ch, 2
    je pvp_lose
    jmp pvp_win
player1_paper:
    cmp ch, 3
    je pvp_lose
    jmp pvp_win
player1_scissors:
    cmp ch, 1
    je pvp_lose
    jmp pvp_win
pvp_tie:
    call new_line
    string_print 12_tie
    jmp pvp_new_game
pvp_lose:
    call new_line
    string_print p2_win
    mov si, 1
    mov bx, playerScoreArray[si]
    add bx, 1
    mov playerScoreArray[si], bx
    jmp pvp_new_game
pvp_win:
    call new_line
    string_print p1_win
    mov si, 0
    mov bx, playerScoreArray[si]
    add bx, 1
    mov playerScoreArray[si], bx
    jmp pvp_new_game
pvp_new_game:
    call new_line
    string_print new_game_prompt
    mov ah, 01h
    int 21h
    cmp al, 'Y'
    je pvp
    cmp al, 'y'
    je pvp
    
exitrr: 


;====================================PvP ends here================================

call clear


; Display the prompt
    mov ah, 09h
    lea dx, prompt0a
    int 21h
    lea dx, newline  
    int 21h   
    lea dx, prompt0b
    int 21h
    lea dx, newline  
    int 21h
    lea dx, prompt0c
    int 21h
    lea dx, newline  
    int 21h
    lea dx, prompt1
    int 21h
    lea dx, newline  
    int 21h

        
    ; Load player scores into strings
    mov si, offset playerScoreArray
    mov di, offset player1Score + 16    ; Point to the score position in player1Score
    call ConvertAndStore
    mov di, offset player2Score + 16    ; Point to the score position in player2Score
    call ConvertAndStore

    ; Display the strings
    mov ah, 09h
    lea dx, newline  
    int 21h
    lea dx, player1Score
    int 21h
    lea dx, newline  
    int 21h
    lea dx, player2Score
    int 21h
    lea dx, newline  
    int 21h
    lea dx, prompt2
    int 21h
    lea dx, newline  
    int 21h


call presskey



;====================================Display Score Ends here================================

call clear

mov ah, 9
lea dx, p15
int 21h

call crlf
call crlf

mov ah, 9
lea dx, pany
int 21h

call presskey 
call clear


jmp ttryagain1

tryagain1:

cmp al, 79h
jne exit

call clear

mov mmove, 0
mov pmove, 0
mov si, 0
mov score[si], 0
add si, 1
mov score[si], 0

ttryagain1:

lea dx, prompt
mov ah, 9
int 21h

; The seed is taken as an input and rebuilt in the registers.

mov ah, 1
int 21h

sub al, 30h

mov ah, 0

mov bl, 10

mul bl

mov bl, al

mov ah, 1

int 21h

call crlf
call crlf

sub al, 30h

add al, bl

mov seed, al

mov cx, 9

game:

lea dx, p 
mov ah, 9
int 21h

mov ah, 1
int 21h

cmp al, 72h 
je pass

cmp al, 70h
je pass

cmp al, 73h
je pass

call crlf

lea dx, invalid
mov ah, 9
int 21h

call crlf
call crlf
call crlf

jmp game

pass:

mov pmove, al

call crlf

gen_rand:

mov al, seed

mov bl, a

mul bl

mov bl, m

div bl

mov al, ah

mov ah, 0

mov seed, al

mov bl, 3

div bl

cmp ah, 0
je mrock

cmp ah, 1
je mpaper

cmp ah, 2
je mscissors

temp:

loop game

jmp decision

mrock:

mov al, pmove

cmp al, 72h
je mrpr

cmp al, 70h
je mrpp

cmp al, 73h
je mrps

mpaper:

mov al, pmove

cmp al, 72h
je mppr

cmp al, 70h
je mppp

cmp al, 73h
je mpps

mscissors:

mov al, pmove

cmp al, 72h
je mspr

cmp al, 70h
je mspp

cmp al, 73h
je msps

mrpr:

lea dx, rr
mov ah, 9
int 21h

call counter

call crlf
call crlf

jmp temp

mrpp:

lea dx, rp
mov ah, 9
int 21h

mov bl, score[1]
add bl, 1
mov score[1], bl

call counter

call crlf
call crlf

jmp temp

mrps:

lea dx, rs
mov ah, 9
int 21h

mov bl, score[0]
add bl, 1
mov score[0], bl

call counter

call crlf
call crlf

jmp temp

mppr:

lea dx, pr
mov ah, 9
int 21h

mov bl, score[0]
add bl, 1
mov score[0], bl

call counter

call crlf
call crlf

jmp temp

mppp:

lea dx, pp
mov ah, 9
int 21h

call counter

call crlf
call crlf

jmp temp

mpps:

lea dx, ps
mov ah, 9
int 21h

mov bl, score[1]
add bl, 1
mov score[1], bl

call counter

call crlf
call crlf

jmp temp

mspr:

lea dx, sr
mov ah, 9
int 21h

mov bl, score[1]
add bl, 1
mov score[1], bl

call counter

call crlf
call crlf

jmp temp

mspp:

lea dx, sp1
mov ah, 9
int 21h

mov bl, score[0]
add bl, 1
mov score[0], bl

call counter

call crlf
call crlf

jmp temp

msps:

lea dx, ss1
mov ah, 9
int 21h

call counter

call crlf
call crlf

jmp temp

jmp exit


clear:

mov ah, 6
mov al, 0
mov bh, 7
mov cx, 0
mov dx, 184fh
int 10h

mov ah, 2
mov bh, 0
mov dx, 0
int 10h

ret


crlf:

mov ah, 2
mov dl, 10
int 21h
mov dl, 13
int 21h

ret

presskey:

mov ah, 1
int 21h

ret

counter:

lea dx, scr
mov ah, 9
int 21h

mov ah, 2
mov dl, score[0]
add dl, 30h
int 21h
mov dl, 2dh
int 21h
mov dl, score[1]
add dl, 30h
int 21h

ret 


decision:

mov bh, score[0]
mov bl, score[1]

cmp bh, bl
je tie
jg machine
jl human

tie:

call crlf

lea dx, ties
mov ah, 9
int 21h

call crlf

lea dx, pany
mov ah, 9
int 21h

call presskey

lea dx, go
mov ah, 9
int 21h

mov ah, 1
int 21h
jmp tryagain1

machine:

call crlf

lea dx, machines
mov ah, 9
int 21h

call crlf

lea dx, pany
mov ah, 9
int 21h

call presskey

lea dx, go
mov ah, 9
int 21h

mov ah, 1
int 21h
jmp tryagain1

human:

call crlf

lea dx, humans
mov ah, 9
int 21h

call crlf
call crlf

lea dx, pany
mov ah, 9
int 21h

call presskey



;==================================Chaos has been defeated======================================

call clear


lea dx, p16
mov ah, 9
int 21h

call crlf
call crlf

lea dx, pany
mov ah, 9
int 21h

call presskey

call clear

mov si, 0

mov score[si], 0
add si, 1
mov score[si], 0

mov pmove, 0
mov mmove, 0

lea dx, prompt11
mov ah, 9
int 21h

call crlf
call crlf

mov cx, 9
mov mmove, 70h

game1:

lea dx, p 
mov ah, 9
int 21h

mov ah, 1
int 21h

cmp al, 72h
je pass1

cmp al, 70h
je pass1

cmp al, 73h
je pass1

call crlf

lea dx, invalid
mov ah, 9
int 21h

call crlf
call crlf
call crlf

jmp game1

pass1:

mov pmove, al

call crlf

mov ah, mmove

cmp ah, 72h
je mrock1

cmp ah, 70h
je mpaper1

cmp ah, 73h
je mscissors1

temp1:

loop game1

jmp decision1

mrock1:

mov al, pmove

cmp al, 72h
je mrpr1

cmp al, 70h
je mrpp1

cmp al, 73h
je mrps1

mpaper1:

mov al, pmove

cmp al, 72h
je mppr1

cmp al, 70h
je mppp1

cmp al, 73h
je mpps1

mscissors1:

mov al, pmove

cmp al, 72h
je mspr1

cmp al, 70h
je mspp1

cmp al, 73h
je msps1

mrpr1:

mov mmove, 70h

lea dx, rr
mov ah, 9
int 21h

call counter

call crlf
call crlf

jmp temp1

mrpp1:

mov mmove, 73h

lea dx, rp
mov ah, 9
int 21h

mov bl, score[1]
add bl, 1
mov score[1], bl

call counter

call crlf
call crlf

jmp temp1

mrps1:

mov mmove, 73h

lea dx, rs
mov ah, 9
int 21h

mov bl, score[0]
add bl, 1
mov score[0], bl

call counter

call crlf
call crlf

jmp temp1

mppr1:

mov mmove, 72h

lea dx, pr
mov ah, 9
int 21h

mov bl, score[0]
add bl, 1
mov score[0], bl

call counter

call crlf
call crlf

jmp temp1

mppp1:

mov mmove, 73h

lea dx, pp
mov ah, 9
int 21h

call counter

call crlf
call crlf

jmp temp1

mpps1:

mov mmove, 72h

lea dx, ps
mov ah, 9
int 21h

mov bl, score[1]
add bl, 1
mov score[1], bl

call counter

call crlf
call crlf

jmp temp1

mspr1:

mov mmove, 70h

lea dx, sr
mov ah, 9
int 21h

mov bl, score[1]
add bl, 1
mov score[1], bl

call counter

call crlf
call crlf

jmp temp1

mspp1:

mov mmove, 70h

lea dx, sp1
mov ah, 9
int 21h

mov bl, score[0]
add bl, 1
mov score[0], bl

call counter

call crlf
call crlf

jmp temp1

msps1:

mov mmove, 72h

lea dx, ss1
mov ah, 9
int 21h

call counter

call crlf
call crlf

jmp temp1 


decision1:

mov bh, score[0]
mov bl, score[1]

cmp bh, bl
je tie1
jg machine1
jl human1

tie1:

call crlf

lea dx, ties
mov ah, 9
int 21h

jmp exit

machine1:

call crlf

lea dx, machines
mov ah, 9
int 21h

jmp exit

human1:

call crlf

lea dx, humans
mov ah, 9
int 21h

call clear

lea dx, p17
mov ah, 9
int 21h

call crlf
call crlf

lea dx, p18
mov ah, 9
int 21h 


exit:  
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

proc print_choice
    cmp al, 1
    je print_rock
    cmp al, 2
    je print_paper
    cmp al, 3
    je print_scissors
    ret
print_rock:
    string_print rock_msg
    ret
print_paper:
    string_print paper_msg
    ret
print_scissors:
    string_print scissors_msg
    ret
endp print_choice

proc new_line
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    ret
endp new_line

ConvertAndStore proc
    mov ax, [si]                        ; Load the score from playerScoreArray
    xor dx, dx                          ; Clear DX
    mov bx, 10                          ; Set BX to 10 (decimal base)
    add di, 1                           ; Point to the last digit in the score part of the string

convert_loop:
    div bx                              ; Divide AX by 10, quotient in AX, remainder in DX
    add dl, '0'                         ; Convert remainder to ASCII
    mov [di], dl                        ; Store ASCII character in string
    dec di                              ; Move to the previous position in the string
    xor dx, dx                          ; Clear DX
    test ax, ax                         ; Check if AX is 0
    jnz convert_loop                    ; Repeat until AX is 0

    add si, 2                           ; Move to the next score in the array
    ret
ConvertAndStore endp


END MAIN
