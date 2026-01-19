-- ============================================
-- PROJETO SQL: Sistema de Livraria/Editora
-- Versão Refatorada para Entrevistas
-- ============================================

-- 1. CRIAÇÃO DE TABELAS COM ESTRUTURA NORMALIZADA

-- Tabela de Autores
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    biografia TEXT,
    nacionalidade VARCHAR(50),
    data_nascimento DATE,
    INDEX idx_nome (nome_autor)
);

-- Tabela de Editoras (normalizada)
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(60) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela de Livros (com FKs)
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

-- Tabela de relacionamento Livro-Autor (N:N)
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

-- Tabela de Funcionários (com FK para departamento)
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

-- Tabela de Vendas (cabeçalho)
CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento ENUM('PIX', 'Cartão de crédito', 'Cartão de débito', 'Dinheiro'),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabela de Itens da Venda (normalizada)
CREATE TABLE item_venda (
    id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_livro INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

-- Tabela de Pedidos Online (cabeçalho)
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

-- Tabela de Itens do Pedido (normalizada)
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
-- 2. INSERÇÃO DE DADOS
-- ============================================

-- Inserir Editoras
INSERT INTO editora (nome_editora) VALUES
    ('Mil Folhas'),
    ('Vaga-lume'),
    ('SBD'),
    ('Nova Leitura');

-- Inserir Autores
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
    ('Franz Kafka', 'Tcheco', '1883-07-03');

-- Inserir Departamentos
INSERT INTO departamento (nome_departamento, localizacao_setor) VALUES
    ('RH', 'Segundo andar, Sala 201'),
    ('Vendas', 'Térreo, Loja'),
    ('Tradução', 'Terceiro andar, Sala 305'),
    ('Finanças', 'Segundo andar, Sala 210'),
    ('Tecnologia da Informação', 'Terceiro andar, Sala 301'),
    ('Marketing', 'Segundo andar, Sala 205'),
    ('Editorial', 'Terceiro andar, Sala 310'),
    ('Produção', 'Primeiro andar, Galpão');

-- Inserir Livros
INSERT INTO livro (isbn, titulo, id_editora, data_publicacao, genero, num_paginas) VALUES
    ('9780451524935', '1984', 1, '1949-06-08', 'Distopia', 326),
    ('9788535911664', 'Memórias Póstumas de Brás Cubas', 1, '1880-03-15', 'Romance', 320),
    ('9780547928227', 'O Hobbit', 2, '1937-09-21', 'Fantasia', 310),
    ('9780439708180', 'Harry Potter e a Pedra Filosofal', 1, '1997-07-22', 'Fantasia', 223),
    ('9780385121675', 'O Iluminado', 3, '1977-01-28', 'Terror', 497);

-- Relacionar Livros com Autores
INSERT INTO livro_autor (id_livro, id_autor) VALUES
    (1, 8),  -- 1984 - George Orwell
    (2, 1),  -- Memórias - Machado
    (3, 5),  -- Hobbit - Tolkien
    (4, 9),  -- Harry Potter - JK Rowling
    (5, 4);  -- Iluminado - Stephen King

-- ============================================
-- 3. CONSULTAS DEMONSTRANDO COMPETÊNCIA
-- ============================================

-- Consulta com JOIN simples
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

-- Consulta com agregação e GROUP BY
SELECT 
    d.nome_departamento,
    COUNT(*) as total_funcionarios
FROM funcionario f
INNER JOIN departamento d ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento
ORDER BY total_funcionarios DESC;

-- Consulta com subconsulta
SELECT titulo, isbn
FROM livro
WHERE id_livro IN (
    SELECT id_livro 
    FROM exemplar 
    WHERE estado = 'Disponível'
);

-- Consulta complexa com múltiplos JOINs
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

-- ============================================
-- 4. VIEWS ÚTEIS
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

-- ============================================
-- 5. PROCEDURES (demonstra conhecimento avançado)
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
    
    -- Inserir cabeçalho da venda
    INSERT INTO venda (id_cliente, forma_pagamento, valor_total)
    VALUES (p_id_cliente, p_forma_pagamento, p_quantidade * p_preco_unitario);
    
    SET v_id_venda = LAST_INSERT_ID();
    
    -- Inserir item da venda
    INSERT INTO item_venda (id_venda, id_livro, quantidade, preco_unitario)
    VALUES (v_id_venda, p_id_livro, p_quantidade, p_preco_unitario);
    
    SELECT v_id_venda as id_venda_criada;
END //

DELIMITER ;

-- ============================================
-- 6. ÍNDICES PARA PERFORMANCE
-- ============================================

CREATE INDEX idx_venda_data ON venda(data_venda);
CREATE INDEX idx_pedido_status ON pedido(status);
CREATE INDEX idx_exemplar_livro ON exemplar(id_livro, estado);