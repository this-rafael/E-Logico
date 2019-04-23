#include <limits.h>
#include <iostream>
#include <bitset>
#include <math.h>

using namespace std;

/* Formatando o binario para o padrao IEE 754
string GetBinary32( float value )
{
    union
    {
         float input;   
         int   output;
    }    data;
 
    data.input = value;
 
    bitset<sizeof(float) * CHAR_BIT>   bits(data.output);
 
    string mystring = bits.to_string<char, 
                                        char_traits<char>,
                                        allocator<char> >();
 
    return mystring;
}*/

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

 
 
