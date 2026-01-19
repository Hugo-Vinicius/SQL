-- ============================================
-- PROJETO SQL: Sistema de Livraria/Editora
-- ============================================

-- CRIAÇÃO DE TABELAS

-- Tabela de Autores
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    biografia TEXT,
    nacionalidade VARCHAR(50),
    data_nascimento DATE,
    INDEX idx_nome (nome_autor)
);

-- Tabela de Editoras
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(60) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela de Livros
CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    id_editora INT,
    data_publicacao DATE,
    genero VARCHAR(50),
    num_paginas INT,
    descricao TEXT,
    FOREIGN KEY (id_editora) REFERENCES editora(id_editora),
    INDEX idx_titulo (titulo),
    INDEX idx_isbn (isbn)
);

-- Tabela de relacionamento Livro-Autor
CREATE TABLE livro_autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON DELETE CASCADE
);

-- Tabela de Departamentos
CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_departamento VARCHAR(50) NOT NULL UNIQUE,
    localizacao_setor VARCHAR(100)
);

-- Tabela de Funcionários
CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(100) NOT NULL,
    cargo VARCHAR(60) NOT NULL,
    id_departamento INT NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(150),
    cpf VARCHAR(11) UNIQUE,
    salario DECIMAL(10,2),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
    INDEX idx_departamento (id_departamento)
);

-- Tabela de Exemplares
CREATE TABLE exemplar (
    id_exemplar INT PRIMARY KEY AUTO_INCREMENT,
    numero_serie VARCHAR(20) UNIQUE NOT NULL,
    id_livro INT NOT NULL,
    estado ENUM('Disponível', 'Reservado', 'Indisponível', 'Danificado') DEFAULT 'Disponível',
    localizacao_editora VARCHAR(100),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    INDEX idx_estado (estado)
);

-- Tabela de Clientes
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15),
    endereco VARCHAR(150)
);

-- Tabela de Vendas
CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento ENUM('PIX', 'Cartão de crédito', 'Cartão de débito', 'Dinheiro'),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabela de Itens da Venda
CREATE TABLE item_venda (
    id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_livro INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

-- Tabela de Pedidos Online
CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_entrega DATE,
    status ENUM('Pendente', 'Em processamento', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Pendente',
    endereco_entrega VARCHAR(150),
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabela de Itens do Pedido
CREATE TABLE item_pedido (
    id_item_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_livro INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

-- ============================================
-- INSERÇÃO DE DADOS
-- ============================================

INSERT INTO editora (nome_editora) VALUES
    ('Mil Folhas'),
    ('Vaga-lume'),
    ('SBD'),
    ('Nova Leitura');

INSERT INTO autor (nome_autor, nacionalidade, data_nascimento) VALUES
    ('Machado de Assis', 'Brasileiro', '1839-06-21'),
    ('José de Alencar', 'Brasileiro', '1829-05-01'),
    ('Clarice Lispector', 'Ucraniana-Brasileira', '1920-10-12'),
    ('Stephen King', 'Estadunidense', '1947-09-21'),
    ('J.R.R. Tolkien', 'Sul-Africano', '1892-01-03'),
    ('Júlio Verne', 'Francês', '1828-02-08'),
    ('Dante Alighieri', 'Italiano', '1265-05-22'),
    ('George Orwell', 'Britânico', '1903-06-25'),
    ('J.K. Rowling', 'Britânica', '1965-07-31'),
    ('Franz Kafka', 'Tcheco', '1883-07-03'),
    ('Agatha Christie', 'Britânica', '1890-09-15'),
    ('Cecília Meireles', 'Brasileira', '1901-11-07');

INSERT INTO departamento (nome_departamento, localizacao_setor) VALUES
    ('RH', 'Segundo andar, Sala 201'),
    ('Vendas', 'Térreo, Loja'),
    ('Tradução', 'Terceiro andar, Sala 305'),
    ('Finanças', 'Segundo andar, Sala 210'),
    ('Tecnologia da Informação', 'Terceiro andar, Sala 301'),
    ('Marketing', 'Segundo andar, Sala 205'),
    ('Relações Públicas', 'Segundo andar, Sala 208'),
    ('Editorial', 'Terceiro andar, Sala 310'),
    ('Jurídico', 'Segundo andar, Sala 215'),
    ('Produção', 'Primeiro andar, Galpão'),
    ('Direção', 'Terceiro andar, Sala 350');

INSERT INTO funcionario (nome_funcionario, cargo, id_departamento, telefone, email, endereco, cpf, salario) VALUES
    ('Júlia Ferreira', 'Gerente Executiva', 11, '81945672341', 'isaferr@gmail.com', 'Rua Bela Vista 56 Apt. 407, Recife', '12345678901', 15000.00),
    ('Igor Jatobá', 'Vice-diretor', 11, '81936206737', 'igjato@hotmail.com', 'Avenida Beira-Mar 204, Recife', '23456789012', 12000.00),
    ('Gustavo Andrade', 'Suporte de TI', 5, '81976589034', 'gustandr@gmail.com', 'Rua da Silveira 967, Olinda', '34567890123', 4500.00),
    ('Thiago Oliveira', 'Analista de Cybersegurança', 5, '81906564921', 'thioli@hotmail.com', 'Rua 1 de Maio 90 Apt. 12, Recife', '45678901234', 6000.00),
    ('Karla Pires', 'Programadora Front-end', 5, '81982189409', 'kapires@gmail.com', 'Rua Jasmim 11 Apt. 29, Recife', '56789012345', 5500.00),
    ('Gabriel Medeiros', 'Programador Back-end', 5, '81949214992', 'gabsmed@gmail.com', 'Rua das Laranjeiras 59, Olinda', '67890123456', 5500.00),
    ('Jorge da Silva', 'Analista Financeiro', 4, '81978905687', 'jgsil@gmail.com', 'Avenida 31 de Maio 43, Recife', '78901234567', 5000.00),
    ('Jean Balboa', 'Contador', 4, '81937499091', 'jeanbalbs@hotmail.com', 'Rua dos Fortes 901, Abreu e Lima', '89012345678', 4800.00),
    ('Luanna Müller', 'Analista de Negócios', 4, '81967921474', 'lulumuller@hotmail.com', 'Rua Verde 31, Olinda', '90123456789', 5200.00),
    ('Camille Ferraz', 'Publicitária', 6, '81932165432', 'milleferr@gmail.com', 'Rua Bela 834 Apt. 302, Recife', '01234567890', 4200.00),
    ('Carlos Valência', 'Publicitário', 6, '81947593456', 'cvalencia@hotmail.com', 'Rua Diadema 67, Olinda', '11234567890', 4200.00),
    ('Júlio Lima', 'Estagiário', 6, '81947249552', 'julima@gmail.com', 'Avenida General Dutra 55, Abreu e Lima', '22345678901', 1500.00),
    ('Antônio Villar', 'Gerente de Mídias Sociais', 7, '81999674173', 'antonvilla@gmail.com', 'Rua Orquídea 78, Abreu e Lima', '33456789012', 4800.00),
    ('Alan Trindade', 'Tradutor', 3, '81983254629', 'alantdd@hotmail.com', 'Avenida do Governador 503 Apt. 800, Recife', '44567890123', 4000.00),
    ('Giovanna Martinelli', 'Tradutora', 3, '81957823612', 'giomarti@gmail.com', 'Rua da Hora, 12, Recife', '55678901234', 4000.00);

INSERT INTO livro (isbn, titulo, id_editora, data_publicacao, genero, num_paginas, descricao) VALUES
    ('9780451524935', '1984', 1, '1949-06-08', 'Distopia', 326, 'Um romance distópico que retrata um futuro totalitário'),
    ('9788535911664', 'Memórias Póstumas de Brás Cubas', 1, '1880-03-15', 'Romance', 320, 'Obra-prima da literatura brasileira escrita por um defunto autor'),
    ('9780547928227', 'O Hobbit', 2, '1937-09-21', 'Fantasia', 310, 'A jornada de Bilbo Bolseiro pela Terra Média'),
    ('9780439708180', 'Harry Potter e a Pedra Filosofal', 1, '1997-07-22', 'Fantasia', 223, 'O início da saga do bruxo mais famoso do mundo'),
    ('9780385121675', 'O Iluminado', 3, '1977-01-28', 'Terror', 497, 'História aterrorizante no Hotel Overlook'),
    ('9780140817744', 'A Revolução dos Bichos', 2, '1945-08-17', 'Fábula Política', 113, 'Fábula sobre poder e corrupção'),
    ('9788535908770', 'O Guarani', 3, '1857-01-01', 'Romance', 130, 'Romance indianista brasileiro'),
    ('9780143105954', 'Metamorfose', 2, '1915-04-21', 'Contos', 96, 'A transformação de Gregor Samsa'),
    ('9780679732266', 'Divina Comédia', 2, '1321-01-01', 'Épico', 697, 'Viagem pelos círculos do inferno, purgatório e paraíso'),
    ('9788520925485', 'Espectros', 3, '1919-02-20', 'Poesia', 250, 'Coletânea de sonetos de influência simbolista');

INSERT INTO livro_autor (id_livro, id_autor) VALUES
    (1, 8),
    (2, 1),
    (3, 5),
    (4, 9),
    (5, 4),
    (6, 8),
    (7, 2),
    (8, 10),
    (9, 7),
    (10, 12);

INSERT INTO exemplar (numero_serie, id_livro, estado, localizacao_editora) VALUES
    ('EX001984BR2023', 1, 'Disponível', 'Segundo andar, Setor A'),
    ('EX00MEM1880BR', 2, 'Disponível', 'Primeiro andar, Setor E'),
    ('EX00HOB1937UK', 3, 'Reservado', 'Primeiro andar, Setor C'),
    ('EX00HAR1997UK', 4, 'Disponível', 'Segundo andar, Setor B'),
    ('EX00ILU1977US', 5, 'Disponível', 'Primeiro andar, Setor A'),
    ('EX00REV1945BR', 6, 'Disponível', 'Primeiro andar, Setor C'),
    ('EX00GUA1857BR', 7, 'Indisponível', 'Segundo andar, Setor B'),
    ('EX00MET1915CZ', 8, 'Disponível', 'Primeiro andar, Setor D'),
    ('EX00DIV1321IT', 9, 'Disponível', 'Segundo andar, Setor A'),
    ('EX00ESP1919BR', 10, 'Danificado', 'Segundo andar, Setor C');

INSERT INTO cliente (nome_cliente, email, telefone, endereco) VALUES
    ('Maria Santos', 'maria.santos@email.com', '81987654321', 'Rua das Flores 123, Recife'),
    ('João Silva', 'joao.silva@email.com', '81976543210', 'Avenida Central 456, Olinda'),
    ('Ana Oliveira', 'ana.oliveira@email.com', '81965432109', 'Rua do Comércio 789, Recife'),
    ('Pedro Costa', 'pedro.costa@email.com', '81954321098', 'Alameda dos Anjos 321, Paulista'),
    ('Carla Souza', 'carla.souza@email.com', '81943210987', 'Rua Principal 654, Recife');

INSERT INTO venda (id_cliente, data_venda, forma_pagamento, valor_total) VALUES
    (1, '2023-10-12 09:39:12', 'PIX', 89.90),
    (2, '2023-10-12 10:47:23', 'Cartão de crédito', 179.60),
    (3, '2023-10-13 14:25:40', 'PIX', 54.90),
    (4, '2023-10-14 13:01:13', 'Cartão de débito', 134.70),
    (5, '2023-10-15 13:27:37', 'PIX', 99.80);

INSERT INTO item_venda (id_venda, id_livro, quantidade, preco_unitario) VALUES
    (1, 1, 1, 44.90),
    (1, 4, 1, 45.00),
    (2, 3, 1, 49.90),
    (2, 5, 1, 59.90),
    (2, 7, 2, 34.90),
    (3, 2, 1, 54.90),
    (4, 8, 1, 39.90),
    (4, 9, 1, 94.80),
    (5, 2, 1, 54.90),
    (5, 10, 1, 44.90);

INSERT INTO pedido (id_cliente, data_pedido, data_entrega, status, endereco_entrega, forma_pagamento) VALUES
    (1, '2023-10-01 21:24:49', '2023-10-06', 'Entregue', 'Rua Grande 82, Recife', 'PIX'),
    (2, '2023-10-01 22:30:41', '2023-10-06', 'Entregue', 'Rua do Carvalho 921 Apt. 05, Paulista', 'Cartão de crédito'),
    (3, '2023-10-05 01:19:06', '2023-10-12', 'Entregue', 'Rua das Mariposas 849, Recife', 'PIX'),
    (4, '2023-10-12 23:21:02', '2023-10-16', 'Enviado', 'Rua Gonçalves Dias 294, Abreu e Lima', 'Cartão de débito'),
    (5, '2023-10-13 15:09:36', '2023-10-19', 'Em processamento', 'Rua dos Fortes 907, Abreu e Lima', 'PIX');

INSERT INTO item_pedido (id_pedido, id_livro, quantidade, preco_unitario) VALUES
    (1, 5, 1, 59.90),
    (2, 1, 1, 44.90),
    (2, 6, 1, 39.90),
    (3, 9, 1, 94.80),
    (3, 3, 1, 49.90),
    (4, 2, 1, 54.90),
    (5, 1, 1, 44.90);

-- ============================================
-- CONSULTAS
-- ============================================

SELECT 
    l.titulo,
    a.nome_autor,
    e.nome_editora,
    l.data_publicacao
FROM livro l
INNER JOIN livro_autor la ON l.id_livro = la.id_livro
INNER JOIN autor a ON la.id_autor = a.id_autor
INNER JOIN editora e ON l.id_editora = e.id_editora
ORDER BY l.data_publicacao;

SELECT 
    d.nome_departamento,
    COUNT(*) as total_funcionarios,
    AVG(f.salario) as salario_medio
FROM funcionario f
INNER JOIN departamento d ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento
ORDER BY total_funcionarios DESC;

SELECT titulo, isbn
FROM livro
WHERE id_livro IN (
    SELECT id_livro 
    FROM exemplar 
    WHERE estado = 'Disponível'
);

SELECT 
    v.id_venda,
    c.nome_cliente,
    l.titulo,
    iv.quantidade,
    iv.preco_unitario,
    (iv.quantidade * iv.preco_unitario) as subtotal
FROM venda v
INNER JOIN cliente c ON v.id_cliente = c.id_cliente
INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
INNER JOIN livro l ON iv.id_livro = l.id_livro
WHERE v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT 
    a.nome_autor,
    COUNT(DISTINCT l.id_livro) as total_livros,
    COUNT(DISTINCT ex.id_exemplar) as total_exemplares
FROM autor a
LEFT JOIN livro_autor la ON a.id_autor = la.id_autor
LEFT JOIN livro l ON la.id_livro = l.id_livro
LEFT JOIN exemplar ex ON l.id_livro = ex.id_livro
GROUP BY a.id_autor, a.nome_autor
HAVING total_livros > 0
ORDER BY total_livros DESC;

SELECT 
    p.id_pedido,
    c.nome_cliente,
    p.status,
    COUNT(ip.id_item_pedido) as total_itens,
    SUM(ip.quantidade * ip.preco_unitario) as valor_total
FROM pedido p
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
INNER JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido, c.nome_cliente, p.status;

-- ============================================
-- VIEWS
-- ============================================

CREATE VIEW vw_livros_disponiveis AS
SELECT 
    l.titulo,
    a.nome_autor,
    e.nome_editora,
    COUNT(ex.id_exemplar) as exemplares_disponiveis
FROM livro l
LEFT JOIN livro_autor la ON l.id_livro = la.id_livro
LEFT JOIN autor a ON la.id_autor = a.id_autor
LEFT JOIN editora e ON l.id_editora = e.id_editora
LEFT JOIN exemplar ex ON l.id_livro = ex.id_livro AND ex.estado = 'Disponível'
GROUP BY l.id_livro, l.titulo, a.nome_autor, e.nome_editora;

CREATE VIEW vw_vendas_mes_atual AS
SELECT 
    DATE(v.data_venda) as data,
    COUNT(DISTINCT v.id_venda) as total_vendas,
    SUM(v.valor_total) as faturamento
FROM venda v
WHERE MONTH(v.data_venda) = MONTH(CURDATE())
  AND YEAR(v.data_venda) = YEAR(CURDATE())
GROUP BY DATE(v.data_venda);

CREATE VIEW vw_funcionarios_por_departamento AS
SELECT 
    d.nome_departamento,
    f.nome_funcionario,
    f.cargo,
    f.salario
FROM funcionario f
INNER JOIN departamento d ON f.id_departamento = d.id_departamento
ORDER BY d.nome_departamento, f.nome_funcionario;

CREATE VIEW vw_top_clientes AS
SELECT 
    c.nome_cliente,
    c.email,
    COUNT(DISTINCT v.id_venda) as total_compras,
    SUM(v.valor_total) as valor_total_gasto
FROM cliente c
INNER JOIN venda v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nome_cliente, c.email
ORDER BY valor_total_gasto DESC;

-- ============================================
-- STORED PROCEDURES
-- ============================================

DELIMITER //

CREATE PROCEDURE sp_registrar_venda(
    IN p_id_cliente INT,
    IN p_id_livro INT,
    IN p_quantidade INT,
    IN p_preco_unitario DECIMAL(10,2),
    IN p_forma_pagamento VARCHAR(50)
)
BEGIN
    DECLARE v_id_venda INT;
    DECLARE v_valor_total DECIMAL(10,2);
    
    SET v_valor_total = p_quantidade * p_preco_unitario;
    
    INSERT INTO venda (id_cliente, forma_pagamento, valor_total)
    VALUES (p_id_cliente, p_forma_pagamento, v_valor_total);
    
    SET v_id_venda = LAST_INSERT_ID();
    
    INSERT INTO item_venda (id_venda, id_livro, quantidade, preco_unitario)
    VALUES (v_id_venda, p_id_livro, p_quantidade, p_preco_unitario);
    
    SELECT v_id_venda as id_venda_criada, v_valor_total as valor_total;
END //

CREATE PROCEDURE sp_atualizar_status_pedido(
    IN p_id_pedido INT,
    IN p_novo_status VARCHAR(50)
)
BEGIN
    UPDATE pedido 
    SET status = p_novo_status
    WHERE id_pedido = p_id_pedido;
    
    SELECT id_pedido, status, data_pedido
    FROM pedido
    WHERE id_pedido = p_id_pedido;
END //

DELIMITER ;

-- ============================================
-- ÍNDICES ADICIONAIS PARA PERFORMANCE
-- ============================================

CREATE INDEX idx_venda_data ON venda(data_venda);
CREATE INDEX idx_pedido_status ON pedido(status);
CREATE INDEX idx_exemplar_livro ON exemplar(id_livro, estado);
CREATE INDEX idx_funcionario_nome ON funcionario(nome_funcionario);