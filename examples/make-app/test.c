#include <assert.h>
#include <stdio.h>

extern int add(int a, int b);

int main(void) {
    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
    printf("MAKE-APP TEST OK\n");
    return 0;
}
