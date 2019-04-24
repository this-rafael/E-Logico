cmake_minimum_required(VERSION 3.14)
project(cpp)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(cpp
        binaryToDecimal.cpp
        binIEEE754ToFloat.cpp
        decimalToBinary.cpp
        FloatToBinIEEE754.cpp
        Literal.cpp
        Literal.h
        main.cpp
        menuApresentacao.cpp
        regrasProposicionais.cpp)
