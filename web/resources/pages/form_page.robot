*** Settings ***
Resource  ../main.robot
Library    OperatingSystem
Library    SeleniumLibrary

*** Variables ***
&{form}
...  Input_Nome=//input[contains(@class, 'whsOnd') and contains(@class, 'zHQkBf')]
...  Input_Descricao=//textarea[contains(@class, 'KHxj8b') and contains(@class, 'tL9Q4c')]
...  Input_Genero=//label[@for='i16']
...  Input_Hobbies=//label[@for='i28']
...  Input_ListaSuspensa=//div[contains(@class, 'MocG8c') and contains(@class, 'HZ3kWc')]
...  Input_ListaSuspensaOpcao=//div[@role='option' and .//span[normalize-space()='TESTE 01']]
# ...  Arquivo=//div[@role='button' and .//span[text()='Adicionar arquivo']]  necessário realizar login
...  Classificao=//label[@data-ratingscale='5']//div[@role='radio']
...  DataNascimento=//input[@type='date']
...  botaoEnviar=//div[@role='button']//span[text()='Enviar']
...  validarResposta=//div[contains(@class, 'vHW8K')]

*** Keywords ***
Dado que o usuario acessa a aplicação

    Open Browser  ${geral.URL}   ${geral.Browser}

    Maximize Browser Window

    Wait Until Element Is Visible  ${form.Input_Nome}  2s


Quando ele preenche o formulário de cadastro

    Wait Until Element Is Visible  ${form.Input_Nome}  2s
    Input Text                     ${form.Input_Nome}  ${registro.Nome}

    Wait Until Element Is Visible  ${form.Input_Descricao}  2s
    Input Text                     ${form.Input_Descricao}  ${registro.Descricao}

    Wait Until Element Is Visible  ${form.Input_Genero}  2s
    Click Element                  ${form.Input_Genero}

    Wait Until Element Is Visible  ${form.Input_Hobbies}  2s
    Click Element                  ${form.Input_Hobbies}

    Wait Until Element Is Visible  ${form.Input_ListaSuspensa}  2s
    Click Element                  ${form.Input_ListaSuspensa}

    Wait Until Element Is Visible  ${form.Input_ListaSuspensaOpcao}  5s
    Click Element                  ${form.Input_ListaSuspensaOpcao}
    Sleep  2s

    # Wait Until Element Is Visible  ${form.Arquivo}  2s
    # Choose File                    ${form.Arquivo}  ${registro.CaminhoArquivo}

    Wait Until Element Is Visible  ${form.Classificao}  2s
    Click Element                  ${form.Classificao}

    Wait Until Element Is Visible  ${form.DataNascimento}  2s
    Input Text                     ${form.DataNascimento}  ${registro.DataNascimento}

    Sleep  2s

    Wait Until Element Is Visible  ${form.botaoEnviar}  2s
    Click Element                  ${form.botaoEnviar}


Entao deve validar o cadastro realizado com sucesso

    Wait Until Element Is Visible  ${form.validarResposta}  2s
    Element Should Contain         ${form.validarResposta}  ${registro.ValidarResposta}
    Sleep  2s
    
    
        
