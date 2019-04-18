cmake_minimum_required(VERSION 3.14)
project(cpp)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(cpp
        Literal.cpp
        Literal.h
        LiteralTest.cpp
        main.cpp
        menuApresentacao.cpp
        regrasProposicionais.cpp)
