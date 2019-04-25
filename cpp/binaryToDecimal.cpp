#include <iostream> 
#include <string> 

using namespace std; 
  
/** 
 * Funcao que converte um numero binario para um 
 * numero decimal de 32 bits.
 */ 
int binaryToDec(string n) 
{ 
    string num = n; 
    int dec_value = 0; 
  
    /* Inicializando o valor da base como 1, essa 
     * base sera somada ao resultado com número de 
     * potências de dois. Por exemplo: 2^0 = 1 |
     * 2^1 = 2 | 2^2 = 4 | 2^3 = 8 e etc.  
     */
    int base = 1; 

    for (int i = 31; i >= 0; i--) { 
        if (num[i] == '1') 
            dec_value += base; 
        base = base * 2; 
    } 
  
    return dec_value; 
} 
