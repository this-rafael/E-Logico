//
// Created by rafaelsp on 25/04/19.
//

#ifndef CPP_CONVERSOR_H
#define CPP_CONVERSOR_H

#include <iostream>
#include <bitset>
#include <math.h>

using namespace std;
void execConversor();
void listOptions();
void optionsConversionExplanation();
void optionsConversion();
void explanationBinToDec();
void explanationDecToBin();
void explanationFloatToBinIEEE754();
void explanationBinaryToFloat32();
void operationDecToBin();
string decToBinary(int n);
void operationBinaryToFloat32();
float binaryToFloat32(string Binary);
void operationBinaryToDec();

void operationFloatToBinIEEE754();
bitset<32> floatToBinIEEE754(float f);

int Binary2Hex(string Binary);

float GetFloat32(string Binary);

int binaryToDec(string n);

#endif //CPP_CONVERSOR_H
