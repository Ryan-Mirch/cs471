/*
    Danny Yu (dyu6)
    CS471 - Lab 4
    9.26.13
*/

/* Q1. Code an Ackermann's predicate in prolog using this definition.  What is the Ackermann's number for your implementation?

Ackermann number is 7.
*/

ack(0,N,Val) :- Val is N+1.
ack(M,0,Val) :- M>0, M2 is M-1, ack(M2,1,Val).
ack(M,N,Val) :- M>0, N>0, M2 is M-1, N2 is N-1, ack(M,N2,Val2), ack(M2,Val2,Val).

/* Q2. Define homoiconic. Is Prolog homoiconic? What does it mean to say a language is fully reflective? Is Prolog fully reflective?                           
                                                                                
Homoiconic means that the programming language can represent itself as well as modify itself. It eliminates the need to translate between internal/external (data structure/syntactic) representations of the program. Yes, Prolog is homoiconic - a running Prolog program can add/remove clauses to its database and it can represent itself. A fully reflective language is able to create relationships, rules, structures, and database by itself to find a solution. However, Prolog is not a fully reflective language. It is only close to one. 

Source: p. 561-562 of Programming Language Pragmatics
http://www.acarlstein.com/?p=720
*/

/* Q4. Define a predicate, listOfTerms(ListOfArgs,Name, ListOfResults),  where each term in the ListOfResults is a term with one argument from the ListOfArgs and the functor name is the Name. */

listOfTerms([],N,[]).
listOfTerms([H1|T1],N,[H2|T2]) :- H2=.. [N|H1], listOfTerms(T1, N, T2).

/*Q7 Define insert( ?Elem, ?Lst, ?LstWithElem) such that insert succeeds if the only difference between  Lst and LstWithElem is LstWithElem includes Elem. */

/* a. Use a recursive definition. */
insert(X,[],[X]).
insert(X,[H1|T1],[H2|T2]) :- H1=H2, insert(X,T1,T2).
insert(X,Y,[H2|T2]) :- X=H2, Y=[H|T], Y=T2, insert(X,[],[H2]).


/* b. Use 'select' in your definition. */
insertS(X,Y,Z) :- select(X,Z,Y). 
/* insert(c,[a,b,d,e],[a, b,c, d, e]). */
