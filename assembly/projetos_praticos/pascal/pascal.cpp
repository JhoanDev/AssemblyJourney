#include <iostream>

using namespace std;

extern "C" void pasc(int linhas);

int main(){
    int linhas;
    cout << "Insira a quantidade de linhas da piramide: ";
    cin >> linhas;
    if (linhas <= 0){
        cout << "Por favor insira um numero maior que 0" << endl;
        return 0;
    }
    pasc(linhas);
    return 0;
}