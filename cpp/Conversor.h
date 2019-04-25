//
// Created by rafaelsp on 25/04/19.
//

#ifndef CPP_CONVERSOR_H
#define CPP_CONVERSOR_H

#include <iostream>
#include <bitset>
#include <math.h>

using namespace std;

void decToBinary(int n);

bitset<32> floatToBinIEEE754(float f);

int Binary2Hex(string Binary);

float GetFloat32(string Binary);

int binaryToDec(string n);

#endif //CPP_CONVERSOR_H
