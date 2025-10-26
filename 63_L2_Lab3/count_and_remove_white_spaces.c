#include <stdio.h>

int main() {
    char str[200], result[200];

    printf("Enter a string: ");
    gets(str);

    printf("%s \n", str);

    int j=0, whitespace_count=0;

    for(int i=0;str[i]!='\0';i++) {
        if(str[i]==' ' && str[i]=='\t' && str[i]=='\n') {
                whitespace_count++;
        } else {
            result[j++]=str[i];
            printf("%c : not white space \n", str[i]);
        }
    }
    result[j]='\0';

    printf("Number of white spaces: %d \n", whitespace_count);

    printf("String without white spaces: %s \n", result);
    return 0;
}
