#include <iostream>

using namespace std;

extern "C" int primo(long num);

int main(){
    long n;
    long i;
    int cont = 0;
    cout << "O programa irá exibir os numeros primos de 1 até N\n" << "Insira o valor de N: ";
    cin >> n;
    if (n < 2)
    {
        cout << "[ERRO] Insira um valor maior ou igual a 2";
        return 0;
    }
    
    for (i = 2; i <= n; i++){
        if (primo(i))
        {
            cout << ++cont << "º numero primo: " << i << endl;
        }
    }
    return 0;
}
