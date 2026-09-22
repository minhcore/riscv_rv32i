void swap(int *a, int *b) {
  int temp;
  temp = *a;
  *a = *b;
  *b = temp;
}

void bubble_sort(int a[], int n) {
  int i, j;
  for (i = 0; i <= n - 2; i++) {
    for (j = n - 1; j >= i + 1; j--) {
      if (a[j] < a[j - 1])
        swap(&a[j], &a[j - 1]);
    }
  }
}

int main(void) {
  int a[5];
  a[0] = 10;
  a[1] = 2;
  a[2] = 7;
  a[3] = 4;
  a[4] = 1;
  int n = 5;
  bubble_sort(a, n);
  return 1;
}