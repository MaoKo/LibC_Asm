#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int
main(void) {
        char test[] = "XXXYYY\0ABCDEF";

        printf("%s\n", strncat(test, "@@@\0%%%", 0));
        //write(1, test, 13);

        return (EXIT_SUCCESS);
}
