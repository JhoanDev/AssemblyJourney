#include <iostream>

using namespace std;

extern "C" long fat(int num);

int main(){
    int num;
    cout << "Insira o numero para calcular o fatorial: ";
    cin >> num;
    if (num < 0)
    {
        cout << "[ERRO] Insira um numero positivo!! " << endl;
        return 0;
    }
    long fatorial = fat(num);
    cout << num << "! = " << fatorial << endl;
    return 0;
}