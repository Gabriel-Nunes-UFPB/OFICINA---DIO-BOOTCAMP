# OFICINA---DIO-BOOTCAMP
Projeto Conceitual de Banco de Dados para uma oficina
# Projeto Conceitual de Banco de Dados para Oficina Mecânica

## Descrição do Projeto

Este projeto consiste no desenvolvimento de um **modelo conceitual de banco de dados** para um sistema de gerenciamento de ordens de serviço (OS) em uma oficina mecânica. O objetivo é fornecer uma estrutura robusta e escalável para gerenciar clientes, veículos, equipes de mecânicos, serviços, peças e ordens de serviço.

## Entidades Principais

### 1. Clientes
- Armazena informações sobre os clientes da oficina.
- Atributos: `IdClientes`, `Nome`, `Endereço`, `Veículos_idVeículos`.

### 2. Veículos
- Armazena informações sobre os veículos dos clientes.
- Atributos: `IdVeículos`, `Tipo`, `Placa`, `Marca`, `Modelo`, `Veículos_idVeículos`, `Equipe_idEquipe `, `Equipe_Mecânicos_idMecânicos `.

### 3. Equipe
- Gerencia as equipes de mecânicos.
- Atributos: `IdEquipe`, `Serviços`, `Mecânicos_idMecânicos`, `OS_idOS `.

### 4. OS (Ordem de Serviço)
- Registra as ordens de serviço.
- Atributos: `IdOS`, `Data de Emissão`, `Valor`, `Status`, `Data para conclusão`, `Valor da Peça`, `OS_idOS `.

### 5. Serviços
- Armazena os serviços realizados.
- Atributos: `IdServiços`, `Tipo Serviço`, `OS_idOS`.

### 6. Autorização
- Gerencia a autorização dos clientes para execução dos serviços.
- Atributos: `IdAutorização`, `cliente Autoriza Serviço`.

### 7. Mecânicos
- Armazena informações sobre os mecânicos.
- Atributos: `IdMecânicos`, `Nome`, `Endereço`, `Especialidade`.

### 8. Valor do Serviço
-  Armazena os valores associados aos serviços.
-  Atributos: `idValor do Serviço `, `Valor do Mão de Obra`, `Valor do Serviço`.

## Relacionamentos
    Clientes e Veículos:

        Um cliente pode ter vários veículos, e um veículo pertence a um único cliente.

    Veículos e Serviços:

        Um veículo pode ter vários serviços associados, e um serviço está vinculado a um único veículo.

    Veículos e Equipe:

        Um veículo é designado a uma equipe de mecânicos para execução dos serviços.

    Equipe e Mecânicos:

        Uma equipe pode ter vários mecânicos, e um mecânico pode pertencer a uma única equipe.

    OS e Serviços:

        Uma OS pode conter vários serviços, e um serviço está associado a uma única OS.

    OS e Autorização:

        Cada OS requer uma autorização do cliente para execução dos serviços.

    OS e Valor do Serviço:

        Cada OS tem um valor associado, que é calculado com base nos serviços e peças.
