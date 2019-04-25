cmake_minimum_required(VERSION 3.14)
project(cpp)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(cpp
        Conversor.cpp
        Literal.cpp
        Literal.h
        main.cpp
        menuApresentacao.cpp
        regrasProposicionais.cpp
        simplificadorLogico.cpp
        TableGenerator.cpp
        TableGenerator.h Conversor.h menuApresentacao.h regrasProposicionais.h simplificadorLogico.h)
