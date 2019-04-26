#include <iostream>
#include <bitset>
#include <math.h>
#include "Conversor.h"

using namespace std;


void execConversor(){

    int option;

    while (true){
        listOptions();
        cout << " >>> ";
        cin >> option;
        switch(option){

            // Explicacoes sobre conversoes
            case(0):
                break;
            case(1):
                optionsConversionExplanation();
                int otherOption;
                cout << " >>> ";
                cin >> otherOption;

                switch(otherOption){
                    // Explicacao Bin -> Dec
                    case(1):
                        explanationBinToDec();
                        // Explicacao Dec -> Bin
                        break;
                    case(2):
                        explanationDecToBin();
                        // Explicacao Bin -> Float
                        break;
                    case(3):
                        explanationBinaryToFloat32();
                        // Explicacao Float -> Bin
                        break;
                    case(4):
                        explanationFloatToBinIEEE754();
                        break;
                    default:
                        cout << " Desculpe? pode repetir?\n";
                        break;
                }

                // Realizacao de conversao
            case(2):
                optionsConversion();
                int otherOption2;
                cout << " >>> ";
                cin >> otherOption2;

                switch(otherOption2){
                    // Conversao Bin -> Dec
                    case(1):
                        operationBinaryToDec();
                        break;
                        // Conversao Dec -> Bin
                    case(2):
                        operationDecToBin();
                        break;
                        // Conversao Bin -> Float
                    case(3):
                        operationBinaryToFloat32();
                        break;
                        // Conversao Float -> Bin
                    case(4):
                        operationFloatToBinIEEE754();
                        break;
                    default:
                        cout << " Desculpe? pode repetir?\n";
                }
                break;
            default:
                cout << " Desculpe? pode repetir?\n";
        }


        if (option == 0) {
            cout << " Voltando ao menu inicial.";
            break;
        }
    }
}


void listOptions(){
    cout << "\n\t\t --- Opcoes Numericas --- \n";
    cout << "\t0 - Voltar ao menu inicial\n";
    cout << "\t1 - Explicacoes sobre conversoes\n";
    cout << "\t2 - Realizar conversoes\n";
}

void optionsConversionExplanation(){
    cout << "\n\t1 - Explicacao sobre conversao BINARIO -> DECIMAL\n";
    cout << "\t2 - Explicacao sobre conversao DECIMAL -> BINARIO\n";
    cout << "\t3 - Explicacao sobre conversao BINARIO -> FLOAT\n";
    cout << "\t4 - Explicacao sobre conversao FLOAT -> BINARIO\n";
}

void optionsConversion(){
    cout << "\n\t1 - Converter BINARIO -> DECIMAL\n";
    cout << "\t2 - Converter DECIMAL -> BINARIO\n";
    cout << "\t3 - Converter BINARIO -> FLOAT\n";
    cout << "\t4-  Converter FLOAT -> BINARIO\n";
}

void explanationBinToDec(){
	cout << "\n O sistema binario possui somente dois algarismos. Cada posicao do numero em binario tem\n";
	cout << " um peso de uma potencia de dois (base do sistema binario). Sendo assim, para se converter\n";
	cout <<	" um numero de binario para decimal, deve-se multiplicar cada bit pela potencia\n";
	cout <<	" de sua posicao e somar os resultados. Considere o numero 00001110 sendo convertido abaixo:\n\n";

  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|  1 x 2⁷  |   1 x 2⁶  |   1 x 2⁵  |   1 x 2⁴  |   1 x 2³  |   1 x 2²  |   1 x 2¹  |   1 x 2⁰  |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|  0 x 2⁷  |   0 x 2⁶  |   0 x 2⁵  |   0 x 2⁴  |   1 x 2³  |   1 x 2²  |   1 x 2¹  |   0 x 2⁰  |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|    0     |     0     |     0     |     0     |     8     |     4     |     2     |     0     |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|RESULTADO = 0 + 0 + 0 + 0 + 8 + 4 + 2 + 0 => 14 = 00001110                                    |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
}


void explanationDecToBin(){
	cout << "\n O sistema decimal possui 10 algarismos. Esses algarismos podem ser obtidos a partir das\n";
	cout << " potencias de dois. Sendo assim, para se converter um numero decimal para binario, basta\n";
	cout <<	" representa-lo como uma cadeia de '0' e '1' onde a soma das potencias de dois sinalizadas\n";
	cout <<	" com '1' seja igual ao numero fornecido. Considere o numero 14 sendo convertido abaixo:\n\n";

  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|    128   |     64    |     32    |     16    |     8     |     4     |     2     |     1     |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|  0 x 2⁷  |   0 x 2⁶  |   0 x 2⁵  |   0 x 2⁴  |   1 x 2³  |   1 x 2²  |   1 x 2¹  |   0 x 2⁰  |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|    0     |     0     |     0     |     0     |     1     |     1     |     1     |     0     |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
  cout <<	"|RESULTADO = 00001110 = 14                                                                     |\n";
  cout <<	"|----------------------------------------------------------------------------------------------|\n";
}

void explanationFloatToBinIEEE754(){
    cout << " A representacao de numeros de ponto flutuante em binario pelo padrao IEEE 754 tem 32 bits\n";
    cout << " de precisao. Desses 32 bits, um eh um bit dedicado ao sinal do numero, oito bits sao\n";
    cout << " dedicados ao expoente do numero e os outros vinte e tres bits restantes sao destinados a\n";
    cout << " a mantissa do numero. Considere o numero -9.5 sendo convertido abaixo:\n\n";

    cout << "1) Bit de sinal: 1 (NEGATIVO = 1, POSITIVO = 0)\n";
    cout << "2) Conversao para binario: 9.5 --> 1001.1\n";
    cout << "3) Deslocar a virgula e 'esconder' o primeiro bit: 0011\n";
    cout << "4) Multiplicar por 2 elevado a quantidade de deslocamentos: 0011 x 2³\n";
    cout << "5) Normalizar o expoente somando com 127: 3 + 127 = 130 = 10000010\n";
    cout << "6) Agrupar o resultado na forma: bit sinal | expoente | mantissa\n";
    cout << "7) Resultado: 1 | 10000010 | 00110000000000000000000\n";

}

void explanationBinaryToFloat32(){
    cout << " Um numero binario de 32 bits pode ser convertido em um numero decimal com sinal. Para isso\n";
    cout << " realiza-se o inverso das operacoes aplicadas na conversao de numero float para binario.\n";
    cout << " Considere o numero 11000001000110000000000000000000 sendo convertido abaixo:\n\n";

    cout << "1) Subtrair 127 do expoente: 10000010 = 130 => 130 - 127 = 3\n";
    cout << "2) Retornar o bit escondido: 1.0011\n";
    cout << "3) Deslocar a virgula: 1.0011 => 1001.1\n";
    cout << "4) Converter para binario: 1001.1 = 9.5\n";
    cout << "5) Adicionar sinal (se for negativo): -9.5\n";
}

void operationDecToBin(){
    int decimal;
    cout << " Digite um numero inteiro: " << endl;
    cin >> decimal;
    string result = decToBinary(decimal);
    cout << result << endl;
}

/**
 * Funcao que converte um número decimal para um
 * número binário de 32 bits.
 */
string decToBinary(int n) {
    string result;
    // Operação bit-a-bit
    for (int i = 31; i >= 0; i--) {
        int k = n >> i;
        if (k & 1)
            result += "1";
        else
            result += "0";
    }
    return result;
}

void operationFloatToBinIEEE754(){
    float f;
    cout << " Digite um numero float: " << endl;
    cin >> f;
    cout << floatToBinIEEE754(f) << endl;
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
 * Funcao auxiliar que converte um numero binario de
 * 32 bits para um numero hexadecimal.
 */
int Binary2Hex(string Binary) {
    // Set de binario
    bitset<32> set(Binary);
    // Inteiro sem sinal
    int hex = set.to_ulong();

    return hex;
}

void operationBinaryToFloat32(){
    string binary;
    cout << " Digite um numero binario: " << endl;
    cin >> binary;
    cout << binaryToFloat32(binary) << endl;
}

/**
 * Funcao que converte um numero binario de
 * 32 bits para um float no padrao IEE 754.
 */
float binaryToFloat32(string Binary) {
    // Transformando bin -> hex
    int HexNumber = Binary2Hex(Binary);

    // B I T M A S K
    int exponent;
    exponent = (HexNumber & 0x7f800000) >> 23;

    // Verificando o sinal do numero
    int sign;
    sign = (HexNumber & 0x80000000) ? -1 : 1;

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

void operationBinaryToDec(){
    string binary;
    cout << " Digite um numero binary: " << endl;
    cin >> binary;
    cout << binaryToDec(binary) << endl;
}

/**
 * Funcao que converte um numero binario para um
 * numero decimal de 32 bits.
 */
int binaryToDec(string binary) {
    string num = binary;
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
