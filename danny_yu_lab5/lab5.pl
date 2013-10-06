/*
        CS471 - Programming Languages
        Lab #5 due: 10/6/13
        Author: Yu, Danny, dyu6
        Date: 10/3/13
 */

/**************************
  HINT:  You may use member predicate in your solutions.
  *************************/

/* 1:(10pts) Define a predicate "simplify/3" that succeeds if the last argument is 
      a list with items with the form Var:Value,  
      the first argument is a "var" atom in the list and 
      the second argument is the var's Value.  Requires only one clause.
      (hint::member, atom).
      ?- simplify(b,Value,[a:100,b:(-5)]).
      Value = -5
      ?- simplify(b,Value,[a : 1,b : 5]).
      Value = 5 .
      */

simplify(A,B,Lst) :- member(A:B,Lst).

      
/* 2: (10pts)Now extend predicate "simplity/3" to  evaluate an algebraic expression.
   The algebraic expression consists of variable with operators 'plus', 
   'minus' and 'times'. Here are two test queries:
          ?- simplify(plus(times(x,y),times(3 ,minus(x,y))),V,[x:4,y:2]).
          V = 14
          ?- simplify(times(2,plus(a,b)),Val,[a:1,b:5]).
          Val = 12
          ?- simplify(times(2,plus(a,b)),Val,[a:1,b:(-5)]).
          Val = -8 .
    Requires only a total 5 clauses.  You may use "number" in one of your clauses.      
*/
simplify(A,B,Lst) :- number(A), B = A.
simplify(plus(A,B),V,Lst) :- simplify(A,V1,Lst), simplify(B,V2,Lst), V is V1+V2. 
simplify(times(A,B),V,Lst) :- simplify(A,V1,Lst), simplify(B,V2,Lst), V is V1*V2.
simplify(minus(A,B),V,Lst) :- simplify(A,V1,Lst), simplify(B,V2,Lst), V is V1-V2.

/* 3:(0 pts) (Do not turn in.)
   Given the 4 logically equivalent predicates try to predict the outcome of 
   ?- subList1(X,[a]),fail.
   ?- subList2(X,[a]),fail.
   ?- subList3(X,[a]),fail.
   ?- subList4(X,[a]),fail.
   Try to understand why some produce "ERROR: Out of global stack"

*/ 

subList1(S,L):-append(_,S,P),append(P,_,L).
subList2(S,L):-append(P,_,L),append(_,S,P).
subList3(S,L):-append(S,_,T),append(_,T,L).
subList4(S,L):-append(_,T,L),append(S,_,T).

/* Using writes to see the backtracking */

subList1w(S,L):-write('1-1'),append(_,S,P),write(' 1-2'),write(P),append(P,_,L).
subList2w(S,L):-write('2-1'),append(P,_,L),write(' 2-2'),write(P),append(_,S,P).
subList3w(S,L):-write('3-1'),append(S,_,T),write(' 3-2'),write(T),append(_,T,L).
subList4w(S,L):-write('4-1'),append(_,T,L),write(' 4-2'),write(T),append(S,_,T).

/*4:(10 pts) Define a predicate append3DL  that concatenates three difference lists:
   

   ?- append3DL([1,2,3|X]-X,[a,b|Y]-Y,[x,y,z|Z]-Z,A - B).
   X = [a, b, x, y, z|B],
   Y = [x, y, z|B],
   Z = B,
   A = [1, 2, 3, a, b, x, y, z|B].

*/

append3DL(A-B, B-C, C-D, A-D).
