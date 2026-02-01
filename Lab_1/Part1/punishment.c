#include <stdio.h>

int main() {
    int count;
    int line;

    // Get repetition count
    while (1) {
        printf("Enter the repetition count for the punishment phrase: ");

        if (scanf("%d", &count) == 1 && count > 0) {

            // Get typo line
            while (1) {
                printf("Enter the line where you want to insert the typo: ");

                if (scanf("%d", &line) == 1 && line > 0 && line <= count) {
                    break; // IMPORTANT: exit typo loop when valid
                } else {
                    printf("You entered an invalid value for the typo placement! Please re-enter: ");

                    int c;
                    while ((c = getchar()) != '\n' && c != EOF) {
                        ; // discard rest of line
                    }
                }
            }

            break; // IMPORTANT: exit repetition loop once BOTH inputs are valid

        } else {
            printf("You entered an invalid value for the repetition count! Please re-enter: ");

            int c;
            while ((c = getchar()) != '\n' && c != EOF) {
                ; // discard rest of line
            }
        }
    }

    // at this point all loops ended correctly we hav the correct numbers now we can do the printing.
    for(int i = 1; i < (count + 1); i++){
        if(i == line){
            printf("Cading wiht is C avesone!\n");
            continue;
        }
        printf("Coding with C is awesome!\n");
    }
    return 0;
}
