> module HWf13H1
>     where

YOUR NAME: Danny Yu

Functions of 1 variable -- Curried functions

Tuple Data Type

> prodT (a,b,c) = a * b * c

1. The inferred type of prodT is Num.
prodT :: (Num t) => (t, t, t) -> t

Curried functions

> prodC a b c = a * b * c

2. The inferred type of prodC is Num.
prodC :: (Num a) => a -> a -> a -> a

problem 3 

> prodCx :: Num a => a -> (a -> (a->a))
> prodCx a b c = a * b * c 

The inferred types of prodCx and prodC are the same.

problem 4

> prodC1  = prodC 1
> prodC2  = prodC1 2
> prodC3  = prodC2 3
> prodC12 = prodC 1 2

I think that these definitions will not be legal - the right side does not have 3 arguments for any of the functions. I predict that the types of each definition should be of type Num.

I was wrong - most are illegal for this reason, but prodC3 calls prodC2, which calls prodC1, which calls prodC, and is thus given 3 arguments, so it ends up working fine. Also, the type of these definitions return Integers and not Num.

problem 5

No, you cannot write similar definitions using prodT because prodT expects 3 arguments. prodT3 is illegal because x and y are out of scope.

problem 6

Function application is left associative.
F G H = (F G) H

problem 7

a) h(x) = f(g(x))
g(x) = 6x-3
f(6x-3) = (6x-3)*2 + 5 = 12x - 6 + 5 = 12x - 1

h(x) = 12x - 1

b) h2(x) = g(f(x))
f(x) = 2x + 5
g(x) = 6x - 3
g(2x+5) = 6(2x+5) - 3 = 12x + 30 - 3 = 12x + 27

h2(x) = 3(4x + 9)

c) h(2) = 12(2) - 1 = 23

d) h2(2) = 3(4(2) + 9) = 51

> f(x) = x * 2 + 5
> g(x) = (2 * x -1) * 3
> h = f . g
> h2 = g . f