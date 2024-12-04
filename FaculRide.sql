use FaculRide

Create table Usuario
(
ID_usuario int not null,
CPF bigint not null,
RA bigint not null,
Nome varchar(50) not null,
Tipo char(1) not null,
CNH bigint not null,
Data_nascimento date,
Genero char(1) not null,
Endereco varchar(50) not null,
Email varchar(30) null,
Telefone varchar(15) null,
Constraint PK_Usuario Primary key (CPF)
)

Create table Avaliacao
(
ID_Avaliacao int not null,
Comentario varchar(100) not null,
Estrelas char(5) null,
Constraint PK_Avaliacao Primary key (ID_Avaliacao),
)

Create table Veiculo
(
ID_veiculo int not null,
Placa_veiculo varchar(6) null,
Cor varchar(15) not null,
Modelo varchar(15) not null,
Ano Date,
Constraint PK_Veiculo Primary key (ID_veiculo)
)

Create table Viagem
(
Codigo_viagem  int not null,
ID_veiculo int not null,
Horario_saida datetime null,
Horario_entrada datetime null,
Ponto_destino varchar(40) not null,
Partida_passageiro varchar(40) not null,
Partida_motorista varchar(40) not null,
Constraint PK_Viagem Primary key (Codigo_viagem),
Constraint FK_ID_veiculo foreign key(ID_veiculo) references Veiculo(ID_veiculo),
)

Create table Viagem_cria
(
Codigo_viagem  int not null,
CPF bigint not null,
Constraint FK_Cod_viagem foreign key(Codigo_viagem) references Viagem(Codigo_viagem),
Constraint FK_Usuario_CPF foreign key(CPF) references Usuario(CPF)
)

Create table LOG
(
ID_Log int not null,
CPF bigint not null,
Codigo_viagem int not null,
Data_hora datetime null,
Tipo_Movimentacao char(1) not null,
Constraint PK_LOG Primary key (ID_Log),
Constraint FK_CPF_usuario foreign key(CPF) references Usuario(CPF),
Constraint FK_Codigo_viagem foreign key(Codigo_viagem) references Viagem(Codigo_viagem),
)

Create table Viagem_solicita
(
Codigo_viagem  int not null,
CPF bigint not null,
Constraint FK_Cd_viagem foreign key(Codigo_viagem) references Viagem(Codigo_viagem),
Constraint FK_user_CPF foreign key(CPF) references Usuario(CPF)
)

Create table Log_usuario
(
ID_Log int not null,
CPF bigint not null,
Constraint FK_ID_Log foreign key(ID_Log) references LOG(ID_Log),
Constraint FK_usua_CPF foreign key(CPF) references Usuario(CPF)
)

INSERT INTO Usuario
Values
(1, 33344455508, 3002424242424, 'Brino Jose', 'M', 05446000102, '05/05/2000', 'M', 'Rua das Dolores, n°300 - Itu - CEP: 18000-100', 'brinojose@hotmail.com', '15 99832-9080'),
(2, 40560741863, 3011392413011, 'Herivelton Goncalves', 'M', 05445997408, '23/12/1991', 'M', 'Rua José Filho, n°194 - Sorocaba - CEP: 18046-090', 'herivelton02@gmail.com', '15 99169-7891'),
(3, 44784543376, 3013131313131, 'Gabriela Almeida', 'P', 0, '06/06/2006', 'F', 'Rua da Flores, n°69 - Sorocaba - CEP: 18200-300', 'gabi2006@gmail.com', '15 99100-7999'),
(4, 28452554621, 3011392413011, 'Marcio Antonio', 'M', 10020030050, '08/12/1999', 'M', 'Av. Vasques, n°314 - Votorantim - CEP: 18111-461', 'marcio_antonio@bol.com', '15 99165-0298'),
(5, 35521051236, 3011392413011, 'Julia Bera', 'P', 10105930009, '23/07/2010', 'F', 'Rua Ari Cruz, n°789 - Sorocaba - CEP: 18222-222', 'julia.bera.2010@gmail.com', '15 99623-0260');


INSERT INTO Avaliacao
Values
(1, 'Muito bom', 5 ),
(2, 'Legal', 4 ),
(3, 'Excelente', 5 ),
(4, 'Ruim', 1 ),
(5, 'Bom', 3 );


INSERT INTO Veiculo
Values
(1,'FSK92W', 'Preto', 'Tracker', '2013'),
(2,'EOV909', 'Branco', 'Pampa', '1999'),
(3,'EFR1F8', 'Preto', 'Fox', '2010'),
(4,'XYZ7G5', 'Vermelho', 'Prisma', '2018'),
(5,'GEY5J7', 'Prata', 'Civic', '2020');


INSERT INTO Viagem
Values
(1,1,'20-11-2024 20:30:00', '20-11-2024 22:30:00', 'Fatec Votorantim', 'Rua Camanducaia, n°200 - Piedade', 'Rua José Filho, n°194 - Sorocaba'),
(2,2,'20-11-2024 18:30:00', '20-11-2024 22:00:00', 'Fatec Votorantim', 'Rua Ari Cruz, n°789 - Sorocaba', 'Av. Vasques, n°314 - Votorantim'),
(3,3,'19-11-2024 17:30:00', '19-11-2024 21:30:00', 'Fatec Votorantim', 'Rua da Flores, n°69 - Sorocaba', 'Rua das Dolores, n°300 - Itu'),
(4,4,'18-11-2024 18:35:00', '18-11-2024 22:40:00', 'Fatec Votorantim', 'Centro Votorantim', 'Centro Sorocaba'),
(5,5,'18-11-2024 18:00:00', '18-11-2024 21:50:00', 'Fatec Votorantim', 'Fatec Sorocaba', 'Fatec Sorocaba');


INSERT INTO Viagem_cria
Values
(1, 33344455508),
(2, 40560741863),
(3, 44784543376),
(4, 28452554621),
(5, 35521051236);


INSERT INTO LOG
Values
(1, 33344455508, 1, '20-11-2024 20:30:00', 'I'), --I = inicio ; F = Fim
(2, 33344455508, 1, '20-11-2024 22:30:00', 'F'), --I = inicio ; F = Fim
(3, 35521051236, 2, '20-11-2024 18:30:00', 'I'), --I = inicio ; F = Fim
(4, 35521051236, 2, '20-11-2024 22:00:00', 'F'), --I = inicio ; F = Fim
(5, 44784543376, 3, '19-11-2024 17:30:00', 'I'), --I = inicio ; F = Fim
(6, 44784543376, 3, '19-11-2024 21:30:00', 'F'), --I = inicio ; F = Fim
(7, 40560741863, 4, '18-11-2024 18:35:00', 'I'), --I = inicio ; F = Fim
(8, 40560741863, 4, '18-11-2024 22:40:00', 'F'), --I = inicio ; F = Fim
(9, 28452554621, 5, '18-11-2024 18:00:00', 'I'), --I = inicio ; F = Fim
(10, 28452554621, 5, '18-11-2024 21:50:00', 'F') ;--I = inicio ; F = Fim


INSERT INTO Viagem_solicita
Values
(1, 33344455508),
(2, 28452554621),
(3, 33344455508),
(4, 40560741863),
(5, 35521051236);


INSERT INTO Log_usuario
Values
(1, 33344455508),
(2, 28452554621),
(3, 33344455508),
(4, 40560741863),
(5, 35521051236);

select * from Usuario

select * from Avaliacao

select * from Veiculo

select * from Viagem

select * from Viagem_cria

select * from LOG

select * from Viagem_solicita

select * from Log_usuario