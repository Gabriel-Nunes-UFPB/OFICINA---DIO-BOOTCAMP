create database if not exists oficina;
use oficina;

create table clients (
	idClients int primary key auto_increment not null,
    Fname varchar(15),
    Mname char(3),
    Lname varchar(15),
    Adress varchar (45)
);

create table mechanics(
	idMechanics int primary key auto_increment,
	Fname varchar(15),
    Mname char(3),
    Lname varchar(15),
	Adress varchar (45),
    Expertise ENUM("Motor", "Suspensão", "Elétrica", "Pneus", "Injeção Eletrônica", 
					"Ar-condicionado", "Lataria/Pintura", "Diagnóstico Computadorizado")
);

create table authorization(
	idAuthorization int primary key auto_increment,
    CustomerAuthorized boolean not null default false
);

create table serviceOrder(
	idSO int primary key auto_increment,
    IssueDate datetime,
    Price DECIMAL(10,2),
    StatusSO ENUM("Em espera", "Autorizado", "Finalizado", "Cancelado") default "Em espera",
    ConclusionDate datetime,
    PieceValue DECIMAL(10,2)
);

create table services(
	idService int primary key auto_increment,
    Authorization_idAuthorization int,
    SO_idSO int,
    LaborValue decimal (10,2) not null,
    TotalServiceValue decimal (10,2) not null,
    ServiceType ENUM("Troca de óleo", "Troca de peça", "Checkup", "Troca de pneus"),
    
    constraint fk_idSO_SO foreign key(SO_idSO) references serviceOrder(idSO),
	constraint fk_Authorization_idAuthorization foreign key(Authorization_idAuthorization) references authorization(idAuthorization)
);

create table team(
	idTeam int primary key auto_increment,
    Mechanic int,
    SO int,
    
    constraint fk_mechanic_idMechanics foreign key(mechanic) references mechanics(idMechanics),
    constraint fk_SO_idSO foreign key(SO) references serviceOrder(idSO)
);

create table vehicles(
	idvehicles int primary key auto_increment,
    Services int,
    Team int,
	VeichleOwner int,
    VeichleType ENUM("Carro", "Moto", "Caminhão"),
    CarPlate char(7),
    Brand varchar(15),
    Model varchar(45),
    
    constraint fk_Services_idServices foreign key(Services) references serviceOrder(idSO),
    constraint fk_Team_idTeam foreign key(Team) references team(idTeam),
    constraint fk_VeichleOwner_idClient foreign key(VeichleOwner) references clients(idClients)
    
); 


-- INSERTS
INSERT INTO clients (Fname, Mname, Lname, Adress) VALUES
('Carlos', 'A.', 'Silva', 'Rua das Palmeiras, 123'),
('Mariana', 'B.', 'Souza', 'Av. Central, 456'),
('Roberto', 'C.', 'Ferreira', 'Rua das Rosas, 789'),
('Ana', 'D.', 'Lima', 'Rua dos Cravos, 321'),
('Lucas', 'E.', 'Pereira', 'Av. Paulista, 999');

INSERT INTO mechanics (Fname, Mname, Lname, Adress, Expertise) VALUES
('João', 'F.', 'Almeida', 'Rua das Máquinas, 100', 'Motor'),
('Pedro', 'G.', 'Ramos', 'Rua das Engrenagens, 200', 'Suspensão'),
('Fernanda', 'H.', 'Dias', 'Av. Mecânica, 300', 'Elétrica'),
('Ricardo', 'I.', 'Oliveira', 'Rua dos Motores, 400', 'Pneus'),
('Sofia', 'J.', 'Santos', 'Rua da Pintura, 500', 'Lataria/Pintura');

INSERT INTO authorization (CustomerAuthorized) VALUES
(true), (false), (true), (true), (false);

INSERT INTO serviceOrder (IssueDate, Price, StatusSO, ConclusionDate, PieceValue) VALUES
('2024-03-01 10:00:00', 450.00, 'Finalizado', '2024-03-02 15:00:00', 150.00),
('2024-03-05 14:30:00', 320.00, 'Em espera', NULL, 120.00),
('2024-03-10 09:15:00', 550.00, 'Autorizado', NULL, 200.00),
('2024-03-12 11:45:00', 180.00, 'Finalizado', '2024-03-13 16:20:00', 80.00),
('2024-03-15 08:00:00', 750.00, 'Cancelado', NULL, 300.00);

INSERT INTO services (Authorization_idAuthorization, SO_idSO, LaborValue, TotalServiceValue, ServiceType) VALUES
(1, 1, 300.00, 450.00, 'Troca de óleo'),
(2, 2, 200.00, 320.00, 'Checkup'),
(3, 3, 350.00, 550.00, 'Troca de peça'),
(4, 4, 100.00, 180.00, 'Troca de pneus'),
(5, 5, 450.00, 750.00, 'Troca de peça');

INSERT INTO team (Mechanic, SO) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

INSERT INTO vehicles (Services, Team, VeichleOwner, VeichleType, CarPlate, Brand, Model) VALUES
(1, 1, 1, 'Carro', 'ABC1234', 'Toyota', 'Corolla'),
(2, 2, 2, 'Moto', 'XYZ5678', 'Honda', 'CB 500'),
(3, 3, 3, 'Caminhão', 'LMN2468', 'Volvo', 'FH 540'),
(4, 4, 4, 'Carro', 'PQR1357', 'Ford', 'Focus'),
(5, 5, 5, 'Moto', 'STU9753', 'Yamaha', 'Fazer 250');


-- Recuperações simples com SELECT Statement
-- Recuperar todos os clientes
SELECT * FROM clients;

-- Recuperar todos os mecânicos e suas especialidades
SELECT Fname, Mname, Lname, Expertise FROM mechanics;

-- Recuperar todas as ordens de serviço
SELECT idSO, IssueDate, Price, StatusSO FROM serviceOrder;

-- Filtros com WHERE Statement
-- Buscar clientes cujo sobrenome seja "Silva"
SELECT * FROM clients WHERE Lname = 'Silva';

-- Buscar mecânicos especializados em Elétrica
SELECT * FROM mechanics WHERE Expertise = 'Elétrica';

-- Buscar ordens de serviço finalizadas
SELECT * FROM serviceOrder WHERE StatusSO = 'Finalizado';

-- Buscar veículos de uma determinada marca
SELECT * FROM vehicles WHERE Brand = 'Toyota';

--  Criação de atributos derivados
-- Calcular o custo total de um serviço considerando o preço da mão de obra e das peças
SELECT idService, LaborValue, PieceValue, (LaborValue + PieceValue) AS TotalCost
FROM services
JOIN serviceOrder ON services.SO_idSO = serviceOrder.idSO;

-- Gerar um nome completo para os clientes
SELECT idClients, CONCAT(Fname, ' ', Mname, ' ', Lname) AS FullName FROM clients;

-- Calcular o tempo decorrido entre a emissão e a conclusão das OS
SELECT idSO, IssueDate, ConclusionDate, 
	TIMESTAMPDIFF(DAY, IssueDate, ConclusionDate) AS Duration_Days
	FROM serviceOrder
	WHERE ConclusionDate IS NOT NULL;
    
-- Ordenações com ORDER BY
-- Listar os clientes em ordem alfabética
SELECT * FROM clients ORDER BY Lname ASC;

-- Listar as ordens de serviço do mais caro para o mais barato
SELECT * FROM serviceOrder ORDER BY Price DESC;

-- Listar os mecânicos com base na especialização (ordem alfabética)
SELECT * FROM mechanics ORDER BY Expertise ASC;

-- Condições de filtros aos grupos – HAVING Statement
-- Contar quantos serviços existem por tipo, filtrando os que têm mais de 5 ocorrências
SELECT ServiceType, COUNT(*) AS Total
FROM services
GROUP BY ServiceType
HAVING COUNT(*) > 5;

-- Média de preços de ordens de serviço finalizadas, considerando apenas valores acima de 300
SELECT StatusSO, AVG(Price) AS AvgPrice
FROM serviceOrder
GROUP BY StatusSO
HAVING AVG(Price) > 300;

-- Contar quantos mecânicos existem por especialidade e mostrar apenas as especialidades com mais de 2 profissionais
SELECT Expertise, COUNT(*) AS Total
FROM mechanics
GROUP BY Expertise
HAVING COUNT(*) > 2;

--  Criação de JOINs entre tabelas
-- Listar ordens de serviço com os nomes dos clientes
SELECT so.idSO, so.IssueDate, so.Price, so.StatusSO, 
       c.Fname, c.Lname 
FROM serviceOrder so
JOIN vehicles v ON so.idSO = v.idSO
JOIN clients c ON v.idVehicleOwner = c.idClients;

-- Listar mecânicos e as ordens de serviço que eles participaram
SELECT m.Fname, m.Lname, so.idSO, so.StatusSO
FROM mechanics m
JOIN team t ON m.idMechanics = t.idMechanic
JOIN serviceOrder so ON t.idSO = so.idSO;

-- Listar veículos e seus donos
SELECT v.CarPlate, v.Brand, v.Model, c.Fname, c.Lname
FROM vehicles v
JOIN clients c ON v.idVehicleOwner = c.idClients;

-- Listar serviços com as ordens de serviço associadas e os clientes
SELECT s.idService, s.ServiceType, s.TotalServiceValue, so.idSO, c.Fname, c.Lname
FROM services s
JOIN serviceOrder so ON s.SO_idSO = so.idSO
JOIN vehicles v ON so.idSO = v.idSO
JOIN clients c ON v.idVehicleOwner = c.idClients;



