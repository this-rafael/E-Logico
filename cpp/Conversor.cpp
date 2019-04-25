#include <iostream>
#include <bitset>
#include <math.h>
#include "Conversor.h"

using namespace std;

/**
 * Funcao que converte um número decimal para um
 * número binário de 32 bits.
 */
void decToBinary(int n) {
    // Operação bit-a-bit
    for (int i = 31; i >= 0; i--) {
        int k = n >> i;
        if (k & 1)
            cout << "1";
        else
            cout << "0";
    }
    cout << endl;
}


/**
 * Funcao que converte um numero float em
 * um numero binario de ponto flutuante de
 * 32 bits no padrao IEE 754
 */
bitset<32> floatToBinIEEE754(float f) {
    bitset<32> result(bitset<sizeof f * 8>(*(long unsigned int *)( &f)));
    return result;
}


/**
 * Funcao que converte um numero binario de
 * 32 bits para um numero hexadecimal.
 */
int Binary2Hex(string Binary) {
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
float GetFloat32(string Binary) {
    // Transformando bin -> hex
    int HexNumber = Binary2Hex(Binary);

    // B I T M A S K
    int exponent = (HexNumber & 0x7f800000) >> 23;

    // Verificando o sinal do numero
    int sign = (HexNumber & 0x80000000) ? -1 : 1;

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
    for (int i = 0; i < 23; i++) {
        /* Subtraindo charVALUE '0' do bit atual
         * '1' = 49 | '0' = 48
         */
        int c = Binary[i + 9] - '0';
        // total = 1 * 2 ** power  ou  total = 0 * 2 ** power
        total += (float) c * (float) pow(2.0, power);
        // Decrementando a potencia
        power--;
    }
    total += 1.0;

    // Se sign == -1, value vai ser negativo, senao, value vai ser positivo
    float value = sign * (float) pow(2.0, exponent) * total;

    return value;
}


/**
 * Funcao que converte um numero binario para um
 * numero decimal de 32 bits.
 */
int binaryToDec(string n) {
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
