int add(int a, int b) { return (a + b); }

int main(void) {
  volatile int abc, def, result;
  abc = 100;
  def = 76;
  result = add(abc, def);

  return result;
}