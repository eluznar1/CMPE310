#include <stdio.h>
#include <stdlib.h>

extern int sum_numbers(int *array, long counter);

int main( int argCount, char *arg[]){
    if (argCount != 2){
        printf("Usage: %s <datafile>\n", arg[0]);
        return 1;
    }

    FILE *fp = fopen(arg[1], "r");

    if (fp == NULL) {
        printf("Unable to open file %s\n", arg[1]);
        return 1;
    }

    long n; 

    if (fscanf(fp, "%ld", &n) != 1){
        printf("ERROR, unable to the number of data points \n");
        fclose(fp);
        return 1;
    }

    int *arr = malloc(n * sizeof(int));

    if (arr == NULL){
        printf("ERROR, failure to allocate memory correctly\n");
        fclose(fp);
        return 1;
    }

    for (int i = 0; i < n; i++){
        if(fscanf(fp, " %d", &arr[i]) != 1){
            printf("ERROR, unable to read integer on line %d\n", i + 1);
            free(arr);
            fclose(fp);
            return 1;
        }
    }

    fclose(fp);

    int sum = sum_numbers(arr, n);
    printf("Sum = %d\n", sum);

    free(arr);
    return 0;
}