-- Criação da tabela funcionarios

CREATE TABLE IF NOT EXISTS funcionarios (
id INT PRIMARY KEY,
primeiro_nome VARCHAR(15) NOT NULL,
segundo_nome VARCHAR(15),
ultimo_nome VARCHAR(15) NOT NULL,
data_nascimento DATE NOT NULL,
CPF VARCHAR(15) NOT NULL, 
RG VARCHAR(10) NOT NULL,
endereco VARCHAR(50) NOT NULL,
CEP VARCHAR(10) NOT NULL,
cidade VARCHAR(30) NOT NULL,
fone VARCHAR(15),
codigo_departamento INT NOT NULL,
funcao VARCHAR(20) NOT NULL,
salario INT NOT NULL
);

-- Inserção de 15 registros na tabela funcionarios

INSERT INTO funcionarios (id, primeiro_nome, segundo_nome, ultimo_nome, data_nascimento, CPF, RG, endereco, CEP, cidade, fone, codigo_departamento, funcao, salario)
VALUES
(0, 'Carlos', ' ', 'Silva', '1985-02-15', '12345678901', 'MG1234567', 'Rua das Flores, 123', '30120-123', 'Belo Horizonte', '31987654321', 1, 'Analista', 3500),
(1, 'Mariana', 'Aparecida', 'Oliveira', '1990-03-22', '23456789012', 'SP2345678', 'Avenida Brasil, 456', '01000-000', 'São Paulo', '11987654321', 1, 'Desenvolvedora', 4500),
(2, 'João', 'Pedro', 'Santos', '1988-05-10', '34567890123', 'RJ3456789', 'Rua das Laranjeiras, 789', '22240-000', 'Rio de Janeiro', '21987654321', 1, 'Gerente', 6000),
(3, 'Fernanda', 'Almeida', 'Lima', '1992-07-12', '45678901234', 'RS4567890', 'Rua da Paz, 321', '90000-000', 'Porto Alegre', '51987654321', 1, 'Analista', 3500),
(4, 'Ricardo', 'Henrique', 'Costa', '1987-09-09', '56789012345', 'MG5678901', 'Rua das Palmeiras, 654', '30200-000', 'Belo Horizonte', '31987654322', 2, 'Desenvolvedor', 4500),
(5, 'Ana', 'Clara', 'Pereira', '1991-12-15', '67890123456', 'SP6789012', 'Rua das Margaridas, 987', '01300-000', 'São Paulo', '11987654323', 2, 'Gerente', 6000),
(6, 'Luiz', 'Fernando', 'Gomes', '1984-11-11', '78901234567', 'RJ7890123', 'Avenida Paulista, 1234', '01310-000', 'São Paulo', '11987654324', 2, 'Desenvolvedor', 4500),
(7, 'Patrícia', 'Fernandes', 'Moreira', '1993-08-25', '89012345678', 'PR8901234', 'Rua das Acácias, 321', '80000-000', 'Curitiba', '41987654325', 2, 'Telefonista', 3500),
(8, 'Roberto', 'Carlos', 'Mendes', '1986-04-04', '90123456789', 'RS9012345', 'Rua das Hortênsias, 654', '90400-000', 'Porto Alegre', '51987654326', 2, 'Analista', 3500),
(9, 'Juliana', ' ', 'Ribeiro', '1994-01-20', '01234567890', 'MG0123456', 'Avenida das Américas, 987', '30110-000', 'Belo Horizonte', '31987654327', 3, 'Gerente', 6000),
(10, 'Felipe', 'Andrade', 'Rodrigues', '1989-03-15', '11223344556', 'BA1122334', 'Rua das Violetas, 123', '40000-000', 'Salvador', '71987654328', 3, 'Supervisor', 5500),
(11, 'Tatiana', 'Moraes', 'Carvalho', '1985-06-20', '22334455667', 'PE2233445', 'Avenida Recife, 456', '50000-000', 'Recife', '81987654329', 3, 'Supervisor', 5500),
(12, 'Gabriel', ' ', 'Silva', '1992-02-25', '33445566778', 'MG3344556', 'Rua do Porto, 789', '30130-000', 'Belo Horizonte', '31987654330', 3, 'Técnico', 3200),
(13, 'Carla', 'Regina', 'Costa', '1990-10-05', '44556677889', 'SP4455667', 'Avenida Central, 321', '01100-000', 'Ituiutaba', '11987654331', 3, 'Telefonista', 3200),
(14, 'Vitor', 'Augusto', 'Ferreira', '1987-12-30', '55667788990', 'RJ5566778', 'Rua do Sol, 654', '22000-000', 'Ituiutaba', '21987654332', 3, 'Telefonista', 3200);

--Comando 1

SELECT primeiro_nome, segundo_nome, ultimo_nome FROM funcionarios ORDER BY ultimo_nome;

--Comando 2

SELECT * FROM funcionarios 
ORDER BY cidade;

--Comando 3

SELECT * FROM funcionarios 
WHERE salario > 1000 
ORDER BY primeiro_nome, segundo_nome, ultimo_nome;

--Comando 4

SELECT primeiro_nome, data_nascimento 
FROM funcionarios
ORDER BY data_nascimento DESC; 

--Comando 5

SELECT primeiro_nome, segundo_nome, ultimo_nome, fone, endereco, cidade 
FROM funcionarios;

--Comando 6

SELECT primeiro_nome, ultimo_nome
FROM funcionarios
WHERE segundo_nome = '';

--Comando 7 

SELECT primeiro_nome, segundo_nome, ultimo_nome 
FROM funcionarios
WHERE cidade = 'Ituiutaba' AND funcao = 'Telefonista'

--Comando 8 

SELECT * FROM funcionarios 
WHERE codigo_departamento = 2;

--Comando 9

SELECT primeiro_nome, segundo_nome, ultimo_nome, codigo_departamento
FROM funcionarios
WHERE salario > 2000;