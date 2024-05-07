#include <iostream>

using namespace std;

extern "C" long fibonacci(long num);
//              rax         rdi

int main(){
    long a;
    cout << "insira qual elemento da seq de fibonacci deseja: ";
    cin >> a;
    cout << "\nO " << a << "º elemento da sequencia é: " << fibonacci(a) << endl;
    return 0;
}