cmake_minimum_required(VERSION 3.13)
project(cpp)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(cpp
        Literal.cpp
        main.cpp
        menuApresentacao.cpp
        regrasProposicionais.cpp)
