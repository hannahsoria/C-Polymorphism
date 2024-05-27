CS333 - Project #5 - README
Hannah Soria
04/14/24

Directory Layout:
Project5_hmsori25/
|
|__/linkedlist.c
|__/linkedlist.h
|__/clltest.c
|__/clltest2.c
|__/linkedlist.swift
|__/cs333_project5_readme.txt

linkedlist.c doesn't compile and run alone
linkedlist.h doesn't compile and run alone

clltest.c
 Compile:
	gcc -o clltest cultist.c linked list.c
 Run:
	./clltest
 Output:
   After initialization
   value: 18
   value: 16
   value: 14
   value: 12
   value: 10
   value: 8
   value: 6
   value: 4
   value: 2
   value: 0

   After squaring
   value: 324
   value: 256
   value: 196
   value: 144
   value: 100
   value: 64
   value: 36
   value: 16
   value: 4
   value: 0

   removed: 16

   Found: 324

   No instance of 11

   After removals
   value: 324
   value: 256
   value: 196
   value: 144
   value: 100
   value: 64
   value: 36
   value: 4
   value: 0

   After append
   value: 324
   value: 256
   value: 196
   value: 144
   value: 100
   value: 64
   value: 36
   value: 4
   value: 0
   value: 11

   After clear

   After appending
   value: 0
   value: 1
   value: 2
   value: 3
   value: 4

   popped: 0
   popped: 1

   After popping
   value: 2
   value: 3
   value: 4

   List size: 3
	

clltest2.c
 Compile:
	gcc -o clltest2 clltest2.c linkedlist.c
 Run:
	./clltest2
 Output:
   After initialization
   value: 18.000000
   value: 16.000000
   value: 14.000000
   value: 12.000000
   value: 10.000000
   value: 8.000000
   value: 6.000000
   value: 4.000000
   value: 2.000000
   value: 0.000000

   After squaring
   value: 324.000000
   value: 256.000000
   value: 196.000000
   value: 144.000000
   value: 100.000000
   value: 64.000000
   value: 36.000000
   value: 16.000000
   value: 4.000000
   value: 0.000000

   removed: 16.000000

   Found: 324.000000

   No instance of 11.000000

   After removals
   value: 324.000000
   value: 256.000000
   value: 196.000000
   value: 144.000000
   value: 100.000000
   value: 64.000000
   value: 36.000000
   value: 4.000000
   value: 0.000000

   After append
   value: 324.000000
   value: 256.000000
   value: 196.000000
   value: 144.000000
   value: 100.000000
   value: 64.000000
   value: 36.000000
   value: 4.000000
   value: 0.000000
   value: 11.000000

   After clear

   After appending
   value: 0.000000
   value: 1.000000
   value: 2.000000
   value: 3.000000
   value: 4.000000

   popped: 0.000000
   popped: 1.000000

   After popping
   value: 2.000000
   value: 3.000000
   value: 4.000000

   List size: 3

linkedlist.swift
 Compile:
	swiftc linkedlist.swift
 Run:
	./linkedlist
 Output:
    TESTING FOR INTEGERS

   List size: 10

   value: 18
   value: 16
   value: 14
   value: 12
   value: 10
   value: 8
   value: 6
   value: 4
   value: 2
   value: 0


   value: 324
   value: 256
   value: 196
   value: 144
   value: 100
   value: 64
   value: 36
   value: 16
   value: 4
   value: 0

   After removing 16:

   removed:  16

   List size: 9

   No instance of the target found for ll_find

   After appending 16:
   value: 324
   value: 256
   value: 196
   value: 144
   value: 100
   value: 64
   value: 36
   value: 4
   value: 0
   value: 16

   Clearing the values:
   Cleared value: 324
   Cleared value: 256
   Cleared value: 196
   Cleared value: 144
   Cleared value: 100
   Cleared value: 64
   Cleared value: 36
   Cleared value: 4
   Cleared value: 0
   Cleared value: 16

   List size: 0

   After appending
   value: 0
   value: 1
   value: 2
   value: 3
   value: 4

   Popped: 0

   After popping
   value: 1
   value: 2
   value: 3
   value: 4

   List size: 4

   -----------------------------

   TESTING FOR DOUBLES

   List size: 10

   value: 18.0
   value: 16.0
   value: 14.0
   value: 12.0
   value: 10.0
   value: 8.0
   value: 6.0
   value: 4.0
   value: 2.0
   value: 0.0


   value: 324.0
   value: 256.0
   value: 196.0
   value: 144.0
   value: 100.0
   value: 64.0
   value: 36.0
   value: 16.0
   value: 4.0
   value: 0.0

   After removing 16.0:

   removed2:  16.0

   List size: 9

   No instance of the target found for ll_find

   After appending 16:
   value: 324.0
   value: 256.0
   value: 196.0
   value: 144.0
   value: 100.0
   value: 64.0
   value: 36.0
   value: 4.0
   value: 0.0
   value: 16.0

   Clearing the values:
   Cleared value: 324.0
   Cleared value: 256.0
   Cleared value: 196.0
   Cleared value: 144.0
   Cleared value: 100.0
   Cleared value: 64.0
   Cleared value: 36.0
   Cleared value: 4.0
   Cleared value: 0.0
   Cleared value: 16.0

   List size: 0

   After appending
   value: 0.0
   value: 1.0
   value: 2.0
   value: 3.0
   value: 4.0

   Popped: 0.0

   After popping
   value: 1.0
   value: 2.0
   value: 3.0
   value: 4.0

   List size: 4
