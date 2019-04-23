/* Converor DECIMAL -> BINARIO. 
 * Subtende-se que o DECIMAL seja de no MÁXIMO 32 bits.
 */

#include <iostream> 

using namespace std; 
  
/* Funcao que converte um número decimal para um 
 * número binário de 32 bits.
 */
int decToBinary(int n) 
{ 
    // Operação bit-a-bit 
    for (int i = 31; i >= 0; i--) { 
        int k = n >> i; 
        if (k & 1) 
            cout << "1"; 
        else
            cout << "0"; 
    } 
} 
  

int main() 
{ 
    int n = 123212232; 
    decToBinary(n); 
}