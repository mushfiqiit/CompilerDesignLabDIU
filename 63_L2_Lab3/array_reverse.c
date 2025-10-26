#include <stdio.h>

int main()
{
    int array[100], temp, n=5;

    printf("Enter number of elements : ");
    scanf("%d", &n);

    printf("Enter %d elements: ", n);

     for(int i=0;i<n;i++) {
        scanf("%d", &temp);
        array[i]=temp;
    }

    for(int i=0;i<n/2;i++) {
        temp=array[i];
        array[i]=array[n-i-1];
        array[n-i-1]=temp;
    }

    printf("Reversed array : \n");
    for(int i=0;i<n;i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    return 0;
}
