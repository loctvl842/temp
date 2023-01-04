#include <iostream>
#include <stdlib.h>
#include <string>

using namespace std;

class A {
public:
  static int X;
	int x(int x) {
		return 2;
	}
};

int A::X = 2;
class X {
	static int A;
};


int main() {
	int a;
	int &ra = a;
	std::cout << ra << std::endl;
	ra++;
	std::cout << a << std::endl;
	std::cout << ra << std::endl;
}
