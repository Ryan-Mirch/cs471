/*
 CS471 - Programming Languages
 Lab #3
 Author: Yu, Danny (dyu6)
 Date: 9.19.13

1A.
a) A relation is a set of ordered pairs
b) A function is a set of ordered pairs, but each x element is associated with only one f element

B. Is every function a relation? If false, give a counter example.
Yes.

C. Is every relation a function? If false, give a counter example.
    False. f: {(1,2), (1,4)} would be a relation, but not a function because 1 maps to two different values.

4A. Which of the following sequences of characters are atoms, which are variables, which are complex terms(structures)? Give the functor and arity of each complex term.
1. loves(aBoy,mia)
   functor: loves
   arity: 2 (aBoy, mia)
   aBoy: atom
   mia: atom

2. boxer(Butch)
   functor: boxer
   arity: 1
   Butch: variable

3. and(big(X), kahuna(X))
   functor: and
   arity: 2
   big(X): complex term
           functor: big
           X: variable
           arity: 1
   kahuna(X): complex term
             functor: kahuna
             X: variable
             arity:1
4. hide(X, big(big(aBoy)))
   functor: hide
   arity: 2
   X: variable
   big(big(aBoy)): complex term
                   functor: big
                   arity: 1
                   big(aBoy): complex term
                              functor: big
                              aBoy: atom
                              arity: 1

B. How many facts, rules, clauses, and predicates are there in the following knowledge base? What are the heads of the rules, and what are the goals they contain?
	likes(sam,Food) :-
	     indian(Food),
	     mild(Food).
	likes(sam,Food) :-
	     italian(Food).
	indian(curry).
	indian(tandoori).
	mild(tandoori).
	italian(pizza).

facts: 4
clauses: 6
rules: 2

*/

/*Q1*/
second(X,Y) :- X=pair(A,B), B=Y.

/*Q2*/
secondF(pair(A,B), B).

/*Q3*/
mother(mary, ann).
mother(mary, joe).
mother(sue, marY). 
mother(sue,mary).

father(mike, ann).
father(mike, joe).
father(tom,mary).

grandparent(sue, ann). 

male(joe).
male(mike).
male(tom).

female(mary).
female(ann).
female(sue).

parent(P,C) :- mother(P, C).
parent(P,C) :- father(P, C).

/*Q4*/
daughter(P,C) :- mother(P, C), female(C).
daughter(P,C) :- father(P, C), female(C).

/*Q5*/
last([X],X).
last([_|Xs],Y) :- last(Xs,Y).

/*Q6*/
isOrdered([]).
isOrdered([_]).
isOrdered([X,Y|T]) :- X < Y, isOrdered([Y|T]).

/*Q7*/
pyth(X,Y,Z) :- Z is X*X + Y*Y.

/*Q8*/
sumOfLst([],0).
sumOfLst([X],X).
sumOfLst([H|T], Sum) :- sumOfLst(T, Nt), Sum is Nt+H. 
