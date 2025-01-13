DROP SCHEMA IF EXISTS clinica_2024;
CREATE SCHEMA clinica_2024;
USE clinica_2024;

CREATE TABLE paises (
ID_pais INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
PRIMARY KEY(ID_pais)
);

CREATE TABLE cidades (
ID_cidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
uf CHAR(2),
ID_pais INT NOT NULL,
FOREIGN KEY(ID_pais) REFERENCES paises(ID_pais)
);

CREATE TABLE especialidades (
ID_especialidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(80) NOT NULL
);

-- SHOW SCHEMAS;
-- SHOW TABLES;
-- SHOW CREATE TABLE cidades;
-- SHOW COLUMNS FROM paises;
-- DESCRIBE cidades;
-- DESC paises;

INSERT INTO paises VALUES (1, "Brasil");
INSERT INTO paises VALUES (2, "Argentina");
INSERT INTO paises VALUES (3, "Paraguai");
INSERT INTO paises VALUES (4, "Uruguai");
INSERT INTO paises VALUES (5, "Chile");

-- SELECT * FROM paises;
-- SELECT * FROM cidades;
-- SELECT * FROM especialidades;
-- SELECT nome FROM paises;

INSERT INTO paises (nome) VALUES
("Portugal"),("Espanha"), ("Alemanha"), ("Estados Unidos"), ("Canada");

INSERT INTO paises (nome) VALUES
("China"),("Japão"), ("Suriname"), ("França"), ("Russia"), ("Holanda"),("Itália"), ("Polônia"), ("Nigéria"), ("México");

INSERT INTO cidades VALUES
(1 , "Londrina", "PR", 1);

INSERT INTO cidades VALUES
(2 , "Cambé", "PR", 1);

INSERT INTO cidades VALUES
(3 , "São Paulo", "SP", 1);

INSERT INTO cidades VALUES
(4 , "Campinas", "SP", 1);

INSERT INTO cidades VALUES
(5 , "Curitiba", "PR", 1);

INSERT INTO cidades (nome, uf, ID_pais) VALUES
("Maringá", "PR", 1), ("Barracão", "PR", 1), ("Dionísio Cerqueira", "SC", 1), ("Buenos Aires", NULL, 2), ("Salto", NULL, 4);

INSERT INTO paises (nome) VALUES
("Camaroes"), ("Madagascar");

UPDATE paises SET nome = "Camarões" WHERE ID_pais = 21;

UPDATE paises SET nome = "Madagáscar" WHERE ID_pais = 22;

INSERT INTO especialidades VALUES (1, "Cardiologia");
INSERT INTO especialidades VALUES (2, "Dermatologia");
INSERT INTO especialidades VALUES (3, "Endocrinologia");
INSERT INTO especialidades VALUES (4, "Gastroenterologia");
INSERT INTO especialidades VALUES (5, "Ginecologia");

-- SELECT * FROM especialidades;

INSERT INTO especialidades (nome) VALUES
("Neurologia"), ("Oftalmologia"), ("Ortopedia"),("Otorrinolaringologia"),("Pediatria"),("Psiquiatria"),("Radiologia"),("Urologia"),("Anestesiologia"),
("Cirurgia Geral"),("Cirurgia Plástica"),("Neurocirurgia"),("Oncologia"),("Pneumologia"),("Reumatologia");

-- SELECT * FROM cidades WHERE UF="PR";
-- SELECIONAR O NOME DE TODAS AS CIDADES QUE NÃO SÃO DO PR
-- SELECT nome FROM cidades WHERE UF != "PR";
-- SELECIONAR O NOME DE TODOS OS PAISES EM ORDEM ALFABÉTICA(ASC)
-- SELECT nome FROM paises ORDER BY nome;
-- SELECIONAR O NOME DE TODOS OS PAISES EM ORDEM ALFABÉTICA(DESC)
-- SELECT nome FROM paises ORDER BY nome DESC;
-- SELECIONAR TODOS OS REGISTROS DA TABELA CIDADE EM ORDEM ALFABÉTICA(ASC) DE NOME
-- SELECT * FROM cidades ORDER BY nome;
-- SELECIONAR O NOME DAS CIDADE COM OS RESPECTIVOS NOME DE SEUS PAISES EM ORDEM ALFABÉTICA DO NOME DA CIDADE
-- SELECT cidades.nome, paises.nome FROM paises, cidades WHERE cidades.ID_pais = paises.ID_pais ORDER BY cidades.nome ASC;
-- SELECIONAR O NOME DA CIDADE E DA UF ONDE A UF É NULA("IS NULL")
-- SELECT nome, UF FROM cidades WHERE UF IS NULL;
-- SELECT cidades.nome, paises.nome FROM cidades,paises WHERE cidades.ID_pais = paises.ID_pais AND NOT (UF = "PR") ORDER BY cidades.nome ASC;
-- SELECIONAR APENAS AS CIDADES DO BRASIL(PROCURANDO ATRAVÉS DAS UFS)
-- SELECT cidades.nome, paises.nome FROM cidades,paises WHERE cidades.ID_pais = paises.ID_pais AND UF IS NOT NULL;
-- SELECIONAR O NOME DE TODAS AS CIDADES QUE COMEÇAM COM L
-- SELECT nome FROM cidades WHERE nome LIKE "L%";
-- SELECIONE AS CIDADES QUE CONTENHAM ON EM QUALQUER PARTE DO NOME
-- SELECT nome FROM cidades WHERE nome LIKE "%on%";
-- SELECIONAR O NOME DE TODAS AS ESPECIALIDADES QUE TENHAM A EXPRESSÃO GIA EM QUALQUER PARTE DO NOME
-- SELECT nome FROM especialidades WHERE nome LIKE "%gia%";

CREATE TABLE IF NOT EXISTS medico (
ID_medico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
data_nas DATE NOT NULL,
CPF VARCHAR(14) NOT NULL,
salario DECIMAL(8,2) NOT NULL,
rua VARCHAR(30) NOT NULL,
numero VARCHAR(20) NOT NULL,
complemento VARCHAR(20),
ID_cidade INT NOT NULL,
ID_especialidade INT NOT NULL,
FOREIGN KEY (ID_cidade) REFERENCES
cidades(ID_cidade),
FOREIGN KEY (ID_especialidade) REFERENCES
ESPECIALIDADES(ID_especialidade)
);

-- SHOW TABLES;
-- DDL RENOMEAR A TABELA MEDICO PARA MEDICOS EXEMPLOS:
RENAME TABLE medico TO medicos;
-- ALTER TABLE medico RENAME medicos;
-- RENAME TABLE medico1 TO medicos1,
-- medico2 TO medicos2,
-- medico3 TO medicos3;
-- DDL ADCIONAR O CAMPO OBSERVÇÕES NA TABELA DE MEDICOS
ALTER TABLE medicos
ADD observacoes VARCHAR(100) NOT NULL;
-- DESC medicos;
-- DDL REMOVER O ATRIBUTO OBSERVAÇÕES DA TABELA MEDICOS
ALTER TABLE medicos DROP observacoes;
-- DESC medicos;

INSERT INTO medicos VALUES
(1, "Joao Gabriel da Silva", "1980-07-31", "123.456.789-00", 8000.00, "Rua Rio de Janeiro", "100", "ap 801", 1, 1);
INSERT INTO medicos VALUES
(2, "Maria Eduarda dos Santos", "1975-06-29", "987.654.321-00", 8500.00, "Avenida Castelo Branco", "1200", NULL, 1, 2);

-- SELECT * FROM medicos;

-- Apresenta o total de cidades que são do Paraná
-- SELECT COUNT(nome) FROM cidades WHERE UF="PR";
-- Apresenta o total de especialidades que iniciam com a letra 'o'
-- SELECT COUNT(nome) FROM especialidades WHERE(NOME) LIKE 'O%';
-- Selecione o nome dos médicos e de suas respectivas especialidades
-- SELECT medicos.nome, especialidades.nome FROM medicos, especialidades WHERE medicos.id_especialidade = especialidades.id_especialidade;
-- Selecione o nome dos médicos, de suas respectivas especialidades e o nome das cidades dos médicos do PR
-- SELECT medicos.nome, especialidades.nome, cidades.nome FROM medicos, especialidades, cidades WHERE medicos.id_especialidade= especialidades.id_especialidade AND medicos.id_cidade= cidades.id_cidade AND UF="PR" ORDER BY medicos.nome;
-- SELECT medicos.nome AS "nome do medico", especialidades.nome AS "especialidades" FROM medicos, especialidades WHERE medicos.id_especialidade = especialidades.id_especialidade;
-- Elabore cinco enunciados de select diferentes utilizando o maximo de recursos vistos até o momento
-- Selecione o nome dos médicos que comece com J
-- SELECT medicos.nome FROM medicos WHERE nome LIKE'j%';
-- Selecione o nome, especialidade e salario dos medicos em ordem descrescente de salario
-- SELECT medicos.nome, especialidades.nome, medicos.salario FROM medicos, especialidades
-- WHERE medicos.id_especialidade= especialidades.id_especialidade ORDER BY salario DESC;
-- Selecione o nome e a UF das cidades que não são de são paulo e terminem com 'a'
-- SELECT cidades.nome, cidades.uf FROM cidades WHERE UF !="SP" AND nome LIKE'%a';
-- Selecione o nome e o ID das especialidades que contenham 'gia' e enumere em ordem decrescente
-- SELECT ID_especialidade, nome FROM especialidades WHERE especialidades.nome LIKE '%gia%' ORDER BY ID_especialidade DESC;
-- Selecione a ficha dos médicos sem revelar o seu endereço em ordem de quem é mais velho
-- SELECT medicos.ID_medico, medicos.nome, medicos.cpf, medicos.salario, medicos.data_nas FROM medicos ORDER BY data_nas;
-- DDL - Criação da tabela Planos de Saúde
CREATE TABLE Planos_Saude(
ID_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cobertura VARCHAR(255)
);
-- DML - inserção de registros na tabela Planos_Saude
INSERT INTO Planos_Saude(nome, cobertura) VALUES
('Plano Básico', 'Consultas, Exames Simples'),
('Plano Bronze', 'Consultas, Exames Simples, Exames Laboratoriais'),
('Plano Prata', 'Consultas, Exames Simples, Exames Laboratoriais, Internações'),
('Plano Ouro', 'Consultas, Exames Simples, Exames Laboratoriais, Internações, Cirurgias'),
('Plano Diamante', 'Consultas, Exames Simples, Exames Laboratoriais, Internações, Cirurgias, Emergencia 24h');

INSERT INTO Planos_Saude(nome, cobertura) VALUES
('Plano Familiar', 'Consultas, Exames Simples, Exames Laboratoriais, Internações, Cirurgias, Emergencia 24h, Plano Odontológico'),
('Plano Empresarial', 'Consultas, Exames Simples, Exames Laboratoriais, Internações, Cirurgias, Emergencia 24h, Assistencia Médica Empresarial'),
('Plano Executivo', 'Consultas, Exames Simples, Exames Laboratoriais, Internações, Cirurgias, Emergencia 24h, Check-up Anual'),
('Plano Senior', 'Consultas, Exames Simples, Exames Laboratoriais, Internações, Cirurgias, Emergencia 24h, Cuidado Geriátrico'),
('Plano Estudantil', 'Consultas, Exames Simples, Exames Laboratoriais, Internações, Cirurgias, Emergencia 24h');

-- SELECT * FROM Planos_Saude;

-- DDL - Criação de tabela de Pacientes, com os seguintes campos:
CREATE TABLE Pacientes (
ID_paciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
data_nas DATE NOT NULL,
cpf VARCHAR(14) NOT NULL,
telefone VARCHAR(15) NOT NULL,
email VARCHAR(100),
rua VARCHAR(50) NOT NULL,
numero VARCHAR(20) NOT NULL,
complemento VARCHAR(20),
ID_cidade INT NOT NULL,
FOREIGN KEY (ID_cidade) REFERENCES cidades(ID_cidade)
);
-- SELECT * FROM cidades;

INSERT INTO Pacientes VALUES
(1,'Joao Pedro Alves','1997-04-16','234.567.890-21', '(21) 91234-5678', 'joaopedro.alves92@gmail.com', 'Avenida Brasil', '465', 'Casa 1',1),
(2,'Maria Fernanda Silva', '1985-07-14', '345.678.901-32', '(31) 92345-6789', 'carloseduardo.pereira79@gmail.com', 'Avenida Paulista', '563', 'sala 15',2),
(3,'Julia Cristina Costa','1995-02-19', '567.890.123-54', '(51) 94567-8901', 'juliacristina.costa95@gmail.com', 'Rua dos Girassóis', '463', 'apt 405',3),
(4,'Gabriel Henrique Souza','2000-09-20', '678.901.234-65', '(61) 95678-9012','gabrielhenrique.souza00@gmail.com', 'Rua das Palmeiras', '232', 'Bloco B',4),
(5,'Larissa Gomes Santos','1998-12-18','789.012.345-76','(71) 96789-0123', 'larissa.gomessantos98@gmail.com','Rua das Oliveiras', '546', 'casa 3',5),
(6,'Rafael Barbosa Lima','1982-06-12','890.123.456-87','(81) 97890-1234',' [rafael.barbosalima82@gmail.com](mailto:rafael.barbosalima82@gmail.com)', 'Avenida das Nações', '567','apt 102',6),
(7,'Beatriz Oliveira Nunes','1993-06-13','901.234.567-98','(91) 98901-2345','beatriz.oliveiranunes93@hotmail.com','Rua das Magnólias','678','Bloco C',7),
(8,'Thiago Rodrigues Almeida','1986-01-16','012.345.678-90','(51) 99012-3456','thiago.rodriguesalmeida86@outlook.com','Rua dos Pinheiros','789','Sala 7',8),
(9,'Sofia Rocha Mendes','1997-08-27','123.456.789-01','(11) 90123-4567','sofia.rochamendes97@hotmail.com','Rua das Orquídeas','890','Casa 2',9),
(10,'Ana Clara Martins','1988-03-28','143.456.789-10','(11) 98765-4321','anaclara.martins88@outlook.com','Rua das Flores','132','Apt 45',10);

-- Exercicios Pacientes:
-- Selecione todos os registros da tabela Pacientes
-- SELECT * FROM pacientes;
-- Selecionar o nome de todos os pacientes que iniciam com a letra 'A'
-- SELECT pacientes.nome FROM pacientes WHERE nome LIKE'a%';
-- Selecionar o nome e o cpf de todos os pacientes cujos cpfs terminem com '00'
-- SELECT pacientes.nome, pacientes.cpf FROM pacientes WHERE cpf LIKE'%00';
-- Selecionar o nome e a rua dos pacientes que tem o complemento preenchido
-- SELECT pacientes.nome, pacientes.rua FROM pacientes WHERE complemento IS NOT NULL;
-- Selecionar o nome e data de nascimento dos pacientes em ordem decrescente de data de nascimento
-- SELECT pacientes.nome, pacientes.data_nas FROM pacientes ORDER BY data_nas DESC;
-- Selecionar o nome dos pacientes e o nome de suas cidades para os pacientes de fora do paraná
-- SELECT pacientes.nome, cidades.nome FROM pacientes, cidades WHERE pacientes.ID_cidade = cidades.ID_cidade AND UF!= 'PR';
-- Clausula LIMIT e OFFSET - Considerações
-- O uso do offset pode ser ineficiente em grandes tabelas, pois a consulta ainda precisa processar e contar os registros a serem pulados
-- Em alguns bancos de dados, índice
-- DDL - Criação de tabela Pacientes_Planos
CREATE TABLE Pacientes_Planos(
ID_paciente_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_paciente INT NOT NULL,
ID_plano INT NOT NULL,
numero_carteirinha VARCHAR(50),
validade DATE,
FOREIGN KEY(ID_paciente) REFERENCES Pacientes(ID_paciente),
FOREIGN KEY(ID_plano) REFERENCES Planos_Saude(ID_plano)
);


-- DML - Inserção de registros na tabela Pacientes_Planos 
INSERT INTO Pacientes_Planos(ID_paciente, ID_Plano, numero_carteirinha, validade) VALUES
(1, 3, '1234567890', '2023-01-01'),
(2, 5, '2345678901', '2024-02-15'),
(3, 6, '3456789012', '2024-03-20'),
(4, 6, '4567890123', '2024-04-10'),
(5, 7, '5678901234', '2023-05-01'),
(6, 7, '6789012345', '2024-06-05'),
(7, 10, '7890123456', '2024-07-25'),
(8, 10, '8901234567', '2024-07-30'),
(9, 6, '9012345678', '2024-09-12'),
(10, 7, '0123456789', '2024-10-01');
-- DML - Selecione o nome dos pacientes, o nome dos respectivos planos e a data de validade
/* SELECT pacientes.nome, planos_saude.nome, pacientes_planos.validade FROM pacientes, planos_saude, pacientes_planos 
WHERE pacientes.ID_paciente = planos_saude.ID_plano AND pacientes.ID_paciente = pacientes_planos.ID_paciente_plano;

-- Selecione o nome dos pacientes, o nome dos respectivos planos apenas dos planos vigentes
SELECT pacientes.nome, planos_saude.nome, pacientes_planos.validade FROM pacientes, planos_saude, pacientes_planos 
WHERE pacientes.ID_paciente = planos_saude.ID_plano AND pacientes.ID_paciente = pacientes_planos.ID_paciente_plano 
AND pacientes_planos.validade >= '2024-07-30';


-- Selecione o nome, a especialidade e a data de nascimento dos médicos que nasceram antes do ano de 1990
SELECT medicos.nome, especialidades.nome, data_nas FROM medicos, especialidades
WHERE medicos.ID_especialidade = especialidades.ID_especialidade
AND year(data_nas) < 1990;


-- Selecione o nome, especialidade e a data de nascimento dos medicos que nasceram em julho
SELECT medicos.nome, especialidades.nome, data_nas FROM medicos, especialidades
WHERE medicos.ID_especialidade = especialidades.ID_especialidade
AND MONTH(data_nas)=7;


-- Selecione o nome, especialidae e a data de nascimento dos medicos que nasceram em junho e julho
SELECT medicos.nome, especialidades.nome, data_nas FROM medicos, especialidades
WHERE medicos.ID_especialidade = especialidades.ID_especialidade
AND (MONTH(data_nas)=7 OR month(data_nas)=6);


-- Selecione o nome dos medicos que fazem aniversario hoje
SELECT medicos.nome, especialidades.nome, data_nas FROM medicos, especialidades
WHERE medicos.ID_especialidade = especialidades.ID_especialidade
AND ((DAY(medicos.data_nas)=31 AND MONTH (medicos.data_nas)=7));

-- Selecione o nome do paciente, o nome do plano de saude, o numero da carteirinha e o dia de validade do plano
SELECT pacientes.nome, planos_saude.nome, pacientes_planos.numero_carteirinha, DAY (pacientes_planos.validade)
FROM pacientes, planos_saude, pacientes_planos
WHERE pacientes.ID_paciente = pacientes_planos.ID_paciente AND planos_saude.ID_plano = pacientes_planos.ID_plano;

-- Selecione o nome do paciente, o nome do plano de saude, o numero da carteirinha e o mês de validade do plano 
SELECT pacientes.nome, planos_saude.nome, pacientes_planos.numero_carteirinha, MONTH(pacientes_planos.validade)
FROM pacientes, planos_saude, pacientes_planos
WHERE pacientes.ID_paciente = pacientes_planos.ID_paciente AND planos_saude.ID_plano = pacientes_planos.ID_plano;

-- Selecioneo nome do paciente, o nome do plano de saude, o numero da carteirinha e o ano de validade do plano
SELECT pacientes.nome, planos_saude.nome, pacientes_planos.numero_carteirinha, YEAR(pacientes_planos.validade)
FROM pacientes, planos_saude, pacientes_planos
WHERE pacientes.ID_paciente = pacientes_planos.ID_paciente AND planos_saude.ID_plano = pacientes_planos.ID_plano;

-- Selecione o nome do paciente, o nome do plano de saude, o numero da carteirinha e o ano de validade apenas dos planos de 2024 
SELECT pacientes.nome, planos_saude.nome, pacientes_planos.numero_carteirinha, YEAR(pacientes_planos.validade)
FROM pacientes, planos_saude, pacientes_planos
WHERE pacientes.ID_paciente = pacientes_planos.ID_paciente 
AND planos_saude.ID_plano = pacientes_planos.ID_plano
AND YEAR(validade) = 2024;
*/

-- DDL - Criação da tabela doenças
CREATE TABLE doencas(
	ID_doenca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    CID VARCHAR(10)
);

-- DML -Inserção de registros na tabela de doenças 
INSERT INTO doencas (nome,CID) VALUES
('Gripe', 'j10'),
('Diabetes Mellitus', 'E14'),
('Hipertensão Essencial', 'I10'),
('Asma', 'J45'),
('Pneumonia', 'J18'),
('Infarto Agudo do Miocárdio', 'I21'),
('Insuficiencia Renal Crônica', 'N18'),
('Tubercolose Pulmonar', 'A15'),
('Hepatite Viral', 'B19'),
('Depressão', 'F32');

INSERT INTO doencas(nome, CID) VALUES
('Artrite Reumatoide','M06'),
('Esclerose Múltipla','G35'),
('Doença de Alzheimer','G30'),
('Acidente Vascular Cerebral','I63'),
('Câncer de Pulmão','C34'),
('Hérnia de Disco','M51'),
('Doença Pulmonar Obstrutiva Crônica','J44'),
('Doença de Parkinson','G20'),
('Gastrite Aguda','K29'),
('HIV/AIDS','B20');

create table Pacientes_Doencas (
ID_paciente_doenca int not null auto_increment primary key,
ID_paciente int not null,
ID_doenca int not null,
data_diagnostico date not null,
foreign key (ID_paciente) references Pacientes(ID_Paciente),
foreign key (ID_doenca) references Doencas(ID_doenca)
);

INSERT INTO Pacientes_Doencas (id_Paciente, id_doenca, data_diagnostico) VALUES
(1, 1, '2023-06-15'),
(2, 5, '2023-06-15'),
(3, 2, '2023-07-21'),
(4, 7, '2023-08-09'),
(5, 3, '2023-09-17'),
(6, 4, '2023-10-05'),
(7, 6, '2023-11-22'),
(8, 8, '2024-01-10'),
(9, 9, '2024-03-15'),
(10, 10, '2024-04-25');
   
INSERT INTO Pacientes_Doencas (id_Paciente, id_doenca, data_diagnostico) VALUES
(1, 3, '2023-06-15'),
(2, 4, '2023-06-15'),
(3, 6, '2023-07-21'),
(4, 5, '2023-08-09'),
(5, 1, '2023-09-17');

/* SELECIONE OS PACIENTES QUE POSSUEM GRIPO OU DEPRESSÃO 
SELECT Pacientes.nome AS 'Paciente Nome' , doencas.nome AS 'Diagnóstico'
FROM Pacientes, doencas, Pacientes_Doencas
WHERE (doencas.CID = 'F32' OR doencas.CID = 'j10')
AND Pacientes.ID_paciente = Pacientes_Doencas.id_Paciente 
AND doencas.ID_doenca = Pacientes_Doencas.ID_doenca;

-- SELECIONE OS PACIENTES DIAGNOSTICADOS COM DOENÇAS CUJOS NOMES COMEÇAM COM A LETRA H
SELECT Pacientes.nome AS 'Paciente Nome' , doencas.nome AS 'Diagnóstico'
FROM Pacientes, doencas
WHERE doencas.nome LIKE'H%'
AND Pacientes.ID_paciente = doencas.ID_doenca;

-- Funções para manipulação de números
SELECT 10 + 5 AS 'Soma';
SELECT 10 - 5 AS 'Subtração';
SELECT 10 * 5 AS 'Multiplicação';
SELECT 10 / 5 AS 'Divisão';

SELECT ROUND (10.32);
SELECT ROUND (10.82);
SELECT ROUND (123.456,2);

-- Selecione o nome e o salario arredondado de cada medico
SELECT nome, ROUND(salario) FROM medicos;

-- Calcule a média dos salarios dos medicos e apresente o valor arredondado
SELECT ROUND(AVG(salario)) AS 'Média salarial arredondada'FROM medicos;
*/

-- Aumentar os salários de todos os médicos em 4,5%
-- UPDATE medicos SET salario = salario*1.045;
-- foi impedido pelo modo de segurança por ser um comando que altera uma tabela inteira 

-- Desabiitar modo de segurança do SQL
-- SET SQL_SAFE_UPDATES=0;
-- Habilitar modo de segurança do SQL 
-- SET SQL_SAFE_UPDATES=1;

/* Arredonda para o inteiro menor e mais proximo 
SELECT FLOOR(123.456);
-- Arredonda para o inteiro maior e mais proximo
SELECT CEIL(123.456);
*/

-- Mod: Traz o resto inteiro
-- Power: Potencia de um número
-- SQrt: Raiz quadrada
-- Truncate: Trunca um número para o número especificado de casas decimais sem arredondar
-- LOG: Retorna o logaritmo natural de um número
-- LOG10: Retorna o logaritmo base 10 de um número
-- SIN, COS, TAN: Calcula o seno, cosseno e tangente de um numero, respectivamente
-- RAND: Retorna um número gerado de forma aleatória
/*
SELECT MOD(10,3); -- Resultado 1
SELECT POWER(2,3); -- Resultado 8
SELECT SQRT(36); -- Resultado 6
SELECT TRUNCATE(123.4567, 2) AS Truncado; -- Resultado 123.45
SELECT LOG(10) AS Logaritmo_natural; -- Resultado 2.302...
SELECT LOG10(100) AS Logaritmo_base_10; -- Resultado 2
SELECT SIN(PI() / 2) AS Seno; -- Resultado 1
SELECT COS(PI()) AS Cosseno; -- Resultado -1
SELECT TAN(PI() / 4) AS Tangente; -- Resultado 1
SELECT RAND() AS 'Número Gerado'; -- Resultado aleatório  
SELECT RAND()*100 AS 'Número Gerado NULL'; -- Resultado aleatório e null
SELECT TRUNCATE(RAND()*100, 0) AS 'Número Gerado NULL e Truncado'; -- Resultado null e truncado
*/

/* Gerar um número aleatorio promocional até 1000(inteiro) para cada paciente
SELECT nome AS 'Nome do paciente',
TRUNCATE(RAND()*1000, 0) AS 'Número Promocional Gerado'
FROM Pacientes;

-- SIGN: se a coluna, ou expressão, ou valor forem: negativo => -1, Igual a zero => 0, Valor positivo => +1
SELECT SIGN(1928 -3289), SIGN(3289-1928), SIGN(1928-1928); -- Resultado: -1, 1, 0

-- ABS(coluna): Retorna o valor absoluto da uma coluna ou valor;
SELECT ABS(1928-3289); -- Resultado: 1361

-- Group By: um agrupamento de registros, utilizada par agrupar linhas que possuem valores iguais em colunas especificas em conjuntos de resumos
-- como contagens, somas, médias, etc.
-- é util quando se deseja obter informações agregadas sobre os grupos de dados.

-- Contar a quantidade de cidades por estados
SELECT UF AS Estado, COUNT(UF) AS 'Quantidade de cidades por Estado'
FROM Cidades WHERE UF is NOT NULL
GROUP BY UF;

-- Contar o número de pacienctes por cidade (pacientes x Cidades)Junção
SELECT c.nome AS 'Nome Cidade',
COUNT(*) AS 'Quantidade de Pacientes'
FROM Cidades c, Pacientes p
WHERE c.ID_cidade = p.ID_cidade
GROUP BY c.nome;

-- Contar o número de pacientes por doença (pacientes x doencas)
SELECT d.nome AS 'Nome da doença',
COUNT(*) AS 'Quantidade de Pacientes'
FROM pacientes_doencas pd, doencas d
WHERE d.ID_doenca = pd.ID_doenca
GROUP BY d.nome;

-- Selecionar a quantidade de paciente por plano
SELECT ps.nome AS 'Nome do plano',
COUNT(*) AS 'Quantidade de Pacientes'
FROM pacientes_planos pp, planos_saude ps
WHERE pp.ID_plano = ps.ID_plano
GROUP BY ps.nome;

-- Contar o numero de diagnósticos feitos para cada mes do ano de 2024
SELECT MONTH(data_diagnostico),
COUNT(data_diagnostico) AS 'Quantidade de Diagnosticos'
FROM pacientes_doencas 
WHERE YEAR(data_diagnostico) = 2024
GROUP BY MONTH(data_diagnostico);
*/

-- DML - Inserção de registros na tabela de Pacientes_doencas
INSERT INTO pacientes_doencas(ID_paciente, ID_doenca, data_diagnostico) VALUES
(6, 2, '2024-06-15'),
(7, 2, '2024-06-20'),
(8, 2, '2024-06-20'),
(9, 3, '2024-07-10'),
(10, 3, '2024-07-11');

-- SELECT * FROM pacientes_doencas;

/* SELECT p.nome , d.nome 
FROM pacientes p, doencas d, pacientes_doencas pd
WHERE p.ID_paciente = pd.ID_paciente
AND d.ID_doenca = pd.ID_doenca;
*/

-- a função GROUP_CONCAT é uma função agregada que concatena valores de várias linhas em uma unica cadeia de caracteres.
-- é frequentemente utilizada em conjunto com a clausula GROUP BY para combinar valores de um grupo em uma unica cadeia de caracteres separada por vírgulas ou por um delimitador especifico

/* SELECT p.nome AS 'Nome do Paciente',
GROUP_CONCAT(d.nome SEPARATOR', ')
FROM pacientes p, doencas d, pacientes_doencas pd
WHERE p.ID_paciente = pd.ID_paciente
AND d.ID_doenca = pd.ID_doenca
GROUP BY p.nome;

-- Selecionar todas as cidades e cada paciente residente nelas
SELECT c.nome AS 'Nome da cidade', GROUP_CONCAT(p.nome SEPARATOR', ') AS 'Paciente da cidade'
FROM cidades c, pacientes p
WHERE c.ID_cidade = p.ID_cidade
GROUP BY c.nome;
*/

INSERT INTO pacientes_doencas(ID_paciente, ID_doenca, data_diagnostico) VALUES
(1, 8, '2024-11-05'),
(2, 11, '2024-08-02'),
(3, 18, '2024-09-12'),
(5, 9, '2024-08-25'),
(5, 14, '2024-10-2');

/* Selecione os pacientes que foram diagnosticados com mais de uma doença 
SELECT p.nome AS 'Nome do Paciente',
COUNT(ID_doenca) AS 'Quantidade de diagnósticos'
FROM pacientes p, pacientes_doencas pd
WHERE p.ID_paciente = pd.ID_paciente
GROUP BY p.nome
HAVING COUNT(ID_doenca)>2;
*/

-- DDL - Criação da tabela Agendamentos
CREATE TABLE Agendamentos (
ID_agendamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_paciente INT NOT NULL,
ID_medico INT NOT NULL,
data_agendamento DATE NOT NULL,
hora_agendamento TIME NOT NULL,
STATUS VARCHAR(20) NOT NULL,
FOREIGN KEY (ID_paciente) REFERENCES Pacientes(ID_paciente),
FOREIGN KEY (ID_medico) REFERENCES Medicos(ID_medico)
);

-- Inserção de registros na tabela de agendamentos 
INSERT INTO Agendamentos
(ID_paciente, ID_medico, data_agendamento, hora_agendamento, STATUS) VALUES
(1, 2, '2024-06-01', '08:30:00', 'Confirmado'),
(2, 1, '2024-06-02', '09:00:00', 'Confirmado'),
(3, 2, '2024-06-03', '10:00:00', 'Confirmado'),
(4, 1, '2024-06-03', '11:30:00', 'Confirmado'),
(5, 2, '2024-06-04', '08:00:00', 'Confirmado'),
(6, 1, '2024-06-05', '14:00:00', 'Confirmado'),
(7, 2, '2024-06-06', '15:30:00', 'Confirmado'),
(8, 1, '2024-06-07', '16:00:00', 'Confirmado'),
(9, 2, '2024-06-09', '10:30:00', 'Confirmado'),
(10, 1, '2024-06-10', '11:00:00', 'Confirmado');

INSERT INTO Agendamentos
(ID_paciente, ID_medico, data_agendamento, hora_agendamento, STATUS) VALUES
(1, 2, '2024-08-13', '08:30:00', 'Cancelado'),
(2, 1, '2024-06-14', '09:00:00', 'Agendado'),
(3, 2, '2024-06-14', '10:00:00', 'Agendado'),
(4, 1, '2024-06-15', '11:30:00', 'Agendado'),
(5, 2, '2024-06-15', '08:00:00', 'Agendado'),
(6, 1, '2024-06-16', '14:00:00', 'Agendado'),
(7, 2, '2024-06-16', '15:30:00', 'Agendado'),
(8, 1, '2024-06-20', '16:00:00', 'Agendado'),
(9, 2, '2024-06-20', '10:30:00', 'Agendado'),
(10, 1, '2024-06-20', '11:00:00', 'Agendado');

-- SELECT * FROM agendamentos;
-- SELECT STATUS FROM agendamentos;
-- SELECT DISTINCT STATUS FROM agendamentos;

/* Selecionar o nome das cidades onde os pacientes moram 
SELECT DISTINCT c.nome 
FROM pacientes p, cidades c
WHERE p.ID_cidade = c.ID_cidade;

-- Selecionar todos os diferentes
SELECT DISTINCT(ps.nome) 
FROM pacientes_planos pp, planos_saude ps
WHERE pp.ID_plano = ps.ID_plano;

-- Selecionar os diferentes nomes de doenças diagnosticadas em pacientes
SELECT DISTINCT(d.nome) AS 'Doenças Diagnosticadas'
FROM doencas d, pacientes_doencas pd
WHERE d.ID_doenca = pd.ID_doenca;

-- Selecionar todos os diferentes médicos que tem consultas no mês de junho de 2024
SELECT DISTINCT(m.nome) AS 'Médico Agendados'
FROM medicos m, agendamentos a
WHERE YEAR(data_agendamento) = 2024 AND MONTH(data_agendamento) = 06
AND m.ID_medico = a.ID_medico;
*/

-- Funções para manipulação de datas

-- DAY()
-- MONTH()
-- YEAR()
-- CURDATE() - Data atual 
-- CURRENT_DATE() - Data atual ambas equivalentes
-- SYSDATE() - Data atual e o horario rodado 
-- NOW() - Data atual e o horario, ambas equivalentes
-- DAYNAME() - Diz o dia da semana de determinada data escolhida

/*
SELECT CURDATE() + INTERVAL 10 DAY, 
CURRENT_DATE() + INTERVAL 10 MONTH;

-- Selecionar a idade média dos pacientes
SELECT CEIL(AVG(YEAR(CURDATE() ) - YEAR(data_nas) ) ) AS 'Idade média Pacientes'
FROM pacientes;

-- Selecionar a idade média dos médicos
SELECT CEIL(AVG(YEAR(CURDATE() ) - YEAR(data_nas) ) ) AS 'Idade média médicos'
FROM medicos;

-- Selecionar a média de idade dos pacientes por cidade
SELECT c.nome, CEIL((AVG(YEAR(CURDATE() ) - YEAR(p.data_nas) ) ) ) AS 'Idade média pacientes'
FROM cidades c, pacientes p
WHERE c.ID_cidade = p.ID_cidade
GROUP BY(c.nome);

-- Selecionar a média de idade dos médicos por cidade
SELECT c.nome, CEIL((AVG(YEAR(CURDATE() ) - YEAR(m.data_nas) ) ) ) AS 'Idade média pacientes'
FROM cidades c, medicos m
WHERE c.ID_cidade = m.ID_cidade
GROUP BY(c.nome);

SELECT SYSDATE(), NOW();

SELECT DAYNAME('2024-08-16');
SELECT DAYNAME('2005-06-26');
SELECT MONTHNAME('2024-08-16');

-- Apresente o nome dos pacientes, o dia da semana e o nome do mês que cada paciente nasceu
SELECT p.nome, DAYNAME(p.data_nas) AS 'Dia do nascimento', MONTHNAME(p.data_nas) AS 'Mês do nascimento'
FROM pacientes p;

SELECT DAYOFMONTH('2024-08-20'); -- Retorna o dia do mês escolhido
SELECT DAYOFYEAR(); Retorna o dia do Ano escolhido
SELECT DAYOFWEEK(); 1 A 7 de sabado ao domingo 
SELECT ADDDATE(); Adiciona um intervalo a uma determinada data 
SELECT SUBDATE(); Subtrai um intervalo a uma data
*/

/* Selects Day's 
Apresente o nome do paciente, o nome da cidade, o nome do país e o dia do mês que cada paciente nasceu
SELECT p.nome AS 'Nome do Paciente', c.nome'Nome da cidade', pa.nome'Nome do País', DAYOFMONTH(p.data_nas)
FROM pacientes p, cidades c, paises pa
WHERE c.ID_cidade = p.ID_cidade AND c.ID_pais = pa.ID_pais;

-- Apresente o nome do paciente, o nome da cidade, o nome do país e o dia do ano em que cada paciente nasceu
SELECT p.nome AS 'Nome do Paciente', c.nome'Nome da cidade', pa.nome'Nome do País', DAYOFYEAR(p.data_nas) AS 'Dia do Ano'
FROM pacientes p, cidades c, paises pa
WHERE c.ID_cidade = p.ID_cidade AND c.ID_pais = pa.ID_pais;

Obter o nome do paciente, o dia da semana, do mês e do ano das datas de agendamento
SELECT p.nome AS 'Nome Paciente', 
DAYOFWEEK(a.data_agendamento) AS dia_semana,
DAYOFMONTH(a.data_agendamento) AS dia_mes,
DAYOFYEAR(a.data_agendamento) AS dia_ano
FROM pacientes p, agendamentos a
WHERE p.ID_paciente = a.ID_paciente;
*/

/* ADD DATE
SELECT ADDDATE(CURDATE(), 20);
SELECT ADDDATE(CURDATE(),INTERVAL 1 DAY);
SELECT ADDDATE(CURDATE(),INTERVAL 5 MONTH);
SELECT ADDDATE(CURDATE(),INTERVAL 2 YEAR);
*/

/* SUB DATE
SELECT SUBDATE(CURDATE(), INTERVAL 1 YEAR);
SELECT DATEDIFF(CURDATE(), '2020-01-01');
SELECT DATEDIFF(CURDATE(), '2005-06-26'); -- MEUS DIAS VIVIDOS 
*/

/* Calcular e mostrar a diferença entre dias da data atual e a data de nascimento dos pacientes
SELECT nome AS 'Paciente',DATEDIFF(CURDATE(), data_nas) AS 'Dias de Vida'
FROM pacientes;
*/

/* Intervalo de anos, meses, dias, horas, minutos, segundos
SELECT TIMESTAMPDIFF(YEAR, '2020-01-01', CURDATE());
SELECT TIMESTAMPDIFF(MONTH, '2020-01-01', CURDATE());
SELECT TIMESTAMPDIFF(DAY, '2020-01-01', CURDATE());
*/

/* Apresentar o nome de cada paciente e calcular a idade em meses(diferença de meses entre a data de nascimento dos pacientes e a data atual)
SELECT nome, TIMESTAMPDIFF(MONTH, data_nas, CURDATE()) AS 'Idade do Paciente em Meses'
FROM pacientes;
*/

-- SELECT LAST_DAY('2024-02-20');
-- SELECT LAST_DAY('2023-02-28');	

-- MAKEDATE(ANO,DIADOANO) Retorna uma data, dado os valores do ano e dia do ano(Dia do ano deve ser maior que 0 ou o resultado sera NULL)

-- SELECT MAKEDATE(2024,236); = 2024-08-23
-- SELECT MAKEDATE(2024,366); = 2024-12-31
-- SELECT MAKEDATE(2024,0); = NULL

-- SELECT FROM_DAYS(732488); Meu aniversário em dias

/* Extraindo dia mês e ano de forma exata
SELECT EXTRACT(DAY FROM CURDATE()) AS DIA,
EXTRACT(MONTH FROM CURDATE()) AS MÊS,
EXTRACT(YEAR FROM CURDATE()) AS ANO;
*/

/*
SELECT PERIOD_DIFF(
EXTRACT(YEAR_MONTH FROM NOW()), 
EXTRACT(YEAR_MONTH FROM '2017-08-23') 
);
*/

/*
SELECT nome, 
CEIL(PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM NOW()),
EXTRACT(YEAR_MONTH FROM (data_nas)))
/12) 
FROM pacientes;
*/

-- Função quarter() - Retorna o trimestre do ano
-- SELECT QUARTER(CURDATE()); = 3
-- SELECT QUARTER('2005-06-26'); = Meu aniversario é no 2 trimestre

-- SELECT WEEK(CURDATE()); = 33

-- Função weekday() - retorna um valor entre 0(segunda) e 6(domingo)
-- SELECT  WEEKDAY(CURDATE());

/* Função DATE_FORMAT - Oferece opções de formato de data
SELECT DATE_FORMAT(CURDATE(),'%D/%M/%Y');

SELECT @@LC_TIME_NAMES;
SET LC_TIME_NAMES = 'pt_BR';

-- Selecionar o nome e a data de nascimento formatada no padrão brasileiro para todos os médicos. 
-- ordene por data de nascimento
SELECT nome, DATE_FORMAT(data_nas,'%D/%M/%Y')
FROM medicos
ORDER BY data_nas;

SELECT nome as Médico,
data_nas as 'Data Nascimento',
date_format(data_nas, '%W') as 'Semana',
date_format(data_nas, '%a') as 'Semana Abr',
date_format(data_nas, '%W') as 'Dia da Semana Int',
date_format(data_nas, '%M') as 'Mês',
date_format(data_nas, '%b') as 'Mês Abr'
FROM medicos 
ORDER BY data_nas;
*/
-- Função str_to_date() - Função que converte string em data
-- SELECT STR_TO_DATE('23-08-2024' , '%d-%m-%Y' );

/* 1 Conte quantas consultas foram realizadas em Junho
SELECT COUNT(data_agendamento)
FROM agendamentos
WHERE STATUS = 'Confirmado'
AND MONTH(data_agendamento) = '06' ;

-- 2 Selecione o nome dos médicos e de suas respectivas especialiadades e cidades que fizeram consultas no ano de 2024
SELECT m.nome, e.nome , c.nome
FROM medicos m, especialidades e ,cidades c, agendamentos a, pacientes p
WHERE p.ID_cidade = c.ID_cidade
AND m.ID_especialidade = e.ID_especialidade
AND m.ID_medico = a.ID_medico
AND a.ID_paciente = p.ID_paciente
AND a.STATUS = 'Confirmado'
AND YEAR(a.data_agendamento) = '2024';  

-- 3 Selecione o nome dos pacientes e de suas respectivas cidades que realizaram consultas em junho ou julho de 2024
SELECT p.nome, c.nome
FROM pacientes p, cidades c, agendamentos a
WHERE a.STATUS = 'Confirmado' 
AND(MONTH(a.data_agendamento) = '06'
OR MONTH(a.data_agendamento) = '07')
AND p.ID_paciente = a.ID_paciente
AND p.ID_cidade = c.ID_cidade;

-- 4 Selecione o nome e os dias dos seus respectivos nascimentos dos pacientes que fizeram aniversário neste mês
SELECT nome, dayofmonth(data_nas)
FROM pacientes
WHERE MONTH(data_nas) = MONTH(CURDATE());

-- 5 Selecione o nome dos pacientes, suas datas de nascimento e o nome de suas cidades para os pacientes que nasceram antes de 1990
SELECT p.nome, p.data_nas, c.nome
FROM pacientes p, cidades c
WHERE p.ID_cidade = c.ID_cidade 
AND YEAR(p.data_nas) < 1990;
*/
-- 6 Elaborar 3 enunciados(com os respectivos comandos SQL) Procure utilizar o maior numero de recursos vistos até o momento, Sua criatividade sera avaliada

/* 1: Utilizando o formato de data pt_BR selecione o nome, cidade, UF(paciente deve ser brasileiro) e a data de nascimento de pacientes nascidos antes de 2000
SELECT p.nome, c.nome, c.uf ,DATE_FORMAT(p.data_nas,'%d/%m/%y') 
FROM pacientes p, cidades c 
WHERE uf IS NOT NULL 
AND p.ID_cidade = c.ID_cidade
AND YEAR(p.data_nas) < 2000 ;

-- 2: Selecione o nome, dia da semana de nascimento de pacientes com consultas agendadas antes das 10hrs
SELECT p.nome AS 'Nome Paciente', DAYOFWEEK(a.data_agendamento) AS dia_semana, a.hora_agendamento
FROM pacientes p, agendamentos a
WHERE p.ID_paciente = a.ID_paciente
AND a.hora_agendamento < '10:00:00';

-- 3: Selecione apenas as consultas agendadas do mês 5 pra cima dos pacientes de Londrina que possuem a letra 'J' no nome
SELECT p.nome, a.data_agendamento, c.nome 
FROM agendamentos a, pacientes p, cidades c
WHERE MONTH(data_agendamento) > '05'
AND p.nome LIKE '%j%'
AND p.ID_paciente = a.ID_paciente
AND c.ID_cidade = p.ID_cidade;
*/

/*-- Funções de manipulação de horas CURTIME() - momento atual/hora
SELECT CURTIME();
SELECT CURRENT_TIMESTAMP();
SELECT DATE(CURRENT_TIMESTAMP());
SELECT TIME(CURRENT_TIMESTAMP());
*/
-- SEC_TO_TIME converte uma quantidade de segundos p/tempo (hh:mm:ss)
/*-- TIME_TO_SEC converte um tempo (hh:mm:ss) para segundos
SELECT SEC_TO_TIME(1000);
SELECT TIME_TO_SEC(3600);

-- HOUR() - RETORNA A HORA;
-- MINUTE() - RETORNA O MINUTO;
-- SECOND() - RETORNA O SEGUNDO;

SELECT HOUR('10:24:59') AS HORA;
SELECT MINUTE("10:24:59") AS MINUTO;
SELECT SECOND("10:24:59") AS SEGUNDOS;

-- TIMEDIFF - RETORNA A DIFERENÇA ENTRE DOIS TEMPOS
SELECT TIMEDIFF('10:28:59', '9:30:00');

-- TIME_FORMAT - FORMATAR DATAS
SELECT CURTIME() AS HORA,
TIME_FORMAT("14:33:50", "%H:%m%s") 
AS 'Hora Formatada';

SUBCONSULTAS:
-É uma consulta embutida dentro de outra consulta, de forma aninhada, passando os resultados da consulta mais interna para a consulta mais externa
- Elas podem ser usadas em várias partes de uma consulta, como na cláusula SELECT, FROM, WHERE, HAVING 
- e até mesmo como parte das instruções INSERT, UPDATE E DELETE
*/

/*-- Selecionar o nome dos pacientes e o número de doenças diagnosticadas para cada um
SELECT p.nome,
(SELECT COUNT(*)
FROM pacientes_doencas pd
WHERE pd.ID_paciente = p.ID_paciente) AS num_doencas
FROM pacientes p;
*/
/*-- Selecionar o nome e a data de nascimento do médico mais novo
SELECT nome, data_nas
FROM medicos
WHERE data_nas=(
SELECT MAX(data_nas)
FROM medicos
);
*/

/*-- LISTAR OS MEDICOS E A MEDIA DE SALARIO DOS MEDICOS QUE GANHAM MAIS DO QUE A MEDIA SALARIAL 
SELECT m.nome, m.salario
FROM medicos m, (
	SELECT AVG(salario) AS media_salario
    FROM medicos
) AS sub
WHERE m.salario > sub.media_salario;
*/

/*
-- Selecionar os nomes dos pacientes que têm
-- mais de 2 doenças diagnosticadas.
SELECT nome
FROM pacientes
WHERE id_paciente IN(
	SELECT ID_paciente
    FROM pacientes_doencas
    GROUP BY ID_paciente
    HAVING COUNT(ID_doenca) >2
);	

-- Listar os pacientes que têm agendamentos em junho de 2024
SELECT nome
FROM pacientes
WHERE ID_paciente IN(
	SELECT ID_paciente 
	FROM agendamentos
	WHERE MONTH(data_agendamento) = 6
	AND YEAR(data_agendamento) = 2024
);

SELECT nome
FROM medicos
WHERE ID_medico IN(
	SELECT ID_medico
	FROM agendamentos
	WHERE MONTH(data_agendamento) = 7
	AND YEAR(data_agendamento) = 2024
);

-- Selecionar os médicos que tem agendamentos marcados
SELECT nome 
FROM medicos
WHERE EXISTS(
	SELECT 1
    FROM agendamentos
    WHERE agendamentos.ID_medico = medicos.ID_medico
);

-- Inner Join = Junção de tabelas
-- Selecione o nome dos pacientes e o nome de suas respectivas cidades

SELECT p.nome, c.nome 
FROM pacientes p, cidades c
WHERE p.ID_cidade = c.ID_cidade;

SELECT p.nome, c.nome
FROM pacientes p
INNER JOIN cidades c ON(p.ID_cidade = c.ID_cidade)
WHERE Year(data_nas) < 2000
ORDER BY p.nome;
*/

/*

-- Selecione o nome dos pacientes, de suas cidades e de seus paises
SELECT p.nome as Pacientes, c.nome as Cidades, pp.nome AS Países 
FROM pacientes p 
INNER JOIN cidades c ON(p.ID_cidade = c.ID_cidade)
INNER JOIN paises pp ON (pp.ID_pais = c.ID_pais);

-- Selecione o nome dos médicos, de suas respectivas especialidades e cidades, Ordene em ordem crescente de nome do médico
SELECT m.nome, e.nome, c.nome
FROM medicos m
INNER JOIN especialidades e ON(m.ID_especialidade = e.ID_especialidade)
INNER JOIN cidades c ON(m.ID_cidade = c.ID_cidade)
ORDER BY m.nome;

-- Selecione o nome dos médicos, de suas respectivas especialidades, cidades e país. Ordene em ordem crescente de nome do médico
SELECT m.nome, e.nome, c.nome, pp.nome
FROM medicos m
INNER JOIN especialidades e ON(m.ID_especialidade = e.ID_especialidade)
INNER JOIN cidades c ON(m.ID_cidade = c.ID_cidade)
INNER JOIN paises pp ON(c.ID_pais = pp.ID_pais)
ORDER BY m.nome;

-- Selecione os nomes distintos das cidades dos pacientes, utilize inner join
SELECT DISTINCT c.nome 
FROM cidades c
INNER JOIN pacientes p ON(p.ID_cidade = c.ID_cidade);

-- Selecione o nome, data de nascimento, nome da cidade e o nome do país dos pacientes que nasceram antes de 1990 e no mês de junho(6) ou julho(7),
-- Ordene em ordem crescente de nascimento
SELECT p.nome, p.data_nas, c.nome, pp.nome
FROM pacientes p
INNER JOIN cidades c ON(p.ID_cidade = c.ID_cidade)
INNER JOIN paises pp ON(pp.ID_pais = c.ID_pais)
WHERE YEAR(data_nas) < 1990 
AND MONTH(data_nas) = 6 
OR MONTH(data_nas) = 7
ORDER BY data_nas;

-- Selecione o nome do paciente, o nome do medico e os detalhes do agendamento(data e hora) e a cidade do paciente
SELECT p.nome AS 'Paciente', m.nome AS 'Medico', a.data_agendamento AS 'Data', a.hora_agendamento 'Horario', c.nome AS 'Cidade'
FROM pacientes p
INNER JOIN cidades c ON(c.ID_cidade = p.ID_cidade)
INNER JOIN agendamentos a ON(a.ID_paciente = p.ID_paciente)
INNER JOIN medicos m ON(m.ID_medico = a.ID_medico);

-- Selecione as doenças diagnosticadas em mais de 1 paciente, utilize group by e having
SELECT d.nome AS 'Diagnostico', COUNT(ID_paciente) AS 'Quantidade de diagnosticos'
FROM doencas d
INNER JOIN pacientes_doencas pd ON(d.ID_doenca = pd.ID_doenca)
GROUP BY d.nome HAVING COUNT(d.ID_doenca) > 1;
*/

/*
-- Selecionar três enunciados resolvidos com junção de tabelas e converta para inner join
-- 1:Apresente o nome do paciente, o nome da cidade, o nome do país e o dia do ano em que cada paciente nasceu
SELECT p.nome AS 'Nome do Paciente', c.nome'Nome da cidade', pa.nome'Nome do País', DAYOFYEAR(p.data_nas) AS 'Dia do Ano'
FROM pacientes p
INNER JOIN cidades c ON(p.ID_cidade = c.ID_cidade)
INNER JOIN paises pa ON(pa.ID_pais = c.ID_pais);

-- 2:Selecionar a média de idade dos médicos por cidade
SELECT c.nome, CEIL((AVG(YEAR(CURDATE() ) - YEAR(m.data_nas) ) ) ) AS 'Idade média médicos'
FROM cidades c
INNER JOIN medicos m ON(c.ID_cidade = m.ID_cidade)
GROUP BY(c.nome);

-- 3:Selecionar a média de idade dos pacientes por cidade
SELECT c.nome, CEIL((AVG(YEAR(CURDATE() ) - YEAR(p.data_nas) ) ) ) AS 'Idade média pacientes'
FROM cidades c
INNER JOIN pacientes p ON(c.ID_cidade = p.ID_cidade)
GROUP BY(c.nome);
*/

-- Outer Join(Left Join, Right Join)
-- Obtenha uma relação de todos os países, mesmo aqueles que não tenham cidades cadastradas.
/*SELECT * FROM paises p 
LEFT JOIN cidades c 
ON (c.ID_pais = p.ID_pais);


-- Funções para manipulação de texto
-- Left- Retorna os primeiros caracteres(Representados por uma constante numérica) à esquerda de uma string.
/*
SELECT LEFT(nome, 3) FROM cidades;

-- Obter uma relação de nomes de médicos cujos nomes começam com M,N ..., Y ou Z em ordem alfabética
SELECT nome AS 'Médicos de M a Z'
FROM medicos
WHERE LEFT (nome, 1) >= 'M'
ORDER BY nome;

-- Obter uma relação dos nomes das cidades, com o nome de seus respectivos países de todas as cidades cujos nomes começam com a letra A até a letra L
-- Apresentar a saida em ordem alfabética de nome das cidades
SELECT c.nome 
FROM cidades c 
INNER JOIN paises p 
ON (c.ID_pais = p.ID_pais)
WHERE LEFT(c.nome,1) >= 'A' AND LEFT(c.nome,1) <= 'L'
ORDER BY c.nome;
*/

/*
-- Right - retorna os últimos caracteres(representados por uma constante numérica) à direita de uma string
SELECT RIGHT(nome, 5) FROM cidades;

-- Mid - É sinonimo de SUBSTRING(). Ela solicita que voce informe em que posição, no meio da string, a contagem deve começar
SELECT MID(nome, 5, 3) FROM cidades;

-- Exemplo 
SELECT LEFT(nome, 2) AS 'Primeira Parte',
MID(nome, 3, 2) AS 'Parte do Meio',
RIGHT(nome, 2) AS 'Ultima parte'
FROM cidades limit 5;
*/
/*
SELECT SUBSTRING(nome, 1, 5) FROM cidades;
SELECT LENGTH(nome) FROM medicos;

-- LOWER / LCASE - ambas transforman uma string em letra minuscula
SELECT LOWER(nome) FROM medicos;
SELECT LCASE(nome) FROM medicos;

-- UPPER / UCASE - Ambas transforman uma string em letra maiuscula
SELECT UPPER(nome) FROM medicos;
SELECT UCASE(nome) FROM medicos;

-- TRIM - Remove os espaços em branco no inicio e no fim de um texto
SELECT ('                           TECNOLOGIA                 '),
TRIM('                 TECNOLOGIA               ');

-- REPEAT - Repete N vezes um determinado caracter, ou sequencia de caracteres
-- SELECT REPEAT('*', 10);
-- SELECT REPEAT('OK',5);

-- Concat - Concatena dois textos.
SET @nome_usuario = 'Fulano de Tal';
SELECT CONCAT('Bom Dia', @nome_usuario, ',', 'como vai?');

SELECT CONCAT(nome, 'R$', salario) FROM medicos;

-- CONCAT_WS - Semelhante à CONCAT, porém, a primeira sequência de caracteres é, repetida, entre os demais strings
SELECT CONCAT_WS('/', '13', '09', '2024');
*/



