#include <iostream>

using namespace std;

extern "C" int maior_valor(int num1, int num2);
extern "C" int switchc(int num);

int main()
{

    cout << "O maior valor é: " << maior_valor(10, 20) << endl;
    cout << "O maior valor é: " << maior_valor(35, 13) << endl;
    cout << "O maior valor é: " << maior_valor(2, 2) << endl;
    cout << "Switch retornou: " << switchc(1) << endl;
    cout << "Switch retornou: " << switchc(2) << endl;
    cout << "Switch retornou: " << switchc(3) << endl;
    cout << "Switch retornou: " << switchc(78) << endl;
    return 0;
}