#include <iostream>

using namespace std;

extern "C" int get_valor_asm(int a);

int main()
{
    cout << "ASM me deu: " << get_valor_asm(32) << endl;
    return 0;
}