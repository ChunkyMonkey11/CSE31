#include <stdio.h>

int sum(int a, int b) {
    return a + b;
}

int main(void) {
    int m = 10;
    int n = 5;

    printf("%d\n", sum(m, n));
    return 0;
}
