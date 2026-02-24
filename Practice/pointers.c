#include <stdio.h>


// Pointers as function arguments - call by reference.


















//Pointer to pointer practice/notes
/*
say I have an int a; 
and int* p; where p is pointing to a's memory address.
I can have a pointer to pointer so lets say pointer q points to p. 
This would be defined as int** q = p;
*/
// int main(){
//     int a;
//     int* p;
//     int** q;
//     int*** r;
//     a = 5;
//     p = &a;
//     q = &p;
//     r = &q;

//     printf("Memory address of a  is : %p\n" , &a);
//     printf("Memory address of p is : %p\n", &p); 
//     printf("Memory address of q is : %p\n", &q);
//     printf("Memory address of r is : %p\n", &r);
//     //We would expect four different memory addresses corresponding to a's address in memory, and p, q, and r. Which are the memory addresses of the pointers. 

//     for(int i = 0; i < 4; i++){
//         printf("\n");
//     }
//     printf("Now printing the pointer values.\n");
    
//     printf("%d\n", *p);
//     printf("%d\n",*(*q)); 
//     printf("%d\n",*(**r)); 
//     // r-pointer to pointer to pointer points to -> q-pointer to pointer points to ->p- pointer to int points to -> address of a- integer.

//     //*q dereference q says give me the value of q. Which is the address of p. 
    

// }



























// int main(){
//     /*
//     Recap what I know about pointers.
//     */
//    int a;
//    int *p;
//    a = 5;
//    p = &a; //sets the int pointer p to point to a's memory address

//    printf("The address of a is: %p\n",(void*)(&a)); // By doing (void*) i am type casting to a generic pointer because %p expects an argument of type void*
//    printf("Value stored by p: %d\n", p); // Prints the memory address of a since that is what the pointer p stores
//    printf("The address of p is: %d\n", &p); //This prints the memory address of the integer pointer p in memory.
//    printf("Value stored by a: %d\n", a);
//    printf("Value stored at what p points too: %d\n", *p);
   
// }

// int main(){
//     int a;
//     int* p;
//     a = 1025;
//     p = &a;
//     char* p0;
//     p0 = p;


//     printf("Address of a %p\n", (void*)&a); //Address of int a in memory
//     printf("Address of p %p\n", (void*)p); // integer pointer p points to a's memory address. 
//     printf("Address of p0 %p\n", (void*)p0); // char pointer p0 points to integer pointer p where p points so prints a's address. 
//     // when printing the memory address using %p format specifier printf expects (void*) as %p requires an argument of type void. Even if you forget to do this the compiler will handle this on its own. 

//     printf("Value of a %d\n", a);
//     printf("Value of %d\n", *p); //This should print out 1025 since p is an integer pointer which matches the data type its pointing too. Which is 4bytes.
//     printf("Value of p0 %d\n", *p0); // I believe since p0 is a char pointer this will only print one byte value. Since char is repersented as one byte.
// }