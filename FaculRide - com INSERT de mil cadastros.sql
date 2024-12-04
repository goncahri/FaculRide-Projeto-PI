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


insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (6, 'THM3U4', 'Orange', '911', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (7, 'WZE7A2', 'Purple', 'Camaro', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (8, 'PVI7C1', 'Aquamarine', 'GTI', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (9, 'VNX1K9', 'Turquoise', 'Grand Marquis', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (10, 'OLG9N8', 'Aquamarine', 'Z3', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (11, 'PSU1H9', 'Crimson', 'Tercel', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (12, 'IOT7E4', 'Green', 'Sierra 2500', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (13, 'JEN0K1', 'Khaki', 'X-90', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (14, 'CKW5S8', 'Crimson', 'Freelander', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (15, 'CGM2F4', 'Pink', 'M5', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (16, 'VNO5C9', 'Pink', 'Estate', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (17, 'OTF7U9', 'Teal', 'MKT', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (18, 'UWO5M9', 'Aquamarine', 'A8', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (19, 'FWG3L5', 'Violet', 'Esprit Turbo', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (20, 'ATR7R5', 'Green', 'MKX', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (21, 'VWF7Z8', 'Maroon', '599 GTB Fiorano', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (22, 'XYE7U1', 'Red', 'Century', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (23, 'RJD5Y9', 'Khaki', 'Tiguan', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (24, 'MDJ2J9', 'Mauv', 'GTI', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (25, 'QIQ5D2', 'Turquoise', 'Corvette', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (26, 'RGO1W8', 'Violet', 'T100 Xtra', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (27, 'GMX3H5', 'Red', 'B-Series', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (28, 'CGF2Z2', 'Purple', 'TT', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (29, 'MKW0C7', 'Violet', '1500', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (30, 'SHB7N1', 'Goldenrod', 'Blazer', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (31, 'FIU4F4', 'Fuscia', 'Escape', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (32, 'TTH8P2', 'Teal', 'F350', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (33, 'GJN3E2', 'Purple', 'Cavalier', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (34, 'DVA1C4', 'Aquamarine', 'Riviera', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (35, 'IDA6R2', 'Khaki', 'RL', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (36, 'KPH3N8', 'Orange', 'S-Series', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (37, 'TFY0K2', 'Mauv', '940', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (38, 'MGR5K7', 'Goldenrod', 'Range Rover', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (39, 'YVE2E0', 'Aquamarine', 'M-Class', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (40, 'YPM2U7', 'Puce', 'CX-7', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (41, 'DVW5P3', 'Fuscia', 'Safari', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (42, 'VFI7R2', 'Fuscia', 'Town Car', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (43, 'PAX0L5', 'Maroon', 'Celica', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (44, 'KPF8B3', 'Mauv', 'Corsica', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (45, 'OJN0D7', 'Aquamarine', 'Civic GX', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (46, 'TUN8K1', 'Mauv', 'Montero', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (47, 'LNM0I5', 'Blue', 'GS', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (48, 'JIJ0U2', 'Yellow', 'Miata MX-5', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (49, 'DPM1E7', 'Purple', 'Town & Country', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (50, 'GNV0F0', 'Blue', 'Excel', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (51, 'LAS6I5', 'Khaki', 'Xtra', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (52, 'WCN4G3', 'Green', 'VS Commodore', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (53, 'SIH1D6', 'Orange', 'Grand Prix', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (54, 'UCH8B5', 'Green', 'Impala', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (55, 'WBL8N9', 'Teal', 'Avalanche', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (56, 'BNE4S2', 'Mauv', 'Neon', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (57, 'MTR2G6', 'Teal', 'Ram Van B250', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (58, 'FVY7T4', 'Fuscia', '9-5', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (59, 'OOC8E0', 'Indigo', 'Country', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (60, 'WFB2Y1', 'Khaki', 'Sidekick', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (61, 'WQC8V4', 'Puce', '300ZX', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (62, 'VOT2L7', 'Crimson', '612 Scaglietti', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (63, 'WVL7Q9', 'Puce', 'tC', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (64, 'CLI2H4', 'Fuscia', 'Focus', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (65, 'TTS1B8', 'Khaki', 'Pajero', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (66, 'TUT2F3', 'Violet', 'Silverado 3500', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (67, 'PNG0B5', 'Teal', 'Camry', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (68, 'ZVE4G6', 'Maroon', 'Forester', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (69, 'QTJ3W0', 'Indigo', 'Econoline E250', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (70, 'EGE9Y7', 'Blue', 'C30', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (71, 'URL5X7', 'Fuscia', 'Ram 1500', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (72, 'WVS4T5', 'Maroon', '57', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (73, 'RON6I8', 'Yellow', 'Cabriolet', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (74, 'JHY4E6', 'Mauv', 'Escalade EXT', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (75, 'TCE8G8', 'Purple', 'X-Type', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (76, 'WYR7P0', 'Blue', 'Jetta', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (77, 'TAS9X8', 'Orange', 'GS', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (78, 'KCF9F2', 'Pink', 'Tundra', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (79, 'RUM9M6', 'Indigo', 'Sable', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (80, 'BLO9V5', 'Khaki', 'Santa Fe', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (81, 'SJU6X2', 'Teal', 'XK Series', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (82, 'MJF6M1', 'Fuscia', 'Swift', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (83, 'BNP7R2', 'Maroon', 'XJ', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (84, 'CKX4N5', 'Indigo', 'Mountaineer', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (85, 'DOW8K5', 'Mauv', 'Bonneville', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (86, 'JNW0Y2', 'Teal', 'Continental', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (87, 'NXV5T4', 'Fuscia', 'MX-3', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (88, 'TFZ4Y9', 'Pink', 'Aerio', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (89, 'HKO8G3', 'Puce', 'DeVille', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (90, 'PFO1F4', 'Fuscia', 'Sentra', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (91, 'ZBW2I0', 'Crimson', 'Villager', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (92, 'GFU9J6', 'Fuscia', 'Range Rover Sport', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (93, 'ATB1I8', 'Purple', 'Navigator', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (94, 'ZAI5R4', 'Pink', 'Sentra', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (95, 'NGH0J6', 'Puce', 'Breeze', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (96, 'NDG8B9', 'Indigo', 'Mazda5', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (97, 'WGW8H1', 'Khaki', '62', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (98, 'QVU0Q1', 'Fuscia', '500E', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (99, 'ILZ2Y2', 'Puce', 'Passat', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (100, 'NVX6I7', 'Turquoise', 'FX', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (101, 'KJV0A9', 'Teal', 'E150', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (102, 'CHA6X4', 'Khaki', 'Pathfinder', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (103, 'GIG1G9', 'Maroon', 'Thunderbird', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (104, 'TON4O4', 'Indigo', 'I', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (105, 'SZP5D0', 'Red', 'Ram 3500 Club', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (106, 'SSY0L4', 'Purple', 'Hemisfear', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (107, 'OOK8K5', 'Turquoise', 'F250', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (108, 'MHO6G4', 'Turquoise', 'Mark VIII', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (109, 'KNQ5W0', 'Pink', 'M', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (110, 'MLE5C4', 'Maroon', 'GS', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (111, 'JWA8S5', 'Goldenrod', 'Scirocco', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (112, 'UFM6L1', 'Pink', 'G6', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (113, 'LJC2H9', 'Pink', 'Samurai', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (114, 'SUR3Y9', 'Pink', 'F250', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (115, 'XEG5Q5', 'Indigo', 'Element', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (116, 'GQB0A7', 'Mauv', '9-4X', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (117, 'SLF0C8', 'Fuscia', 'Estate', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (118, 'XBN4N2', 'Maroon', 'MDX', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (119, 'CEN0B7', 'Aquamarine', 'Club Wagon', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (120, 'GKC1O8', 'Blue', '2500', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (121, 'VCF7U1', 'Green', 'XK Series', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (122, 'CXU5R6', 'Mauv', 'Lucerne', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (123, 'EVH4C8', 'Khaki', 'Navigator L', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (124, 'CVU7C5', 'Violet', 'MR2', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (125, 'ECV7Y3', 'Pink', 'A3', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (126, 'UCG8U1', 'Mauv', 'Mark VIII', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (127, 'BNS5M1', 'Indigo', 'Tiguan', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (128, 'KQN3N5', 'Green', 'i-350', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (129, 'DJU4C4', 'Maroon', 'Econoline E150', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (130, 'QKG6P3', 'Fuscia', 'Thunderbird', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (131, 'QPA9L3', 'Orange', 'Sable', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (132, 'BLA9K5', 'Maroon', 'B2000', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (133, 'CTP1X6', 'Maroon', 'Mulsanne', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (134, 'DGN9W2', 'Puce', 'Savana 2500', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (135, 'MAC1A5', 'Violet', 'Astro', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (136, 'SBC6W9', 'Indigo', 'S-Class', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (137, 'SWK8Y3', 'Indigo', 'Impreza', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (138, 'JHS5T4', 'Pink', 'SJ', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (139, 'MLV9Z5', 'Orange', 'Azure T', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (140, 'ROX6D3', 'Yellow', 'CLK-Class', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (141, 'KVV7D0', 'Crimson', 'Yukon', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (142, 'YSI5O4', 'Turquoise', 'S80', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (143, 'OFX9N6', 'Red', 'Mustang', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (144, 'OZL3D0', 'Maroon', 'B-Series', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (145, 'OFT6A8', 'Crimson', 'Suburban 2500', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (146, 'TXC8D2', 'Yellow', '2500', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (147, 'HFG4B5', 'Maroon', 'Defender 90', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (148, 'ISZ5B8', 'Green', 'Eurovan', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (149, 'KPV4S9', 'Purple', 'GTI', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (150, 'ATD3S6', 'Purple', '300', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (151, 'QPD6P5', 'Teal', 'Escalade EXT', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (152, 'FFF8J6', 'Yellow', 'XJ', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (153, 'NLB4T8', 'Green', 'Golf', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (154, 'AVR8U5', 'Green', 'Rio5', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (155, 'MYJ7E8', 'Orange', 'Grand Caravan', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (156, 'KRL1T2', 'Purple', 'Taurus', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (157, 'CWA2F7', 'Orange', 'Optima', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (158, 'UQM7C6', 'Violet', 'Viper', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (159, 'IGS4J4', 'Crimson', 'Prizm', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (160, 'EWI8U8', 'Teal', 'Vision', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (161, 'WCM3E3', 'Pink', 'Fox', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (162, 'WQW9K3', 'Fuscia', 'PT Cruiser', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (163, 'DDN9N0', 'Aquamarine', 'Malibu', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (164, 'QCS6G3', 'Teal', 'Festiva', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (165, 'LFB5X2', 'Puce', 'Corvair', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (166, 'OSH2J2', 'Red', 'Silverado 2500', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (167, 'XBO5W8', 'Pink', 'tC', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (168, 'SDN5J2', 'Teal', 'Chariot', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (169, 'IQA0X1', 'Orange', 'Caravan', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (170, 'BSO5I2', 'Aquamarine', 'ES', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (171, 'CBA3N0', 'Blue', 'GTI', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (172, 'CZN3Q5', 'Khaki', '2500', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (173, 'JKB9E3', 'Green', 'Savana 3500', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (174, 'GXP1R5', 'Aquamarine', 'Rogue', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (175, 'OKG3O4', 'Blue', 'Crown Victoria', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (176, 'DAW1W5', 'Indigo', 'Rally Wagon 3500', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (177, 'YWW5Q8', 'Violet', '430 Scuderia', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (178, 'YAP2F6', 'Crimson', 'Expedition', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (179, 'YBK3Y1', 'Puce', '9-3', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (180, 'NCN4Z8', 'Pink', 'Corvette', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (181, 'FIY8N1', 'Pink', 'Ranger', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (182, 'UFY7Q9', 'Violet', 'Ram 3500', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (183, 'VDG6T8', 'Blue', 'Eurovan', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (184, 'NFT2C7', 'Fuscia', 'CLK-Class', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (185, 'ZZO9T1', 'Aquamarine', 'Probe', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (186, 'USU3M2', 'Goldenrod', 'Maxima', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (187, 'LDF7Z0', 'Orange', 'Taurus', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (188, 'XTA4J3', 'Indigo', 'SX4', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (189, 'SNG9G9', 'Fuscia', 'Ghost', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (190, 'AWD3J0', 'Aquamarine', 'Azera', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (191, 'IAY9E7', 'Maroon', 'Impala', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (192, 'GBE7B3', 'Yellow', 'Endeavor', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (193, 'XEB1U6', 'Pink', '300', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (194, 'YQM2Y3', 'Mauv', 'Sentra', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (195, 'QHV3M1', 'Teal', 'Outback', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (196, 'HLB7Z7', 'Orange', 'Sonoma Club Coupe', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (197, 'XOC2P4', 'Purple', 'Echo', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (198, 'EZL7C6', 'Blue', 'Mariner', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (199, 'DBN0C2', 'Orange', '164', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (200, 'SMU3Z3', 'Maroon', 'CX-9', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (201, 'ZEJ7E1', 'Green', 'Loyale', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (202, 'SGK4L5', 'Mauv', 'B-Series', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (203, 'AAQ3K9', 'Khaki', 'S10', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (204, 'LMM7S7', 'Violet', 'Aztek', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (205, 'TZH2B1', 'Violet', 'Outlander', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (206, 'RGA3U4', 'Aquamarine', 'Cougar', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (207, 'DDU8W4', 'Violet', 'Prizm', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (208, 'BXB0S2', 'Crimson', 'Ram Van 1500', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (209, 'RLM2W2', 'Indigo', 'Golf', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (210, 'GDB9Z9', 'Violet', 'PT Cruiser', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (211, 'OYL7B5', 'Khaki', 'Galant', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (212, 'WYF7H5', 'Puce', 'S6', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (213, 'GES8Z1', 'Mauv', 'Durango', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (214, 'XSG1A2', 'Red', 'Monte Carlo', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (215, 'RRJ7O7', 'Maroon', 'Civic', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (216, 'HNM3G3', 'Mauv', 'W201', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (217, 'XLH7R2', 'Purple', 'Concorde', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (218, 'UNB4O7', 'Turquoise', 'A8', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (219, 'YMC3U7', 'Goldenrod', 'Intrigue', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (220, 'AOI2H2', 'Orange', 'GX', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (221, 'EKR0X3', 'Pink', 'TT', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (222, 'BJD4C6', 'Indigo', 'GX', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (223, 'URM3M6', 'Orange', 'Grand Prix', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (224, 'ITB0R6', 'Indigo', 'Rapide', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (225, 'TZW6P4', 'Fuscia', 'Legacy', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (226, 'URF7Z9', 'Orange', 'RS 6', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (227, 'EXU2O6', 'Indigo', 'Edge', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (228, 'PNZ0K8', 'Purple', 'Cherokee', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (229, 'AEI9Y9', 'Purple', 'Discovery', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (230, 'RQP2E8', 'Blue', 'Commander', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (231, 'BSA0Y1', 'Aquamarine', 'Justy', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (232, 'YEB3Y7', 'Yellow', 'Regal', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (233, 'SUK8E7', 'Indigo', 'Freestar', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (234, 'QZE9O9', 'Green', 'Lanos', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (235, 'FWL6H1', 'Aquamarine', 'Odyssey', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (236, 'LNB7W7', 'Goldenrod', 'Bonneville', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (237, 'WAT7Z4', 'Teal', 'Accord', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (238, 'ZIT1I0', 'Blue', 'GTI', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (239, 'VHH8R7', 'Purple', 'Cavalier', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (240, 'FQB1J0', 'Aquamarine', '911', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (241, 'RQP4B7', 'Aquamarine', 'Range Rover', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (242, 'INA4V6', 'Turquoise', 'Grand Vitara', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (243, 'JGA5Z4', 'Aquamarine', 'Grand Marquis', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (244, 'SDD5W9', 'Teal', 'CR-Z', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (245, 'KKM9T3', 'Turquoise', 'A6', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (246, 'VEC9X9', 'Blue', 'S80', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (247, 'KHI6F0', 'Green', 'Bronco', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (248, 'MSV4F1', 'Turquoise', '4Runner', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (249, 'FHJ3C6', 'Turquoise', 'Taurus', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (250, 'MNR3W5', 'Khaki', 'Echo', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (251, 'ZTK3Y1', 'Fuscia', 'Silverado 2500', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (252, 'WSX2K6', 'Goldenrod', 'Miata MX-5', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (253, 'SAC5N5', 'Khaki', 'SC', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (254, 'VSA6N0', 'Yellow', 'Ranger', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (255, 'XHS2V5', 'Green', 'LS', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (256, 'UGQ6T5', 'Turquoise', 'X5 M', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (257, 'OCT3B2', 'Purple', 'G37', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (258, 'STP7H8', 'Goldenrod', 'Allante', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (259, 'OUA6B2', 'Aquamarine', 'Explorer', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (260, 'VAO0T9', 'Indigo', 'Cobalt SS', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (261, 'ITQ9P4', 'Crimson', 'Thunderbird', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (262, 'PPI9Y6', 'Maroon', 'Defender', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (263, 'CPS1Z9', 'Yellow', 'Avanti', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (264, 'SNP5F1', 'Khaki', 'Express 3500', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (265, 'YMK9A9', 'Green', 'Galant', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (266, 'NBN2J0', 'Goldenrod', '8 Series', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (267, 'NUQ0X8', 'Pink', 'Riviera', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (268, 'ITX6S5', 'Teal', 'Millenia', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (269, 'DQI3P0', 'Violet', 'LS', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (270, 'MCG6M3', 'Fuscia', 'Tacoma Xtra', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (271, 'YPL7Z8', 'Khaki', 'Sorento', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (272, 'NXP4T8', 'Fuscia', 'F350', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (273, 'QMK6F4', 'Puce', 'Talon', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (274, 'UHR6O6', 'Green', '911', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (275, 'XCK3D0', 'Yellow', 'Ram Van 3500', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (276, 'JCO2O8', 'Indigo', 'Summit', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (277, 'TZI7P3', 'Khaki', 'Grand Prix', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (278, 'OHX0G3', 'Goldenrod', 'Xtra', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (279, 'HXU9K7', 'Goldenrod', 'Protege', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (280, 'HAS9X5', 'Goldenrod', 'Aero 8', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (281, 'CBF2J0', 'Khaki', 'Civic', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (282, 'KPQ7S4', 'Crimson', 'Grand Vitara', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (283, 'ACS8P0', 'Indigo', 'Mini Cooper', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (284, 'TYJ5S9', 'Turquoise', 'Escalade EXT', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (285, 'NGX6B7', 'Violet', 'Corvette', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (286, 'QFV2A8', 'Crimson', 'Fit', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (287, 'KXR3Q8', 'Orange', 'Maxima', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (288, 'AEF7L7', 'Crimson', 'Villager', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (289, 'ZWN8N4', 'Fuscia', 'Malibu', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (290, 'OQW3T4', 'Turquoise', 'Amanti', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (291, 'DVB6G0', 'Aquamarine', 'Sable', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (292, 'AMI1Y4', 'Yellow', 'Miata MX-5', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (293, 'XLR0S0', 'Khaki', 'M-Class', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (294, 'ZZZ8C7', 'Crimson', '9-5', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (295, 'JRW2G6', 'Yellow', 'Regal', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (296, 'TYB6U9', 'Indigo', 'LeSabre', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (297, 'FQL9Z7', 'Green', 'Range Rover Classic', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (298, 'YXQ9T4', 'Puce', 'Pacifica', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (299, 'EWU6B3', 'Indigo', 'Precis', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (300, 'UCT2R5', 'Maroon', 'DeVille', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (301, 'DVF3H4', 'Orange', 'Explorer', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (302, 'BCS8R5', 'Aquamarine', 'S4', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (303, 'XOB6D3', 'Maroon', 'Express 3500', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (304, 'IED3X6', 'Green', 'Cooper Clubman', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (305, 'XSL1B2', 'Violet', 'Festiva', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (306, 'RFJ2S6', 'Teal', 'Lumina', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (307, 'TCO6B5', 'Indigo', 'Starion', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (308, 'IED8A3', 'Aquamarine', 'E250', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (309, 'ZNF5R2', 'Aquamarine', 'Sierra 2500', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (310, 'CMU1Q2', 'Fuscia', 'X5', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (311, 'BQP0U7', 'Crimson', 'Escort', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (312, 'NBX4B7', 'Teal', 'LTD Crown Victoria', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (313, 'NSL6M8', 'Turquoise', 'Colt', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (314, 'TPR7I6', 'Maroon', 'Paseo', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (315, 'KZX7E0', 'Puce', 'Grand Marquis', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (316, 'YKB5L6', 'Violet', 'xA', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (317, 'GLE2A4', 'Maroon', 'Grand Prix', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (318, 'VYU0M7', 'Purple', 'A3', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (319, 'SJS8S6', 'Violet', 'Aerostar', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (320, 'GOL9C2', 'Blue', 'Silverado 2500', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (321, 'UVU7V7', 'Blue', 'Savana', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (322, 'ZHS1I7', 'Orange', 'LeMans', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (323, 'RBT4M5', 'Puce', 'Frontier', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (324, 'DAN8W4', 'Green', 'Sebring', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (325, 'EUX0N6', 'Mauv', 'Mazda6', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (326, 'FTX4Q5', 'Aquamarine', 'Sportvan G30', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (327, 'HVT2S9', 'Teal', 'Ascender', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (328, 'IAG4J3', 'Blue', 'L-Series', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (329, 'SYJ9E4', 'Yellow', 'F250', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (330, 'MRU3W0', 'Blue', 'Vibe', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (331, 'QJB7Q3', 'Mauv', 'S6', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (332, 'FOK2B8', 'Red', 'Aurora', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (333, 'QBH4I6', 'Green', 'Sierra 1500', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (334, 'RKE7C7', 'Khaki', 'SRX', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (335, 'DMZ2Q0', 'Purple', 'TSX', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (336, 'VCJ7F7', 'Blue', 'Yukon XL 1500', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (337, 'TZB4D0', 'Teal', 'Econoline E150', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (338, 'MTM0B6', 'Khaki', 'RX-7', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (339, 'UDJ3R7', 'Khaki', '911', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (340, 'JCE7F1', 'Pink', 'Pajero', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (341, 'XVR4L9', 'Aquamarine', 'Endeavor', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (342, 'XSI0M1', 'Teal', 'Eldorado', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (343, 'GJK0O2', 'Orange', '200SX', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (344, 'XWP3L4', 'Blue', 'Somerset', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (345, 'JHM5F1', 'Aquamarine', 'X5', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (346, 'VDL7C7', 'Maroon', 'C-Class', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (347, 'EXK1X1', 'Yellow', '80', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (348, 'VKF8S7', 'Indigo', 'XJ', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (349, 'FZR0V7', 'Blue', 'Grand Prix', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (350, 'LQZ5L8', 'Khaki', 'Mark VII', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (351, 'SYV5F2', 'Goldenrod', 'Avalon', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (352, 'PLQ7U6', 'Pink', 'CX-7', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (353, 'ORP0X7', 'Blue', '911', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (354, 'JHC9B0', 'Puce', 'TL', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (355, 'UNJ3B4', 'Goldenrod', 'SSR', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (356, 'VLS4T4', 'Pink', '3500', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (357, 'ZJU8C3', 'Crimson', '4Runner', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (358, 'OJH0W1', 'Indigo', 'Thunderbird', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (359, 'WJH0I2', 'Goldenrod', 'Mustang', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (360, 'XGY2K0', 'Goldenrod', '3 Series', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (361, 'RNZ4W0', 'Maroon', 'i-370', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (362, 'RES1K0', 'Teal', '626', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (363, 'UNB0A0', 'Khaki', 'G35', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (364, 'XRD7T5', 'Pink', 'Phantom', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (365, 'UUM7O4', 'Puce', 'Quest', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (366, 'EMG2S9', 'Pink', '300ZX', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (367, 'UIE0B3', 'Mauv', 'D350 Club', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (368, 'BND5K7', 'Goldenrod', 'Vibe', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (369, 'VQM8C8', 'Turquoise', 'Continental', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (370, 'ULJ8K9', 'Fuscia', '626', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (371, 'XVZ1S3', 'Fuscia', 'RX', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (372, 'XME5P9', 'Aquamarine', 'Explorer', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (373, 'PEG5A8', 'Maroon', 'Continental GTC', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (374, 'QID2U0', 'Blue', 'MR2', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (375, 'XNY4Z4', 'Pink', 'Monaco', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (376, 'YFQ0D9', 'Turquoise', 'Sedona', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (377, 'NNZ6V7', 'Yellow', 'Sunbird', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (378, 'DYW3V3', 'Yellow', 'Canyon', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (379, 'DND4X6', 'Puce', 'Yukon', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (380, 'JPG6A1', 'Aquamarine', 'Magnum', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (381, 'TMN8D3', 'Purple', '1500', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (382, 'JAX2L1', 'Orange', '4Runner', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (383, 'YIS0U3', 'Yellow', 'Spectra', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (384, 'SPY2O7', 'Mauv', 'Festiva', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (385, 'LEG1A4', 'Crimson', 'Cavalier', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (386, 'XFQ3P8', 'Orange', 'Grand Vitara', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (387, 'IEU6Z3', 'Yellow', 'Thunderbird', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (388, 'BOW8Y8', 'Maroon', 'Seville', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (389, 'UDY9J1', 'Indigo', 'Celica', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (390, 'OKZ8D0', 'Pink', 'LX', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (391, 'NTM8J2', 'Aquamarine', 'Cabriolet', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (392, 'BAI2N9', 'Fuscia', 'Esprit', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (393, 'GQM2T3', 'Pink', 'Grand Am', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (394, 'DSI3N8', 'Green', 'Econoline E250', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (395, 'SQG5K9', 'Fuscia', 'Prius Plug-in Hybrid', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (396, 'BLL6T6', 'Orange', 'Sebring', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (397, 'ZJY9I0', 'Green', 'Horizon', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (398, 'KIM2G9', 'Teal', '9-3', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (399, 'KEI9E8', 'Maroon', 'Murciélago', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (400, 'ADV4E9', 'Violet', 'Element', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (401, 'THY7O9', 'Maroon', 'Mystique', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (402, 'WYH3D1', 'Khaki', 'Taurus', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (403, 'TQB9Q4', 'Fuscia', 'Chariot', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (404, 'AEA5L7', 'Turquoise', 'RX-7', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (405, 'NIP5V2', 'Violet', 'S-Type', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (406, 'ZIV9Z3', 'Teal', 'ES', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (407, 'DNK0T5', 'Violet', 'Ram Wagon B250', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (408, 'SSQ0X4', 'Crimson', '1500', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (409, 'VOI3Y8', 'Green', 'Veloster', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (410, 'WWZ1P6', 'Teal', 'Villager', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (411, 'PSY8N7', 'Maroon', 'S-Class', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (412, 'CKR3V1', 'Puce', 'Mini', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (413, 'XIB5C2', 'Violet', 'Golf III', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (414, 'PPD7Z7', 'Crimson', 'Uplander', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (415, 'CLX5T9', 'Indigo', 'CLS-Class', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (416, 'XRV8U3', 'Indigo', '1500', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (417, 'UTM7R2', 'Aquamarine', 'Ram 2500', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (418, 'NPK0Z0', 'Teal', 'Century', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (419, 'IJC6W6', 'Red', 'CL-Class', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (420, 'MJQ4F5', 'Crimson', 'Countach', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (421, 'EAY8R4', 'Red', 'LS', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (422, 'JHE1V4', 'Khaki', 'TL', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (423, 'HLL5U8', 'Mauv', 'A6', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (424, 'MID2I3', 'Turquoise', 'Concorde', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (425, 'ULO7Y1', 'Goldenrod', 'MPV', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (426, 'ICM0Z2', 'Pink', 'Uplander', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (427, 'WAL2V7', 'Khaki', 'Bronco', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (428, 'UBX8Q6', 'Purple', 'CLK-Class', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (429, 'RTO0B2', 'Orange', 'LS', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (430, 'FMA0I0', 'Maroon', 'Mustang', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (431, 'NWX6A9', 'Goldenrod', 'Viper', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (432, 'RVX8F4', 'Pink', 'Grand Prix', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (433, 'SAO7O6', 'Goldenrod', 'Discovery', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (434, 'LPQ2T3', 'Maroon', 'Continental GTC', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (435, 'JCO5Z6', 'Crimson', 'Capri', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (436, 'PRI3K3', 'Violet', 'Cordia', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (437, 'CAU0C7', 'Khaki', 'Accent', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (438, 'XOM5D8', 'Fuscia', 'B-Series Plus', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (439, 'BMG3N0', 'Violet', 'Continental GTC', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (440, 'LNJ9L0', 'Aquamarine', 'Mountaineer', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (441, 'FAP2J1', 'Violet', 'Aurora', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (442, 'YYI1O3', 'Yellow', 'W201', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (443, 'KCS0W1', 'Khaki', 'LaCrosse', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (444, 'WUA1J1', 'Green', 'Grand Prix', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (445, 'OMD9O0', 'Blue', 'Mustang', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (446, 'MZD7P1', 'Teal', 'Bronco', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (447, 'GMM5H9', 'Purple', 'LX', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (448, 'HFY6F5', 'Maroon', '300SE', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (449, 'CKH5B0', 'Indigo', 'Countach', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (450, 'LXP3Q9', 'Goldenrod', 'Camry', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (451, 'HHO5N0', 'Pink', 'Bronco II', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (452, 'XXN4O0', 'Khaki', 'Ranger', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (453, 'RVX5Z5', 'Khaki', 'E-Series', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (454, 'CHG2E4', 'Pink', 'IS-F', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (455, 'NLM5E8', 'Fuscia', 'del Sol', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (456, 'NDN4J3', 'Purple', 'Ion', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (457, 'KST0O1', 'Turquoise', 'Continental Flying Spur', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (458, 'NMQ3H3', 'Purple', 'Xterra', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (459, 'QVT9P1', 'Khaki', 'Quattroporte', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (460, 'ANJ7E8', 'Goldenrod', 'Bronco', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (461, 'OKY3X9', 'Crimson', 'Reno', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (462, 'YHD3L4', 'Green', 'Veracruz', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (463, 'DZD6R1', 'Khaki', 'Clubman', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (464, 'CIZ3I5', 'Puce', 'Mustang', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (465, 'VUK1C2', 'Turquoise', 'SC', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (466, 'ZBV2K6', 'Green', 'RX Hybrid', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (467, 'QRY3U0', 'Puce', 'Silverado', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (468, 'MJJ4H7', 'Green', 'Safari', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (469, 'IXB5N7', 'Yellow', 'xB', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (470, 'HMD6Q1', 'Aquamarine', 'Tracer', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (471, 'EKS8N2', 'Turquoise', 'Interceptor', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (472, 'MWJ3L9', 'Red', 'Corvette', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (473, 'SEE6L5', 'Mauv', 'Aurora', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (474, 'RYK6R2', 'Pink', 'Grand Caravan', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (475, 'KYV3M1', 'Crimson', '1500 Club Coupe', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (476, 'AIU9Z4', 'Purple', 'Esperante', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (477, 'QWX4V5', 'Violet', 'Suburban', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (478, 'CSW9A7', 'Violet', 'Century', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (479, 'FGA9C3', 'Puce', 'Aviator', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (480, 'IBM7W5', 'Orange', 'V90', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (481, 'KEO9Y1', 'Fuscia', 'Equinox', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (482, 'FJM8J7', 'Yellow', 'Escort', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (483, 'UVH1K2', 'Red', '5 Series', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (484, 'OYN4U0', 'Yellow', 'Ram 2500', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (485, 'NQS2Y9', 'Yellow', 'Z4', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (486, 'OES2P3', 'Green', 'Explorer', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (487, 'DBG0B7', 'Yellow', 'MX-5', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (488, 'OEJ5F9', 'Green', 'Mazdaspeed 3', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (489, 'IAN9D7', 'Orange', '911', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (490, 'UOR1K1', 'Indigo', 'MDX', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (491, 'MUD3L2', 'Maroon', 'GTO', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (492, 'ISP1W3', 'Green', 'Eos', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (493, 'ALK2V3', 'Crimson', 'Taurus', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (494, 'EEK1R4', 'Teal', 'HHR', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (495, 'TVY5S5', 'Red', 'Galant', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (496, 'EIF5D3', 'Yellow', 'Yukon XL 2500', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (497, 'VFB9G0', 'Indigo', 'V8 Vantage', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (498, 'UFX4Q7', 'Red', 'Volare', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (499, 'ELQ8Q8', 'Orange', 'D350 Club', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (500, 'NZG6X7', 'Orange', '5 Series', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (501, 'PQW9X0', 'Red', 'Hombre', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (502, 'UKO2T2', 'Yellow', 'Miata MX-5', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (503, 'SEC8S1', 'Puce', 'Touareg 2', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (504, 'CYY8D2', 'Khaki', 'Savana 2500', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (505, 'BDM8I7', 'Indigo', 'Prius Plug-in Hybrid', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (506, 'UMA1X5', 'Maroon', 'Montero', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (507, 'OER7L2', 'Crimson', 'Escalade EXT', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (508, 'NDJ9C7', 'Violet', 'Century', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (509, 'BDP9G8', 'Goldenrod', 'Corvette', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (510, 'UMX1J8', 'Yellow', 'Camaro', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (511, 'WHV2X6', 'Pink', 'Spirit', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (512, 'ACP7E1', 'Goldenrod', 'Yukon Denali', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (513, 'AJJ5H1', 'Maroon', 'Pilot', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (514, 'KZF4E9', 'Red', 'Vision', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (515, 'BLU6M9', 'Khaki', 'Prizm', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (516, 'HYW8F9', 'Indigo', 'Gemini', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (517, 'YUT7L4', 'Indigo', 'G', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (518, 'YKT0S8', 'Aquamarine', 'Grand Prix', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (519, 'FCZ7T5', 'Violet', 'Challenger', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (520, 'ZLY9F9', 'Goldenrod', 'DBS', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (521, 'GNN2P6', 'Pink', 'Sienna', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (522, 'DXN6U2', 'Aquamarine', 'RS4', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (523, 'MAX9T7', 'Violet', 'Countach', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (524, 'VEG9Q3', 'Mauv', 'Golf', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (525, 'GDV5G0', 'Indigo', 'Express 2500', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (526, 'IWB8E6', 'Mauv', 'Tiburon', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (527, 'GES5M5', 'Yellow', '626', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (528, 'UNX7W6', 'Pink', 'Yukon XL 1500', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (529, 'YGQ5N1', 'Mauv', 'Xterra', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (530, 'LAT7T8', 'Fuscia', 'Tercel', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (531, 'GQP6U6', 'Indigo', 'Sierra 2500', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (532, 'URW7H4', 'Crimson', '9-7X', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (533, 'PPR4Z8', 'Turquoise', 'Savana 2500', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (534, 'GBI2T6', 'Goldenrod', 'E150', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (535, 'XRZ2F2', 'Mauv', 'Suburban 2500', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (536, 'PSX8H0', 'Aquamarine', 'B-Series Plus', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (537, 'UST5B9', 'Goldenrod', 'GTI', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (538, 'ZEP1D5', 'Puce', 'Caravan', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (539, 'ZAV3T4', 'Blue', 'Ranger', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (540, 'NCV3G8', 'Yellow', 'RX Hybrid', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (541, 'GAH4Z4', 'Green', 'Suburban 1500', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (542, 'FRD5D1', 'Maroon', 'S80', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (543, 'ZPJ7Q1', 'Orange', 'Pathfinder Armada', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (544, 'GQX0U7', 'Fuscia', 'PT Cruiser', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (545, 'OQA4S9', 'Violet', 'E-Class', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (546, 'UIK0B1', 'Pink', 'X3', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (547, 'HHW6H6', 'Fuscia', 'Pathfinder', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (548, 'LVE7L1', 'Goldenrod', 'Laser', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (549, 'BZG8U6', 'Red', 'B-Series', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (550, 'QQK6M1', 'Fuscia', 'XJ', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (551, 'WRB6J2', 'Green', 'S2000', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (552, 'LYJ3W3', 'Green', 'CR-V', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (553, 'UQB3I3', 'Yellow', 'Escort', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (554, 'VPX0F2', 'Blue', 'Avalanche', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (555, 'YGJ8P4', 'Fuscia', 'Millenia', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (556, 'EIU0W0', 'Yellow', 'Spider', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (557, 'BGE5B5', 'Aquamarine', 'Town Car', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (558, 'YNV1C3', 'Crimson', 'Phantom', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (559, 'RIB1J7', 'Orange', 'i-Series', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (560, 'YRV3U9', 'Green', 'Tundra', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (561, 'YIU1I7', 'Green', 'Z4', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (562, 'FPX9H9', 'Puce', 'Firebird', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (563, 'WVX3V2', 'Goldenrod', 'MX-6', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (564, 'HQE3V4', 'Khaki', 'E-Class', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (565, 'YXX2B0', 'Turquoise', 'Ram 2500', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (566, 'GTZ4G1', 'Mauv', 'Panamera', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (567, 'ECT0B2', 'Aquamarine', 'Silverado 3500', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (568, 'SXF2T3', 'Violet', 'Yukon', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (569, 'LWG2S6', 'Mauv', 'Mustang', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (570, 'HIF2F3', 'Khaki', 'C-Class', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (571, 'YRC0W8', 'Turquoise', 'Countach', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (572, 'DWR4W6', 'Teal', 'Impala', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (573, 'TXC1C3', 'Yellow', 'Taurus', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (574, 'AAC9B4', 'Indigo', 'Prizm', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (575, 'JMO0S2', 'Blue', 'Passport', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (576, 'DIF5L9', 'Indigo', 'Explorer', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (577, 'XUU8P4', 'Red', 'Armada', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (578, 'KSN1P1', 'Puce', 'Astro', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (579, 'QTZ0B7', 'Goldenrod', 'M-Class', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (580, 'JGH6G6', 'Indigo', 'R8', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (581, 'HER2R0', 'Aquamarine', '5000S', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (582, 'QKN8Q8', 'Violet', 'S40', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (583, 'ITH0A9', 'Mauv', '3500', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (584, 'CVH9C1', 'Blue', 'Biturbo', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (585, 'MXW0I6', 'Red', 'Civic', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (586, 'EXC5Z0', 'Violet', 'Jimmy', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (587, 'FMP2B8', 'Aquamarine', 'Silverado Hybrid', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (588, 'KRT5J7', 'Violet', 'Lancer', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (589, 'ZVK5G2', 'Maroon', 'Rapide', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (590, 'EDM4J8', 'Yellow', 'XJ', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (591, 'SVR1G3', 'Aquamarine', 'Celica', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (592, 'TVV5O0', 'Turquoise', 'RX-7', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (593, 'AQM7X7', 'Blue', 'Magnum', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (594, 'CBW2Z9', 'Goldenrod', 'Malibu', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (595, 'PRY1G8', 'Crimson', 'GL-Class', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (596, 'OOA4P2', 'Fuscia', 'GS', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (597, 'GXT6V1', 'Pink', 'S-Class', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (598, 'VRJ2T1', 'Indigo', 'Camaro', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (599, 'LQJ1Y5', 'Aquamarine', 'Grand Am', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (600, 'VQE4F4', 'Maroon', 'i-370', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (601, 'QKG7S3', 'Goldenrod', 'Blazer', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (602, 'YCC3U0', 'Green', 'Sephia', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (603, 'ZGF4C0', 'Turquoise', 'F450', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (604, 'NPX5Q8', 'Teal', 'Jetta', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (605, 'QNC1E5', 'Orange', 'RSX', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (606, 'BZY0Q4', 'Fuscia', 'Esperante', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (607, 'OMC4K7', 'Maroon', '900', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (608, 'VRO3W9', 'Mauv', 'Ram 1500 Club', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (609, 'RUC0D6', 'Violet', 'Corolla', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (610, 'HRL0W0', 'Purple', 'Excursion', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (611, 'YBJ0E5', 'Mauv', 'Sable', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (612, 'HOG3W6', 'Orange', 'Lancer Evolution', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (613, 'ARS0X5', 'Green', 'Tacoma', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (614, 'DGA0L8', 'Pink', 'Topaz', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (615, 'QJZ1R2', 'Pink', 'Ranger', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (616, 'UTB2S5', 'Crimson', 'V40', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (617, 'HEM2F7', 'Green', 'Rogue', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (618, 'VAG2J3', 'Blue', 'Pathfinder', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (619, 'NES2Q6', 'Khaki', 'Riviera', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (620, 'CEF9Q9', 'Crimson', 'Aztek', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (621, 'AQW5Q0', 'Puce', 'XL-7', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (622, 'UID9Y7', 'Teal', 'TundraMax', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (623, 'AJS7N2', 'Fuscia', 'C30', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (624, 'RND3F9', 'Orange', 'X-Type', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (625, 'HXL7I5', 'Aquamarine', 'Corolla', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (626, 'OOI8G0', 'Green', 'Dakota', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (627, 'AHE0N0', 'Puce', 'TT', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (628, 'HNJ9R1', 'Blue', 'Lumina', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (629, 'AUB8J9', 'Crimson', 'Ion', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (630, 'WHD9V5', 'Blue', 'Yukon XL 2500', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (631, 'CMQ1P9', 'Yellow', 'Fox', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (632, 'IZO6B4', 'Puce', 'CTS', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (633, 'VSM8Q5', 'Green', 'MKZ', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (634, 'WEJ7E8', 'Yellow', 'Highlander', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (635, 'OYH4Y4', 'Red', 'Avalanche 1500', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (636, 'UEU4N2', 'Blue', 'Dakota', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (637, 'QLA1N5', 'Pink', 'Dakota', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (638, 'GDL0F9', 'Mauv', 'Gallardo', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (639, 'QEW0M2', 'Khaki', 'Outlander Sport', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (640, 'TND8Y2', 'Orange', 'Aurora', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (641, 'YTM8F6', 'Crimson', 'CX-7', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (642, 'IJS5G2', 'Yellow', 'XL-7', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (643, 'WQO5S7', 'Crimson', 'Colt', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (644, 'SHD4Q3', 'Violet', 'MR2', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (645, 'OXN2F4', 'Purple', 'RL', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (646, 'TQR3Y0', 'Puce', 'Forester', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (647, 'UAK6X3', 'Turquoise', '9000', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (648, 'LRN7Z1', 'Goldenrod', 'Spectra', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (649, 'MXN6J7', 'Aquamarine', 'F150', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (650, 'NWH7J6', 'Yellow', 'Skylark', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (651, 'MGW1O9', 'Blue', 'Cayman', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (652, 'IMH7R8', 'Aquamarine', 'Spyder', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (653, 'JMT5R0', 'Purple', 'Avalanche', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (654, 'NMC8R0', 'Crimson', 'A8', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (655, 'MJV1L8', 'Fuscia', 'CTS', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (656, 'CAK8U5', 'Red', 'Voyager', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (657, 'CPW5F2', 'Red', 'Escalade ESV', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (658, 'SHR4P8', 'Red', '5000CS', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (659, 'CIC5A0', 'Blue', 'S60', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (660, 'QKB0N3', 'Orange', '300ZX', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (661, 'CZY5B6', 'Indigo', 'Jetta', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (662, 'IBW1Q8', 'Teal', 'Mustang', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (663, 'VLN6M9', 'Indigo', 'Grand Prix', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (664, 'MCN6E3', 'Teal', 'Tredia', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (665, 'ZLY4Y2', 'Goldenrod', 'XK', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (666, 'BKI6P4', 'Red', '911', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (667, 'GUD1I5', 'Violet', 'Mountaineer', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (668, 'ZYR4O8', 'Turquoise', 'Explorer', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (669, 'UKS0G4', 'Green', 'Firebird', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (670, 'YSW1N8', 'Turquoise', 'Cutlass Supreme', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (671, 'TDL3H7', 'Maroon', '9000', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (672, 'HXY5X1', 'Crimson', 'Pathfinder', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (673, 'KIR5B6', 'Red', 'GX', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (674, 'ZTE2E4', 'Red', 'Tribute', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (675, 'CTB4D0', 'Aquamarine', 'B-Series', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (676, 'MIF3G3', 'Blue', 'Prelude', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (677, 'YGE4P9', 'Mauv', 'Legacy', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (678, 'WUP9T6', 'Orange', 'Lumina', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (679, 'VGN5H7', 'Khaki', 'Grand Prix', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (680, 'NMZ4H3', 'Puce', 'Mustang', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (681, 'HBS2T4', 'Violet', 'Pathfinder', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (682, 'LTZ5Z2', 'Maroon', '1500', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (683, 'ISB5V6', 'Maroon', 'Ram 3500 Club', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (684, 'XHJ6W8', 'Pink', 'Yukon', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (685, 'EDF3G3', 'Crimson', 'Tacoma', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (686, 'KIQ8N6', 'Pink', 'Passat', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (687, 'UVZ6Y7', 'Red', 'Defender', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (688, 'ZGH3Z2', 'Violet', 'Bonneville', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (689, 'DDU2U1', 'Fuscia', 'MPV', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (690, 'GMQ5Q2', 'Blue', 'Yukon', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (691, 'TIL4Q9', 'Violet', '6000', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (692, 'DCB8N0', 'Blue', 'Corvette', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (693, 'ISQ3O9', 'Indigo', 'Metro', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (694, 'KNW2H5', 'Fuscia', 'S6', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (695, 'TMB3X5', 'Violet', 'D250', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (696, 'WJJ9I1', 'Violet', '57', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (697, 'RHK4F9', 'Blue', 'Malibu', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (698, 'HJU5B6', 'Khaki', 'Enclave', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (699, 'LCD7Y6', 'Aquamarine', 'Magnum', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (700, 'OJZ5L8', 'Puce', 'Quattroporte', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (701, 'ULM5H4', 'Teal', 'Impala', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (702, 'XXY5B3', 'Teal', 'Maxima', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (703, 'YFC4A2', 'Red', 'XK', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (704, 'BDX9R9', 'Khaki', 'LS', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (705, 'LJS8I7', 'Fuscia', 'Accord', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (706, 'JLC4Q7', 'Orange', 'Trans Sport', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (707, 'NGK7Z9', 'Yellow', 'Grand Caravan', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (708, 'JZP6G4', 'Aquamarine', 'Sigma', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (709, 'IRE4E2', 'Puce', 'Crown Victoria', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (710, 'QBB1F8', 'Goldenrod', 'Tacoma', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (711, 'UXA2B5', 'Blue', '88', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (712, 'QCG6J0', 'Blue', 'S-Class', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (713, 'SWX0T6', 'Teal', 'Xtra', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (714, 'LPR8M6', 'Fuscia', 'C30', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (715, 'HQX7K0', 'Teal', 'GranTurismo', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (716, 'DNS9G4', 'Purple', 'Corvette', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (717, 'RIZ8A0', 'Crimson', '940', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (718, 'BAK2W9', 'Purple', 'F-Series', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (719, 'KME6V9', 'Goldenrod', 'New Yorker', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (720, 'DKH2W4', 'Goldenrod', 'T100', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (721, 'OSK0M8', 'Puce', 'RX Hybrid', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (722, 'NXN3E7', 'Red', 'Cougar', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (723, 'MFN0H7', 'Crimson', 'rio', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (724, 'JXP4X1', 'Orange', 'Justy', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (725, 'MTK3Q9', 'Puce', 'Maxima', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (726, 'OFP6Z9', 'Violet', '1500', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (727, 'EIA5X8', 'Turquoise', 'Mirage', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (728, 'CZK7O3', 'Fuscia', 'Savana', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (729, 'JAU4O1', 'Crimson', 'New Beetle', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (730, 'RGM9R2', 'Crimson', 'Ram 1500', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (731, 'QAA6C4', 'Pink', '62', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (732, 'BFQ8H6', 'Yellow', 'XK Series', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (733, 'SHX7Q6', 'Indigo', 'Corvette', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (734, 'GFZ8V8', 'Pink', 'Range Rover', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (735, 'XJW8M3', 'Teal', '911', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (736, 'BHT3F3', 'Crimson', 'Yukon XL', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (737, 'LUI6X7', 'Red', 'Esprit', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (738, 'FCY4E2', 'Mauv', 'Oasis', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (739, 'FPV9D8', 'Pink', 'IS', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (740, 'RON3D5', 'Mauv', 'R8', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (741, 'ZZW5M8', 'Yellow', 'X5 M', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (742, 'JJU1B8', 'Pink', 'Montero Sport', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (743, 'MRC3H8', 'Goldenrod', 'Rogue', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (744, 'YTK5X0', 'Red', 'Jetta', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (745, 'ZPO0T4', 'Blue', 'Ranger', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (746, 'WDW4T0', 'Crimson', 'A4', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (747, 'ITC1V3', 'Violet', 'Silhouette', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (748, 'LHT3K7', 'Crimson', 'Escort', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (749, 'LOY3W9', 'Green', 'Mazda3', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (750, 'YNB8B6', 'Fuscia', '9-5', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (751, 'GBU8S3', 'Yellow', 'Sentra', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (752, 'AIW1C9', 'Maroon', 'E-Class', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (753, 'FIY8H8', 'Khaki', 'Prius v', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (754, 'IVH0R0', 'Purple', 'S4', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (755, 'VRI0Y0', 'Puce', 'F150', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (756, 'ISM2H0', 'Purple', 'riolet', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (757, 'OTD0A0', 'Turquoise', 'Concorde', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (758, 'XQL9R1', 'Green', 'Regal', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (759, 'UEY3U2', 'Puce', 'Galant', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (760, 'PVC1Z6', 'Purple', 'Camaro', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (761, 'MVT4G1', 'Turquoise', 'Malibu', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (762, 'XSB7M4', 'Aquamarine', 'Capri', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (763, 'QGY4O8', 'Turquoise', 'Continental GTC', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (764, 'XAC3W3', 'Aquamarine', 'S80', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (765, 'JEN2S1', 'Purple', 'Express 1500', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (766, 'YBP5M8', 'Orange', 'Taurus', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (767, 'SPZ5Q1', 'Mauv', 'XLR-V', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (768, 'IHC3G5', 'Pink', 'Sonoma', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (769, 'LCL4P4', 'Goldenrod', 'California', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (770, 'MRH2H8', 'Khaki', 'Mighty Max Macro', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (771, 'DPW7R3', 'Maroon', 'Legacy', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (772, 'BRQ6N8', 'Indigo', 'G-Series G10', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (773, 'WAP9J7', 'Indigo', 'Astra', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (774, 'KCC8J9', 'Turquoise', 'Pacifica', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (775, 'VQA9N0', 'Goldenrod', 'Explorer', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (776, 'OCB9E5', 'Goldenrod', 'Sunbird', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (777, 'FWB2O3', 'Mauv', 'Azure', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (778, 'DGM8T7', 'Fuscia', 'LX', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (779, 'UIU1A4', 'Maroon', 'Focus', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (780, 'BCL3U2', 'Teal', 'Taurus', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (781, 'ZKB5J4', 'Violet', 'Biturbo', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (782, 'RIJ4D0', 'Teal', 'Freelander', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (783, 'EZV6X3', 'Puce', 'Challenger', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (784, 'UBC1N3', 'Aquamarine', 'Brat', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (785, 'TLL1F7', 'Khaki', 'Daewoo Magnus', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (786, 'IHV4J1', 'Puce', 'TT', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (787, 'BNV9J4', 'Pink', 'Bonneville', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (788, 'NDU3Y5', 'Blue', 'Ranger', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (789, 'EJT0H1', 'Indigo', 'JX', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (790, 'HVN9F7', 'Blue', 'RX', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (791, 'SUD5B4', 'Orange', 'Park Avenue', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (792, 'YDS2U3', 'Purple', 'Daewoo Kalos', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (793, 'LJB9M7', 'Indigo', 'Excursion', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (794, 'HBM9S0', 'Pink', 'Legacy', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (795, 'XGD2S6', 'Goldenrod', 'Maxima', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (796, 'CEU2T2', 'Yellow', '911', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (797, 'KKW5C6', 'Orange', 'Mulsanne', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (798, 'TCN4B7', 'Green', 'Electra', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (799, 'SVB4C7', 'Green', 'Diamante', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (800, 'DHC3T8', 'Fuscia', '5000S', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (801, 'TYY0N9', 'Orange', 'Fortwo', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (802, 'DJX4N9', 'Khaki', '350Z Roadster', '1996');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (803, 'JTI2G6', 'Mauv', 'MKX', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (804, 'POA3C7', 'Indigo', 'Tahoe', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (805, 'YND1V7', 'Goldenrod', 'Vigor', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (806, 'BWZ4I1', 'Turquoise', 'Silverado 3500', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (807, 'MST8D3', 'Fuscia', 'C30', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (808, 'LXJ5V6', 'Teal', 'Grand Prix', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (809, 'GNP0S7', 'Turquoise', 'S40', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (810, 'BGO3K5', 'Maroon', 'Omni', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (811, 'QDH2P9', 'Violet', 'Impreza', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (812, 'UWT8Z9', 'Yellow', 'Century', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (813, 'WVW6O8', 'Crimson', 'Sedona', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (814, 'COA4Z5', 'Aquamarine', 'LeBaron', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (815, 'VDI8P1', 'Mauv', 'Pathfinder', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (816, 'CIY9T0', 'Pink', 'Yukon XL 2500', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (817, 'HYB0C7', 'Turquoise', 'Sidekick', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (818, 'OIU4N4', 'Pink', 'LR4', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (819, 'FEE2J2', 'Indigo', 'Eurovan', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (820, 'WEL1B1', 'Orange', '4000s', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (821, 'AQB0X1', 'Pink', 'CL', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (822, 'BVO5W7', 'Teal', 'LS', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (823, 'OJV1S8', 'Indigo', 'Mazda5', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (824, 'QPI1C5', 'Green', 'C70', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (825, 'IDR8V3', 'Aquamarine', 'Ram 1500 Club', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (826, 'UKS9P6', 'Pink', 'Escort', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (827, 'YVN6L0', 'Khaki', 'Reno', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (828, 'GCA1I4', 'Teal', 'Bonneville', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (829, 'MYQ6K2', 'Violet', 'Pajero', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (830, 'EYN6U2', 'Indigo', 'Savana 1500', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (831, 'UHY2T3', 'Maroon', 'Jetta', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (832, 'LPC0G4', 'Crimson', 'Diamante', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (833, 'ZDI7Z1', 'Turquoise', '240SX', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (834, 'EWE3M6', 'Maroon', 'V8 Vantage', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (835, 'IXV9L1', 'Khaki', 'Tacoma', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (836, 'RNO4U8', 'Aquamarine', 'GS', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (837, 'NYY8G4', 'Orange', 'Amanti', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (838, 'XBU4K7', 'Green', 'Eos', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (839, 'BHQ8P7', 'Fuscia', 'Elantra', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (840, 'LKB0C8', 'Mauv', 'Outback', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (841, 'UJZ7Z8', 'Goldenrod', 'G', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (842, 'GQH5C1', 'Blue', 'Vantage', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (843, 'MTA0Y6', 'Goldenrod', 'Continental', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (844, 'YZN8W7', 'Violet', 'Passport', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (845, 'MQP8T6', 'Green', 'Mustang', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (846, 'YTO6L7', 'Yellow', 'Grand Vitara', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (847, 'XMG2V4', 'Yellow', 'A8', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (848, 'VBW2L1', 'Khaki', 'RX-7', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (849, 'ISW4S6', 'Orange', 'Horizon', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (850, 'WMO1V7', 'Crimson', 'Land Cruiser', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (851, 'IDZ2J1', 'Puce', 'Passat', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (852, 'BQU2I4', 'Puce', 'Tundra', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (853, 'BXK9I6', 'Orange', 'Marauder', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (854, 'PFT0O8', 'Blue', '240SX', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (855, 'HWA0W6', 'Maroon', 'Probe', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (856, 'UGN6U2', 'Turquoise', 'Courier', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (857, 'KYV3F7', 'Yellow', 'Civic', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (858, 'BZI6L7', 'Yellow', 'Altima', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (859, 'WMQ4M9', 'Fuscia', 'Yukon', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (860, 'HLP5G6', 'Violet', 'Supra', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (861, 'YBP5U4', 'Puce', 'Bonneville', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (862, 'MJQ4E7', 'Red', 'Suburban 1500', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (863, 'KZL4W9', 'Teal', '4000CS Quattro', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (864, 'UDS2E0', 'Khaki', 'Silhouette', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (865, 'EJT7W1', 'Green', 'Eldorado', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (866, 'QKR2J5', 'Orange', 'Accord', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (867, 'ULL3W9', 'Maroon', 'Savana 3500', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (868, 'GDV6L6', 'Violet', 'Express 3500', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (869, 'XVN4G3', 'Goldenrod', 'Savana 1500', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (870, 'QTV0O1', 'Mauv', 'Wrangler', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (871, 'EXD3N3', 'Fuscia', 'Ranger', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (872, 'MDZ6M0', 'Goldenrod', 'LaCrosse', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (873, 'NEC7W4', 'Fuscia', 'Intrepid', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (874, 'AKN2O0', 'Fuscia', 'Charger', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (875, 'LRW2C3', 'Mauv', 'Avalon', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (876, 'MCZ6E9', 'Puce', 'Sierra 1500', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (877, 'EZK5S9', 'Blue', 'Endeavor', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (878, 'SAU9D8', 'Teal', 'HHR', '2002');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (879, 'OYY3E6', 'Blue', 'B2600', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (880, 'URY2E3', 'Goldenrod', 'Coupe GT', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (881, 'QAG0V5', 'Yellow', '300SL', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (882, 'PPT7U3', 'Mauv', 'Civic', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (883, 'TCC6B6', 'Red', 'Cayman', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (884, 'EUP1W4', 'Maroon', 'Grand Caravan', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (885, 'WZS9E2', 'Violet', 'Montana', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (886, 'EWT3M7', 'Pink', 'Tacoma', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (887, 'DNN1N1', 'Blue', 'Nitro', '2010');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (888, 'OPL2O0', 'Green', 'Compass', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (889, 'YRI1W9', 'Violet', 'Diamante', '1988');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (890, 'HZH2W3', 'Maroon', 'Freestar', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (891, 'PRC3I1', 'Goldenrod', 'Elantra', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (892, 'UIP8C4', 'Goldenrod', 'C-Class', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (893, 'OIV8P0', 'Violet', '200', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (894, 'HNK2E9', 'Khaki', 'Sebring', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (895, 'WLY1P4', 'Indigo', 'Altima', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (896, 'SRG7S2', 'Green', 'M5', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (897, 'EKR3L8', 'Fuscia', 'E-Class', '2019');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (898, 'CTL9O4', 'Turquoise', '7 Series', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (899, 'FXX7K5', 'Indigo', '530', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (900, 'SWO6W1', 'Blue', 'Tempo', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (901, 'QXU9V5', 'Crimson', 'Silverado 3500', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (902, 'HXW5A9', 'Red', 'Bravada', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (903, 'SYW8Y6', 'Red', 'Vision', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (904, 'JSB4Y3', 'Green', 'Phantom', '1992');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (905, 'WAZ2A9', 'Aquamarine', 'Frontier', '1987');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (906, 'VKC6T7', 'Goldenrod', 'Mazda3', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (907, 'PJR1Y9', 'Purple', 'Pacifica', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (908, 'ULV1M2', 'Violet', 'RX', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (909, 'TYN0P2', 'Fuscia', 'D150 Club', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (910, 'XZS6R4', 'Orange', 'Expedition', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (911, 'YFC2O1', 'Orange', 'IS F', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (912, 'VYU6N8', 'Crimson', 'Express 2500', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (913, 'RLO8X1', 'Aquamarine', 'M', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (914, 'BPU9I8', 'Goldenrod', 'Swift', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (915, 'IFR2B2', 'Purple', 'G25', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (916, 'DHY7O3', 'Aquamarine', 'Malibu', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (917, 'TYE8Q1', 'Teal', 'Continental Super', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (918, 'LWB6V4', 'Green', 'LeMans', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (919, 'GNQ7S0', 'Green', 'Prizm', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (920, 'NIZ1S0', 'Indigo', 'Corolla', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (921, 'KTZ3R3', 'Yellow', 'Solstice', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (922, 'ONF0F6', 'Violet', 'CL-Class', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (923, 'XAR5M9', 'Crimson', 'Tribute', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (924, 'OHX6C7', 'Blue', 'Econoline E250', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (925, 'FKD1A5', 'Maroon', '900', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (926, 'MVK6V1', 'Fuscia', 'Aurora', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (927, 'SVM5P6', 'Fuscia', 'VUE', '1999');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (928, 'SON8M6', 'Purple', 'Sebring', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (929, 'BIU7Q3', 'Blue', '911', '2007');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (930, 'FSZ4B1', 'Khaki', 'Optima', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (931, 'PIM5F7', 'Blue', 'RX-8', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (932, 'SXV9K6', 'Crimson', 'Flex', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (933, 'UHE4D0', 'Puce', 'M-Class', '2020');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (934, 'XJE1Y2', 'Orange', 'MX-6', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (935, 'HXY5H4', 'Violet', 'Impala', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (936, 'YBJ1N6', 'Indigo', 'Lumina', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (937, 'FDN9Y0', 'Yellow', 'Allante', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (938, 'CBK9P7', 'Orange', 'MX-5', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (939, 'HJF5I8', 'Violet', 'C30', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (940, 'BYR7B8', 'Red', 'XG300', '2004');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (941, 'AHZ5C5', 'Aquamarine', 'Econoline E250', '1981');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (942, 'RZG2F9', 'Fuscia', 'Grand Caravan', '1994');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (943, 'VDI3O0', 'Red', 'Compass', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (944, 'JGG3W5', 'Green', 'V8 Vantage S', '2023');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (945, 'EEB1U3', 'Green', 'RX-7', '2013');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (946, 'LDJ5R0', 'Yellow', 'Sable', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (947, 'KJF8L8', 'Turquoise', 'SRX', '1998');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (948, 'AKB3Q5', 'Khaki', 'Sonoma', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (949, 'PHC5N3', 'Puce', 'Marquis', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (950, 'VWF2P5', 'Khaki', 'Sprinter', '2001');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (951, 'DSU7L9', 'Blue', 'CTS-V', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (952, 'ECZ7A0', 'Puce', 'Lynx', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (953, 'UMF0C6', 'Teal', 'Alcyone SVX', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (954, 'BHP1D7', 'Goldenrod', '370Z', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (955, 'NJZ1V9', 'Puce', 'Odyssey', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (956, 'XBZ6E8', 'Teal', 'Ram Van 3500', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (957, 'WQG0Q0', 'Blue', 'TundraMax', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (958, 'ZYT1Y5', 'Pink', 'XC90', '2008');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (959, 'LFL1W7', 'Khaki', 'Matrix', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (960, 'VSR4W6', 'Crimson', 'MGB', '2024');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (961, 'YPV3B5', 'Fuscia', 'Defender 90', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (962, 'UEW8C7', 'Puce', 'Grand Am', '2015');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (963, 'VBM1V0', 'Yellow', 'Firebird', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (964, 'JLD4X6', 'Purple', 'Celica', '1995');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (965, 'ZYV9B4', 'Goldenrod', 'A6', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (966, 'JTD2L6', 'Violet', '9-3', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (967, 'LUC3J9', 'Turquoise', 'Aerostar', '2006');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (968, 'BHO3D0', 'Puce', 'Discovery', '2012');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (969, 'ZPY2V7', 'Violet', 'Ridgeline', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (970, 'ZZO6C6', 'Green', 'S40', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (971, 'HEI0T3', 'Indigo', 'B-Series', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (972, 'CCU0S6', 'Violet', 'F-250 Super Duty', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (973, 'URS3J0', 'Pink', 'Countach', '1982');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (974, 'CZU3X3', 'Violet', 'Journey', '2003');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (975, 'SND2T9', 'Blue', 'Viper', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (976, 'JKP8P0', 'Yellow', 'Express 1500', '1997');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (977, 'DTG8G9', 'Green', 'Discovery Series II', '1993');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (978, 'KGH1B9', 'Fuscia', 'LS', '1983');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (979, 'QKU3S6', 'Teal', 'STS', '2000');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (980, 'FVD4U7', 'Fuscia', 'VUE', '2014');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (981, 'GRV9S4', 'Aquamarine', 'TrailBlazer', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (982, 'XRF7Z6', 'Indigo', 'Sebring', '2022');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (983, 'YUP6C9', 'Violet', 'Tahoe', '1980');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (984, 'PUF3X3', 'Puce', 'Camaro', '2017');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (985, 'PMK1J7', 'Mauv', 'Avenger', '2021');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (986, 'QCY7H6', 'Goldenrod', 'Sonata', '1986');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (987, 'XVB4B8', 'Mauv', 'Quest', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (988, 'VPX8C4', 'Puce', 'Element', '1989');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (989, 'AWE4O0', 'Turquoise', 'Cherokee', '2011');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (990, 'JWQ4M2', 'Khaki', 'Rainier', '1985');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (991, 'CFK8W1', 'Teal', 'E-Series', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (992, 'TXO6K0', 'Violet', 'Sedona', '2018');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (993, 'VXV4K6', 'Green', 'S2000', '1990');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (994, 'FMI9U8', 'Aquamarine', 'Discovery', '2005');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (995, 'RZD0M2', 'Mauv', 'MX-6', '');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (996, 'ZCS7N0', 'Indigo', 'Silverado 1500', '1984');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (997, 'KUP1J3', 'Crimson', 'Wrangler', '2016');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (998, 'NUY3P4', 'Teal', 'RX-7', '1991');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (999, 'YPD0I9', 'Blue', 'Sedona', '2009');
insert into Veiculo (ID_veiculo, Placa_veiculo, Cor, Modelo, Ano) values (1000, 'BOE0P6', 'Khaki', 'Roadmaster', '2002');

select *from Veiculo
