#include <stdio.h>
int main(){
    /*
    I see two things. 
    1. We are calculating two averages avg_even & avg_odd
    2. We determine which bucket a number should go into based on whether its sum of the digits is odd or even.
    3. Algorithm steps:
        1. Take the integer from input.
        2. Determine whether its even/odd
            1. If even the (sum of the digits) % 10  == 0
            2. If odd the (sum of the digits ) % 10 != 0
        3. After determining the odd/even status of that number we place that number into a bucket and add it to a running sum:
            Variables per status:
            int even_count
            int even_sum
            --------------
            int odd_count
            int odd_sum
        4. When the program stops we calculate this:
            avg_even = even_sum/even_count
            avg_odd = odd_sum/odd_count

            Details:
            After each determination(sum of digits -> evaluation of odd/even -> increment respective counts -> add sums)
            We were told the most this program will go too is 7th so I will hard code the print statements based on count.
            */
           
           int even_count = 0;
           int even_sum = 0;    
                           
           int odd_count = 0;
           int odd_sum = 0;
           int count = 1;
            /* Loop until the user enters 0 or invalid input. */
            while(1){
                const char *suffix;
                if (count % 10 == 1 && count % 100 != 11) // if the number ends in 1 but not in 11 use st.
                    suffix = "st";
                else if (count % 10 == 2 && count % 100 != 12) //If the number ends in 2, but not 12, use nd
                    suffix = "nd";
                else if (count % 10 == 3 && count % 100 != 13)//If the number ends in **3**, but not 13, use rd
                    suffix = "rd";
                else
                    suffix = "th";

                printf("Enter the %d%s value: ", count, suffix);
                      int number;
                      int rc = scanf("%d", &number);
                      /* If input is not an integer or EOF, stop reading. */
                      if(rc != 1){
                          break;
                      }
                      if (number == 0){
                          break;
                      }

                 long long digit_sum = 0;
                 long long temp;
                 if(number < 0){
                     temp = -number;
                 }
                 else{
                     temp = number;
                 }
                 while(temp > 0){
                    long long digit = temp % 10;
                    digit_sum += digit;
                    
                    temp /=10;
                 }

                 if(digit_sum % 2 == 0){
                    even_count +=1;
                    even_sum += number;
                 }
                 else{
                    odd_count +=1;
                    odd_sum += number;
                 }
                                 count +=1;
                }
                // When the exit condition is met compute and print averages only when counts are nonzero.
                printf("\n");
                if(even_count == 0 && odd_count == 0){
                    printf("There is no average to compute.\n");
                }
                else{
                    if(even_count != 0){
                        float even_avg = (float)even_sum / even_count;
                        /* Use %g to print the float with the minimal required digits (no unnecessary trailing zeros).
                           %g uses up to 6 significant digits by default and removes trailing zeros/decimal point. */
                        printf("Average of input values whose digits sum up to an even number: %g\n", even_avg);
                    }
                    if(odd_count != 0){
                        float odd_avg = (float)odd_sum / odd_count;
                        printf("Average of input values whose digits sum up to an odd number: %g\n", odd_avg);
                    }
                }

            // Run a final formatting check to make sure this is complete. 
                                 
            






    return 0;
}