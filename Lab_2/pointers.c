#include <stdio.h>
int main() {
    int x, y, *px, *py;
    int arr[10];

    // Q2: Uninitialized values
    printf("Q2: Uninitialized values: x: %d, y: %d, arr[0]: %d\n", x, y, arr[0]);

    // Q3: Fix by initializing
    x = 10;
    y = 20;
    for (int i = 0; i < 10; i++) {
        arr[i] = i * 10;
    }
    printf("Q3: Initialized values: x: %d, y: %d, arr[0]: %d\n", x, y, arr[0]);

    // Q4: Addresses of x and y
    printf("Q4: Address of x: %p\n", (void*)&x);
    printf("Q4: Address of y: %p\n", (void*)&y);

    // Q5: Pointers px and py
    px = &x;
    py = &y;
    printf("Q5: px points to x. Value of px (address of x): %p\n", (void*)px);
    printf("Q5: py points to y. Value of py (address of y): %p\n", (void*)py);
    printf("Q5: Address of px: %p\n", (void*)&px);
    printf("Q5: Address of py: %p\n", (void*)&py);

    // Q6: Array loop using pointer arithmetic
    printf("Q6: Array content using pointer arithmetic:\n");
    for (int i = 0; i < 10; i++) {
        printf("%d ", *(arr + i));
    }
    printf("\n");

    // Q7: Array name vs pointer to first element
    printf("Q7: arr points to: %p\n", (void*)arr);
    printf("Q7: &arr[0] is: %p\n", (void*)&arr[0]);
    if ((void*)arr == (void*)&arr[0]) {
        printf("Q7: Confirmed: arr points to the address of arr[0].\n");
    }

    // Q8: Address of arr
    printf("Q8: Address of arr (&arr): %p\n", (void*)&arr);

    return 0;
}
