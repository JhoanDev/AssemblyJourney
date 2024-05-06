#include <iostream>

using namespace std;

extern "C" int passar_param(int a, int b, int c);
//                           edi    esi    edx

int main()
{
    cout << "Foi retornado: " << passar_param(50, 40, 10) << endl;
    return 0;
}