#include <iostream>
#include <bitset>

using namespace std;

/* Funcao que converte um numero float em
 * um numero binario de ponto flutuante de 
 * 32 bits no padrao IEE 754
 */
bitset<32> floatToBinIEEE754(float f)
{
    bitset<32> result(bitset<sizeof f*8>(*(long unsigned int*)(&f)));
    return result;
}

int main()
{
    float f=-4.5f;
    cout << floatToBinIEEE754(f) << endl;
    return 0;
}

 
 
