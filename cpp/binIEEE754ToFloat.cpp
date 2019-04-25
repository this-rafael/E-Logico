#include <iostream>
#include <math.h>
#include <bitset>

using namespace std;
 
/** 
 * Funcao que converte um numero binario de 
 * 32 bits para um numero hexadecimal.
 */ 
int Binary2Hex(string Binary )
{
    // Set de binario
    bitset<32> set(Binary);
    // Inteiro sem sinal      
    int hex = set.to_ulong();
     
    return hex;
}
 
/**
 * Funcao que converte um numero binario de 
 * 32 bits para um float no padrao IEE 754.
 */ 
float GetFloat32(string Binary )
{
    // Transformando bin -> hex
    int HexNumber = Binary2Hex( Binary );

    // B I T M A S K 
    int  exponent  =   (HexNumber & 0x7f800000) >> 23;
    
    // Verificando o sinal do numero    
    int sign =  (HexNumber & 0x80000000) ? -1 : 1;
 
    // Complementando o expoente com -127
    exponent -= 127;
 
    // Mantissa 
    /* Potencia negativa pois a mantissa eh
     * a parte fracionaria, dai eleva-se 
     * a potencias negativas na base dois.
    */
    int power = -1;
    // Resultado
    float total = 0.0;
 
    // Ultimos 23 bits
    // Metodo do polinomio de conversao
    for ( int i = 0; i < 23; i++ )
    {
        /* Subtraindo charVALUE '0' do bit atual
         * '1' = 49 | '0' = 48
         */ 
        int c = Binary[ i + 9 ] - '0';
        // total = 1 * 2 ** power  ou  total = 0 * 2 ** power
        total += (float) c * (float) pow(2.0, power);
        // Decrementando a potencia
        power--;
    }
    total += 1.0;
    
    // Se sign == -1, value vai ser negativo, senao, value vai ser positivo
    float value = sign * (float) pow( 2.0, exponent ) * total;
 
    return value;
}
