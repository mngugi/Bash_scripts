#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i, n, sum;
    int *ptr, *ele;

    // Enter the number of elements
    printf("\nEnter the number of elements to be added = ");
    scanf("%d", &n);

    // Allocate memory space for n integers of int type to *ptr
    ptr = malloc(n * sizeof(int));

    // Checking whether the memory is allocated successfully
    if (ptr == NULL)
    {
        printf("\n\nMemory allocation failed");
        return 1; // Return an error code
    }

    // Reading the elements to the pointer variable *ele
    for (ele = ptr, i = 1; ele < (ptr + n); ele++, i++)
    {
        printf("Enter the %d element = ", i);
        scanf("%d", ele);
    }

    // Finding the sum of n elements
    for (ele = ptr, sum = 0; ele < (ptr + n); ele++)
        sum += (*ele);

    printf("\n\nThe SUM of numbers is = %d", sum);

    // Free the allocated memory
    free(ptr);

    return 0; // Return success
}

