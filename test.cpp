#include <iostream>
#include <stdlib.h>
#include <string>

using namespace std;

class A {
public:
  int a(int x, int y) { return x + y; }
};

int sum(int sum, int b) { return sum + b; }

int main() {
  int n;
  std::cout << "Input n : ";
  std::cin >> n;
  for (int i = 0; i < n; i++) {
    std::cout << i << " ";
  }
  std::cout << "\n";
}
