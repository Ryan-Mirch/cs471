/*
    CS471 - Programming Languages
    Assignment #5 due: 10/8/13
    Author: Yu, Danny (dyu6)
    Date: 10/6/13

      You will find this site helpful in studing for the test.
    https://sites.google.com/site/prologsite/prolog-problems
 */

/* 1:
   The following Finite State machine accepts all even parity "sentences". 
   Write a Prolog program that accept all valid sentences in the language. 
   We will represent the "sentences" as a list of atoms.  

    Sigma = { 0,1 }, Start state = {q0},  Final state = { q0,q1 }, and
    delta(q0,0) = q1
    delta(q0,1) = q3
    delta(q1,0) = q0
    delta(q1,1) = q2
    delta(q2,0) = q3
    delta(q2,1) = q1
    delta(q3,0) = q2
    delta(q3,1) = q0.

    Remember you will need to build deltaHat(Q1,Str).  
    The definition of deltaHat is:
    deltaHat(Q,[]) = Q 
    (Our program will represent the empty "sentence" as the empty list).
    deltaHat(Q, [C|Cs]) is deltaHat(delta(Q,C),Cs).

A "sentence" is accepted if deltaHat(q0, String) is in a final state (q0 or q1).
You need to complete the program, accept, by defining the subgoals:
   start, deltaHat , and final.

    ?- accept([0,0,0,0,1,1,1,1,0,1,1]).
    true .
    ?- accept([0,0,0,0,1,1,1,1,1]).
    false.
    ?- accept([0,0,0,0,1,1,1,1,1,1]).
    true .
    ?- accept([0,0,1,1,0,0,1,1,1,1,1,1]).
    true .
    ?- accept([0,0,0,0,1]).
    false.
    ?- accept([1,1,1,0,1,0,1,0,1,0]).
    true .


*/

% 1.
start(S) :- S = [H|T], H = q0.
deltaHat(_,[],_).
deltaHat(S,Str,F) :- Str = [H|T], S = H.
final(F) :- F = [H|T], H = q0.
final(F) :- F = [H|T], H = q1.
accept(Str):- start(S),
              deltaHat(S,Str,F),
              final(F).



/* 2. Define a predicate, numOfAtoms(LstofLsts, NofAtoms), such that NofAtoms is
     the total number of atoms in LstofLsts and all the nested lists. You might 
     want to use the following predicates, atom and number. You only need 4
     clauses including only one recursive clause. DO NOT USE the builtin 
     predicate FLATTEN.
     You may use "!", but it is not required.  You may assume type of the items are
     numbers, atoms or list containing zero or more numbers or atoms.  You can use
     the predicates 'atom' and 'number' to determine if the instantiated value is an atom 
     or a number.   

       ?-numOfAtoms([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
       NA = 11
       ?- numOfAtoms([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
       NA = 11 
       ?- numOfAtoms([x,y,[a,s,d],[s,s,[a,b],[d,f,g]],[x,c,v]],NA).
       NA = 15 
      ?- numOfAtoms([1,[a,2,d,5],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA).
      NA = 10 .
*/
numOfAtoms([], 0).
numOfAtoms(A, 0) :- number(A).
numOfAtoms(A, 1) :- atom(A).
numOfAtoms([H|T], NofAtoms) :- numOfAtoms(H, N1), numOfAtoms(T, N2), NofAtoms is N1 + N2.

/* For question 3 -- 
    The only built-predicates you may use are:
     is, //, /, +, -, ^, *,=..,>, <, 
     atom, is_list, functor, arg, integer, number, member, append
   You should not need to use all of them.
*/

/* 3: Below are 3 structures that represent expression trees using Prolog.
      (Op is any Prolog operator.)

     expTree(Op,Lt,Rt).
     expTree(lit,Value).
     expTree(Op,T).

    Write a Prolog program:
         eval(Tree,Value).
    which succeeds if Value is the result of computing the expressions 
    represented by an expression tree.  For example:

   ?- eTree4(T),eval(T,V).
   T = expTree(float, expTree(sin, expTree(/, expTree(lit, pi), expTree(lit, 2))))
   V = 1.0

   ?- eTree1(T),eval(T,V).
   T = expTree(+, expTree(lit, 5), expTree(*, expTree(lit, 3), expTree(lit, 2)))
   V = 11

   Below are trees you can use for testing.
*/

eval(expTree(lit,Val),Val).
eval(expTree(Op,T), Val) :- eval(T, V1), Temp =.. [Op, V1], Val is Temp.
eval(expTree(Op, Lt, Rt), Val) :- eval(Lt, V1), eval(Rt,V2), Temp =.. [Op, V1, V2], Val is Temp.


eTree1(expTree('+',
      expTree(lit, 5),
	             expTree('*',
			                expTree(lit, 3),
			                expTree(lit, 2)
			            )
       )
 ).


eTree2(expTree('*',
	       expTree('-', 
		            expTree(lit, -3),
		            expTree(lit, 2)
		        ),

	       expTree('+', 
		             expTree(lit, 3),
		             expTree('-',
				          expTree(lit, 2)
				        )
		          )
	        )
 ).

eTree3(expTree('*',
	       expTree('min', 
		            expTree(lit, -3),
		            expTree(lit, 2)
		        ),

	       expTree('+', 
		            expTree(lit, 3),
		            expTree('-',
				        expTree(lit, 2)
				        )
		            )
	        )
 ).


eTree4(expTree(float,
	          expTree('sin',
			          expTree('/',
					         expTree(lit, pi),
					         expTree(lit, 2)
					       )
			      )
	          )
 ).
 



/* 4: In the last homework we had the following problem:
   Syntax-Directed Differentiation:  A motivating example illustrating the 
         power of pattern matching in Prolog.
         Consider the following rules for symbolic differentiation
         (U, V are mathematical expressions, x is a variable):

        dx/dx = 1
        d(C)/x = 0.
        d(Cx)/x = C               (C is a constant)
        d(-U)/dx = -(dU/dx)
        d(U+V)/dx = dU/dx + dV/dx
        d(U-V)/dx = dU/dx - dV/dx
        d(U*V)/dx = U*(dV/dx) + V*(dU/dx)
        d(U^n)/dx = nU^(n-1)*(dU/dx)

        These rules can easily be translated into Prolog, for instance,
        the second rule can be defined as
                   d(C,x,0):-number(C).
          and the fifth rule can be defined as
                   d(U + V ,x, DU + DV)):-d(U,x,DU),d(V,x,DV).

         Write the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
			      Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            NO

Below is my solution.

      Keep in mind, though, that terms such as U+V are still trees with the
      functor at the root, and that evaluation of such terms requires 
      additional processing which you will complete.
        
     Define the predicate, 'evaluate', that uses the result from 
     differentiation (above) and a list of values for each variable 
     (OR you can just have one var : value like the example below) and 
     computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue = x:3 , evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0,
    VarValue = x:3,
			      Value = 39 ;
    Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0,
    VarValue = x:3,
			      Value = 39 ;
    false.
    
    ?- d((3*x) ^ 4,x,Result), VarValue = x:2 , evaluate(Result,Value,VarValue).
    Result = 4* (3*x)^3*3,
    VarValue = x:2,
    Value = 2592 .
 */

d(x,x,1).
d(C,x,0):-number(C).
d(C*x,x,C):-number(C).
d(-U, X, -DU) :- d(U, X, DU).
d( U + V, x, RU + RV ):-d(U,x,RU), d(V,x,RV).
d( U - V, x, RU - RV ):-d(U,x,RU), d(V,x,RV).
d(U * V,x, U * DV + V * DU):- d(U,x,DU), d(V,x,DV).
% I assume we are using only whole numbers for exponents. 
d(U ^ N, x, N*U ^ N1*DU) :- integer(N), N1 is N-1, d(U, x, DU).

 
/* 4: Following is my solution to (Syntax-Directed Differentiation.)
   from homework assignment 4.  Keep in mind, though, that terms such as U+V 
   are still trees with the functor at the root, and that evaluation of 
   such terms requires additional processing which you will complete.
      
    Define the predicate, 'evaluate', that uses the result from 
    differentiation (below) and a list of values for each variable and 
    computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue = x:3 , evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0,
    VarValue = x:3,
    Value = 39 .  
      
    ?- d((3*x) ^ 4,x,Result),!, VarValue = x:2 , evaluate(Result,Value,VarValue).
    Result = 4* (3*x)^3*3,
    VarValue = x:2,
    Value = 2592.

    ?- d((3*x) ^ 4,x,Result), VarValue = x:2 , evaluate(Result,Value,VarValue).
    Result = 4* (3*x)^3*3,
    VarValue = x:2,
    Value = 2592 ;
    Result = 4* (3*x)^3* (3*1+x*0),
    VarValue = x:2,
    Value = 2592 ;
    false.

*/
evaluate(x, B, Var) :- Var = A:B.



/******************* solution **************************/


/* 5: Below is a database of US coins with values. */

coin(dollar, 100).
coin(half, 50).
coin(quarter, 25).
coin(dime,10).
coin(nickel,5).
coin(penny,1).

/* 5: (Easy) 
     Write a predicate, value(Coin, Num, Amt), where Coin is the name,
      Num is how many coins and Amt is the total value, 
     (the value of the coin (in pennies) times the number of coins. )
     You should use the facts created above as subgoal to find the value.
     
        ?- value(quarter,5, Amt).
        Amt = 125
        ?- value(dime,10, 100).
        true.
        ?- value(dime,N, 100).
			      ERROR: is/2: Arguments are not sufficiently instantiated
 */

value(Coin, Num, Amt) :- coin(Coin, X), Amt is Num * X.


/* 6: 
      Write a predicate change/2 that given the change amount, computes the ways 
      in which we can give change.  Use USA's  coin denominations above.
      
      The predicate "change" is such that an positive integer S, 
      change(S,T) "returns" a list of tuples, T, where the tuple contains the
      name of the denomination (Name,Count).  
     
 
      The atom Name of the denomination and integer Count that gives 
      the number of coins of each denomination in D that add up to S.
       (Notice that you do not have to be able to generate or 
        validate all possible solutions.)
      For example::
        ?- change(127,L).
        L = [ (dollar, 1), (quarter, 1), (penny, 2)] .
        
        ?- change(44,L).
        L = [ (quarter, 1), (dime, 1), (nickel, 1), (penny, 4)] ;
        L = [ (quarter, 1), (dime, 1), (penny, 9)] ;
        L = [ (quarter, 1), (nickel, 3), (penny, 4)] ;
        L = [ (quarter, 1), (penny, 19)] ;
        L = [ (dime, 4), (penny, 4)] ;
        L = [ (nickel, 8), (penny, 4)] ;
        L = [ (penny, 44)] ;
        false
        
      (Below is something for you to think about -- you do not need to turn in)
      The Coin Changing problem is an interesting problem usually studied in
      Algorthms.  http://condor.depaul.edu/~rjohnson/algorithm/coins.pdf has a 
      nice discussion.
      Think about 
         1) How could we generalize this problem to handle different 
            denominations?  
         2) What are the different techinques to find the change with the
            fewest number of coins ?         
         3) What happens if the order of the "coin" facts change? 

  */


change(0, []).
change(A, [(C, Num)|L]) :- coin(C, V), A >= V,  Num is floor(A / V), B is A mod V, change(B, L).

/* Got help from...
Source: https://github.com/amarshall/CS471/blob/master/Homework5/homework5.pl
*/
