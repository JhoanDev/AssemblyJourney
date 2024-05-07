#include <iostream>

using namespace std;

extern "C" int calcular(int num1, int num2, char op);

int main()
{
    char operacao;
    int num1, num2;
    bool sair = false;

    while (!sair)
    {
        cout << "\n\n### Calculadora ###" << endl;
        cout << "Escolha a operação:" << endl;
        cout << "1. Adição (+)" << endl;
        cout << "2. Subtração (-)" << endl;
        cout << "3. Multiplicação (*)" << endl;
        cout << "4. Divisão inteira(/)" << endl;
        cout << "5. Sair" << endl;
        cout << "Opção: ";
        cin >> operacao;
        if (operacao >= '1' && operacao <= '4')
        {
            cout << "Insira o primeiro número: ";
            cin >> num1;
            cout << "Insira o segundo número: ";
            cin >> num2;
        }

        switch (operacao)
        {
        case '1':
            cout << num1 << " + " << num2 << " = " << calcular(num1, num2, operacao) << endl;
            break;
        case '2':
            cout << num1 << " - " << num2 << " = " << calcular(num1, num2, operacao) << endl;
            break;
        case '3':
            cout << num1 << " * " << num2 << " = " << calcular(num1, num2, operacao) << endl;
            break;
        case '4':
            if (num2 != 0)
            {
                cout << num1 << " / " << num2 << " = " << calcular(num1, num2, operacao) << endl;
            }
            else
            {
                cout << "Erro: Divisão por zero!" << endl;
            }
            break;
        case '5':
            cout << "Saindo..." << endl;
            sair = true;
            break;
        default:
            cout << "Opção inválida! Tente novamente." << endl;
        }
    }
    return 0;
}
