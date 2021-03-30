#lab4-gomez
#Jasmin Gomez Heredia
#CSC35 - Section 01
#
#1. Assemble : as-o lab1-gomez.o lab1-gomez.asm
#2. Link : ld -o a.out lab1-gomez.o csc35.o
#3. execute: a.out


.intel_syntax noprefix
.data

welcome:
        .ascii "Welcome to the Hogwarts House Sorter \n\0"
        .ascii "The sorting hat has been placed and we shall see what awaits..\n\0"
        .ascii "                         \n\0"
power:
      	.ascii "Do you enjoy power or control over others ? (y/n) \n\0"
        .ascii "                        \n\0"

self:
     	.ascii "Do you agree that it is better to help yourself ? (y/n)\n\0 "
        .ascii "                           \n\0"

intelc:
       	.ascii "Do you enjoy reading and learning ? (y/n) \n\0"
        .ascii "                             \n\0"

slytherin:
	.ascii "Slytherin will help you on your way to greatness!\n\0"
        .ascii "                               \n\0"

gryffindor:
	.ascii "Their daring, nerve and chivalry set Gryffindors apart!\n\0"
        .ascii "                 \n\0"

ravenclaw:
	.ascii "Welcome to Ravenclaw-Wit beyond measure is man's greatest treasure! \n\0"
        .ascii "                     \n\0"

hufflepuff:
	.ascii "You belong in Hufflepuff, where they are kind and loyal.\n\0"
        .ascii "                         \n\0"

bye:
    	.ascii "Welcome to your new house at Hogwarts !\n\0 "
        .ascii "                         \n\0"

.text
.global _start

_start:
       	#displays welcome message
        lea rbx, welcome
        call PrintCString
        #starts off the conditionals with the first tier of the chart
        lea rbx, power
        call PrintCString
        call ScanChar
        cmp bl, 121
        JE selfish # if yes -> jump equal then displays selfish message
        JNE smart # if no -> jump equal displays the smart message

        #default message if conditionals fail
        lea rbx,  bye
        call PrintCString
        call EndProgram

selfish:
        lea rbx, self
        call PrintCString
        call ScanChar
        cmp bl, 121
        JE S # if yes -> jump equal then displays slytherin message
        JNE G # if no -> jump equal displays the smart message

smart:
      	lea rbx, intelc
        call PrintCString
        call ScanChar
        cmp bl, 121
        JE R
	JNE H

S:
  	lea rbx, slytherin
        call PrintCString
        call EndProgram

G:
  	lea rbx, gryffindor
        call PrintCString
        call EndProgram


R:
  	lea rbx, ravenclaw
        call PrintCString
        call EndProgram

H:
  	lea rbx, hufflepuff
        call PrintCString
        call EndProgram

