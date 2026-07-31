#include <string>

int DEMO[4] = {0, 0, 0, 0};
const int MAGIC_CONSTANT = 100;
bool FLAG = false;

void demo_func(int pos, std::string &s) {
	if (pos == MAGIC_CONSTANT) {
		FLAG = 1;
		return;
	}
	if (s[pos] != '0') {
		DEMO[pos % 4] = MAGIC_CONSTANT;
		s += "DEMO";
	}
	demo_func(pos + 1, s);
}














