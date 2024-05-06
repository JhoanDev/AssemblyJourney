#include <iostream>

using namespace std;

extern "C" int par_ou_impar(int num);

int main()
{
    cout << "Insira um numero: ";
    int numero;
    cin >> numero;
    if (!par_ou_impar(numero))
    {
        cout << "\nNumero é impar" << endl;
    }
    else
    {
        cout << "\nNumero é par" << endl;
    }
    return 0;
}