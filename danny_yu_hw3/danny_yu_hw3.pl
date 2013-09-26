/*
    CS471 - Programming Languages
    Assignment 3 due: 9.25.13
    Author: Yu, Danny (dyu6)
    Date: 9.22.13
 */
/* Rename this file to include your username and add the extension ".pl" */
/* Purpose:
 * to practice writing relations in Prolog
 
   This assignment is not intended to be hard, however many students will need
   time to absorb how easy it really is. So dont get discouraged. 
   Most require only two clauses and none require more than 3 clauses.
   You should add the extension ".pl" to the file name.   
 */

/*1: Exercise 3.2 from "Learn Prolog Now!" See
http://cs.union.edu/~striegnk/learn-prolog-now/html/node27.html#subsec.l3.ex3
for explanation. 
   (Note: the functor is sucC not succ since succ is a built in predicate.)
  Define a predicate grt_than/2 that takes two numerals in the notation 
  that we introduced in this lecture (i.e. 0, sucC(0), sucC(sucC(0)) ...) as 
  arguments and decides whether the first one is greater than the second one. 
    e.g:
       ?- grt_than(sucC(sucC(sucC(0))),sucC(0)).
       true .
       ?- grt_than(sucC(sucC(0)),sucC(sucC(sucC(0)))).
       false.
       ?- grt_than(sucC(0),sucC(0)).
       false.
    
     sucC is an example of using nested terms. (This can be done with 2 clauses.)
*/

grt_than(sucC(_), 0).
grt_than(sucC(X), sucC(Y)) :- grt_than(X,Y).

/* Got help from...
Source: http://stackoverflow.com/questions/11485007/prolog-greater-than-2-succ
*/

/*2: Define a predicate grtThan(Lst1, Lst2), such that it succeeds if list  
     Lst1 has a greater length (more items) than list Lst2.  Use a recursive definition.  
     DO NOT USE the built in predicate  "length". e.g.
          ?- grtThan([1,2,3],[a,b]).
          true
          ?- grtThan([1,2],[a,b,c]).
          false
          ?- grtThan([1,2],[a,b]).
          false
          
    (This can be done with 2 clauses.)
  */

grtThan([_],[]).  
grtThan([H1|T1],[H2|T2]) :- grtThan(T1,T2).

/*3: Define a predicate equivalentL1(Lst1, Lst2), such that it succeeds if 
     the firsts items of list Lst2 are in the same order as the equivalent items      in list Lst1 and all the items in list Lst1 have equivalent items in Lst2.
     Use a recursive definition. Lst1 and Lst2 may be the same length.
          ?- equivalentL1([1,2,3],[1,2]).
          false.
          ?- equivalentL1([1,2,3],[1,2,3]).
          true.
          ?- equivalentL1([1,2,3],[3,2,1]).
          false.
          ?- equivalentL1([1,2],[1,2,3,4]).
          true.  
          
  */
equivalentL1([],_).
equivalentL1([H1|T1],[H2|T2]) :- H1=H2, equivalentL1(T1,T2).


/* 4: Define a predicate hasSubseq(L,S), such that it succeeds if the list L 
      contains the list S as a sub-sequence of equivalent items. 
      Use a recursive definition.
      e.g. 
      ?-hasSubseq([a,g,b,d],[g,b]). 
      true .
      ?- hasSubseq([a,g,b,d],[g,d]). 
      true .
      ?- hasSubseq([a,g,b,d],[b,g]).
      false.
      
      (This can be done with 3 clauses.)
      
   */

hasSubseq([],[]).
hasSubseq([H1|T1],[H2|T2]) :- H1=H2, hasSubseq(T1,T2).
hasSubseq([H1|T1],X) :- hasSubseq(T1,X).


/*5: Define a predicate init(Lst, InitOfLst) succeeds if InitOfLst is the same 
     as Lst except the last element of Lst is missing. i.e. 
     ?- init([a,b,c,d,e],Init). 
     Init= [a, b, c, d] 
     true
     
     (This can be done with 2 clauses.)
 */
init([_],[]).
init([H1|T1],[H2|T2]) :- H1=H2, init(T1,T2).


/* 6: Define a predicate nth(Num,Lst,Element), such that it succeeds if the 
      variable Element is unified with the Numth element of the list Lst . 
      The count starts with 0.
E.g.
     ?- nth(3,[a,b,c,d,e,f,g],E).
     E = d .
     
      (This can be done with 2 clauses.)
*/
nth(0,[X|_],X).
nth(Count,[H|T],E) :- X is Count-1, nth(X,T,E).

/*
Got help from...
Source: https://github.com/amarshall/CS471/blob/master/Homework3/homework3.pl
*/

/*7: Define the procedure 'zip' so that zip(Lst1,Lst2,Zipped) succeeds if
     Zipped is a list of sequences (tuples) . The first value of the sequence 
     is from the corresponding position from Lst1 and the second value is from 
     corresponding position from Lst2. Note: The length of Zipped will be the
     minimum of the length of Lst1 and length of Lst2. e.g.
           ?- zip([1,2,3,4],[a,b,c],Z).
           Z = [ (1, a), (2, b), (3, c)] .

           ?- zip([a],[1,2,3,4],Z).
           Z = [ (a, 1)] .

           ?- zip([a],[],[(a,a)]).
           false.
           
      (This can be done with 3 clauses.)
*/

zip(_,[],[]).
zip([],_,[]).
zip([H1|T1],[H2|T2],Z) :- Z=[(H1,H2)|T3], zip(T1,T2,T3).
