/*
CS471 - Programming Languages
Lab#3
Author: Yu, Danny (dyu6)
Date: 9/19/13
*/

wizard(ron).
wizard(X) :- hasBroom(X),hasWand(X).
hasWand(harry).
quidditchPlayer(harry).
hasBroom(X) :- quidditchPlayer(X).






