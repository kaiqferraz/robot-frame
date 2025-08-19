*** Settings ***
Resource  ../resources/main.robot
Test Setup  Dado que o usuario acessa a aplicação
# Test Teardown  Fechar o navegador

*** Test Cases ***

TESTE 01 - Realizando cadastro do formulário
    Quando ele preenche o formulário de cadastro
    Entao deve validar o cadastro realizado com sucesso
