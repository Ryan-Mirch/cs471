/* CS471 - Programming Language
Section: 01
Lab #1 due 9/1/13
Author: Yu, Danny (dyu6)
Date 8/29/13 */

/* Use to generate assembly file */

int  powerI(int pow, int base) {
     int acc,p;
     for (acc=1,p=0; p < pow; p++) {
       acc = acc * base;
     }
     return acc;
}


