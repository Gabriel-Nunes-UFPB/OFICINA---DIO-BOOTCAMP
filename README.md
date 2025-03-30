# OFICINA---DIO-BOOTCAMP
Projeto Conceitual de Banco de Dados para uma oficina
# Projeto Conceitual de Banco de Dados para Oficina Mecânica

## Descrição do Projeto

Este projeto consiste no desenvolvimento de um **modelo conceitual de banco de dados** para um sistema de gerenciamento de ordens de serviço (OS) em uma oficina mecânica. O objetivo é fornecer uma estrutura robusta e escalável para gerenciar clientes, veículos, equipes de mecânicos, serviços, peças e ordens de serviço.

## 🏗️ Estrutura do Banco de Dados ##
O banco de dados é composto por diversas tabelas interligadas para garantir um gerenciamento completo dos serviços da oficina. Abaixo estão as principais tabelas e seus propósitos:

## 🔹 Clients (Clientes) ##
Armazena as informações pessoais dos clientes que utilizam os serviços da oficina.

### Campos: ###

idClients (Chave Primária) - Identificador único do cliente.
Fname - Primeiro nome do cliente.
Mname - Nome do meio do cliente.
Lname - Último nome do cliente.
Adress - Endereço do cliente.

## 🔹 Mechanics (Mecânicos) ##

Registra informações dos mecânicos que realizam os serviços na oficina.

### Campos: ###
idMechanics (Chave Primária) - Identificador único do mecânico.
Fname - Primeiro nome do mecânico.
Mname - Nome do meio do mecânico.
Lname - Último nome do mecânico.
Adress - Endereço do mecânico.
Expertise - Especialidade do mecânico (ex: Motor, Suspensão, Elétrica, etc.).

## 🔹 Authorization (Autorizações de Serviço) ##
Tabela responsável por armazenar a autorização do cliente para a execução do serviço.

### Campos: ###
idAuthorization (Chave Primária) - Identificador único da autorização.
CustomerAuthorized - Booleano indicando se o cliente autorizou o serviço.

## 🔹 ServiceOrder (Ordens de Serviço - OS) ##
Registra as ordens de serviço abertas na oficina.

### Campos: ###
idSO (Chave Primária) - Identificador único da ordem de serviço.
IssueDate - Data de abertura da OS.
Price - Valor total do serviço.
StatusSO - Status da ordem de serviço (Em espera, Autorizado, Finalizado, Cancelado).
ConclusionDate - Data de conclusão do serviço.
PieceValue - Valor das peças utilizadas na OS.

## 🔹 Services (Serviços) ##
Tabela que contém os serviços realizados dentro das ordens de serviço.

### Campos: ###
idService (Chave Primária) - Identificador único do serviço.
Authorization_idAuthorization - Chave estrangeira para autorização do cliente.
SO_idSO - Chave estrangeira para a ordem de serviço correspondente.
LaborValue - Valor da mão de obra do serviço.
TotalServiceValue - Valor total do serviço.
ServiceType - Tipo de serviço realizado (Troca de óleo, Troca de peça, Checkup, Troca de pneus, etc.).

## 🔹 Team (Equipes de Trabalho) ##
Registra quais mecânicos estão trabalhando em quais ordens de serviço.

### Campos: ###
idTeam (Chave Primária) - Identificador único da equipe.
Mechanic - Chave estrangeira para o mecânico responsável.
SO - Chave estrangeira para a ordem de serviço.

## 🔹 Vehicles (Veículos) ##
Armazena informações dos veículos atendidos na oficina.

### Campos: ###
idVeichles (Chave Primária) - Identificador único do veículo.
Services - Chave estrangeira para os serviços realizados.
Team - Chave estrangeira para a equipe responsável pelo veículo.
VeichleOwner - Chave estrangeira para o cliente dono do veículo.
VeichleType - Tipo do veículo (Carro, Moto, Caminhão).
CarPlate - Placa do veículo.
Brand - Marca do veículo.
Model - Modelo do veículo.

# 🔍 Funcionalidades do Banco de Dados #

Com essa estrutura, o banco de dados permitirá realizar as seguintes operações:

Cadastro e gerenciamento de clientes e mecânicos.
Registro de ordens de serviço e acompanhamento do status.
Armazenamento de serviços prestados, valores e peças utilizadas.
Criação de equipes de trabalho para atender cada OS.
Registro de veículos e seus respectivos proprietários.
Controle de autorizações dos clientes para execução dos serviços.
