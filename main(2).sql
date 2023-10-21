-- Criação de tabelas

-- Tabela departamento

CREATE TABLE departamento (
id_departamento INT PRIMARY KEY AUTO_INCREMENT,
  nome_departamento VARCHAR(30),
  responsavel VARCHAR(45) NOT NULL,
  atividades VARCHAR(90)
);

-- Tabela autor

CREATE TABLE autor (
    id_autor INT PRIMARY KEY,
    nome_autor VARCHAR(60)NOT NULL,
    biografia VARCHAR(200),
    nacionalidade VARCHAR(20),
    data_nascimento DATE,
    obras_escritas VARCHAR(200)
);

-- Tabela funcionário

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(60) NOT NULL,
    cargo VARCHAR(45) NOT NULL,
    departamento VARCHAR(45) NOT NULL,
    telefone_celular DOUBLE,
    email VARCHAR(40),
    endereco VARCHAR(45)
    );

-- Tabela area_conhecimento

CREATE TABLE area_conhecimento (
    id_area INT PRIMARY KEY,
    descricao_area VARCHAR(45)
);

-- Tabela palavras-chave

CREATE TABLE palavras_chave (
    id_palavra INT PRIMARY KEY,
    descricao_palavra VARCHAR(45)
);

-- Tabela de vendas físicas

CREATE TABLE vendas_fisicas (
    id_vendas INT PRIMARY KEY,
    data_compra DATETIME,
    itens_compra VARCHAR(100),
    forma_pagamento VARCHAR(45)
);

-- Tabela de pedidos

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    data_pedido DATETIME,
    data_entrega DATE,
    status VARCHAR(45),
    itens_pedido VARCHAR(100),
    endereco_entrega VARCHAR(45)
);

-- Tabela de exemplares

CREATE TABLE exemplar (
    numero_serie DOUBLE PRIMARY KEY,
    estado VARCHAR(45),
    localizacao_editora VARCHAR(45)
);

-- Tabela de livros

CREATE TABLE livro (
    isbn DOUBLE PRIMARY KEY,
    titulo_livro VARCHAR(60),
    autor VARCHAR(45),
    editora VARCHAR(45),
    data_publicacao DATE,
    genero VARCHAR(45),
    paginas INT,
    descricao_livro VARCHAR(200)
);

-- Inserção de valores

-- Valores de autor

INSERT INTO autor (id_autor, nome_autor, biografia, nacionalidade, data_nascimento, obras_escritas)
    
    VALUES
    
    (100,'Machado de Assis','Conhecido como o maior nome da literatura brasileira, foi romancista, cronista, dramaturgo e poeta',
    'Brasileiro','1839-06-21','"Memórias póstumas de Brás Cubas", "Quincas Borba", "Dom Casmurro" e "A Cartomante"'),
    (101,'José de Alencar','Pioneiro no romance nacional, formado em direito, dramaturgo, político, advogado e jornalista','Brasileiro',
    '1829-05-01','"O Guarani","Iracema","Ubirajara" e "O Sertanejo"'),
    (102,'Clarice Lispector','Um dos maiores nomes da literatura nacional do século XX, poetisa e romancista','Ucraniana-Brasileira',
    '1920-10-12','"Perto do Coração Selvagem","Hora da Estrela","O Lustre","Laços de Família"'),
    (200,'Stephen King','Escritor de terror, ficção sobrenatural, suspense. Muitas de suas obras 
    foram adaptadas em filmes e séries de televisão.','Estadunidense','1947-09-21','"Carrie, a Estranha","O Iluminado","It: a Coisa"'),
    (201,'J.R.R. Tolkien','Conhecido como o pai da literatura fantástica é considerado um dos mais bem sucedidos autores da literatura',
    'Sul-Africano','1892-01-03','"O Hobbit","A Sociedade do Anel","O Retorno do Rei"'),
    (300,'Júlio Verne','Considerado o inventor do gênero de ficção científica, prevendo em seus livros avanços científicos',
    'Francês','1828-02-08','"Vinte mil Léguas Submarinas","Volta ao Mundo em 80 dias","Viagem ao Centro da Terra"'),
    (301,'Dante Alighieri',' escritor, poeta e político. É considerado o maior poeta da língua italiana','Florentino','1265-05-22',
    '"Divina Comédia","O Inferno de Dante","Paraíso"'),
    (202,'George Orwell','Escritor e jornalista. Sua obra é marcada por uma das injustiças sociais e uma intensa ao totalitarismo',
    'Britânico','1903-06-25','"1984","A Revolução dos Bichos","Dias na Birmânia"'),
    (203,'J.K.Rowling','Escritora e roteirista famosa por escrever a série de livros mais vendida da história','Britânica','1965-07-31',
    '"Harry Potter e a Pedra Filosofal","Harry Potter e o Prisioneiro de Azkaban","Animais Fantásticos e Onde Habitam"'),
    (302,'Franz Kafka','Escritor de romances e contos, considerado um dos mais famosos do século XX','Tcheco','1883-07-03',
    '"O Castelo","Metamorfose","O Desaparecido"'),
    (204,'Agatha Christie','Escritora, poetisa e dramaturga famosa pelos seus contos policiais, o que lhe deu o apelido de "Queen of Crime"',
    'Britânica','1890-09-15','"O Misterioso Caso de Styles","Assassinato no Campo de Golfe","O Homem no Terno Marrom"'),
    (103,'Cecília Meireles','Jornalista, pintora, poeta, escritora e professora.É considerada a melhor poeta do Brasil e um 
    dos grandes nomes do modernismo','Brasileira','1901-11-07','"Espectros","Nunca Mais","A Viagem"');

 
-- Valores de departamento

INSERT INTO departamento (nome_departamento, responsavel, atividades) VALUES
    
    ('RH', 'Anna Francisca', 'Gerenciamento de pessoal e Recrutamento'),
    ('Vendas', 'Carlos Silva', 'Gerenciamento de Vendas'),
    ('Tradução', 'Marcos Castro', 'Tradução localizada de livros estrangeiros'),
    ('Finanças', 'Juliana Tenório', 'Contabilidade e Orçamentos'),
    ('Tecnologia_Informação','André Schumacher', 'Segurança de dados e gerenciamento de sistemas'),
    ('Relações Públicas','Marta Ximenes','Gerenciamento de Mídias Sociais e Eventos'),
    ('Editorial','Maria de Braga','Adquire, revisa e edita textos'),
    ('Jurídico','Matheus Paiva','Gerencia questões legais e contratos de direitos autorais'),
    ('Produção','Roberto Santana','Lida com a produção física dos livros, design, impressão e encadernação'),
    ('Marketing','Laura Andrade','Responsável pelas campanhas de marketing e publicidade na Internet'),
    ('Direção','Isabella Ferreira','Administração geral da editora');

-- Valores de funcionario

INSERT INTO funcionario(id_funcionario, nome_funcionario, cargo, departamento, telefone_celular, email, endereco) VALUES

    (001,'Júlia Ferreira','Gerente Executiva','Direção','81945672341','isaferr@gmail.com','Rua Bela Vista 56 Apt. 407, Recife'),
    (002,'Igor Jatobá','Vice-diretor','Direção','81936206737','igjato@hotmail.com','Avenida Beira-Mar 204, Recife'),
    (010,'Gustavo Andrade','Suporte de TI','Tecnologia_Informação','81976589034','gustandr@gmail.com','Rua da Silveira 967, Olinda'),
    (011,'Thiago Oliveira','Analista de Cybersegurança','Tecnologia_Informação','81906564921','thioli@hotmail.com','Rua 1 de Maio 90 Apt. 12, Recife'),
    (012,'Karla Pires','Programadora Front-end','Tecnologia_Informação','81982189409','kapires@gmail.com','Rua Jasmim 11 Apt. 29, Recife'),
    (013,'Gabriel Medeiros','Programador Back-end','Tecnologia_Informação','81949214992','gabsmed@gmail.com','Rua das Laranjeiras 59, Olinda'),
    (020,'Jorge da Silva','Analista Financeiro','Finanças','81978905687','jgsil@gmail.com','Avenida 31 de Maio 43, Recife'),
    (021,'Jean Balboa','Contador','Finanças','81937499091','jeanbalbs@hotmail.com','Rua dos Fortes 901, Abreu e Lima'),
    (022,'Luanna Müller','Analista de Negócios','Finanças','81967921474','lulumuller@hotmail.com','Rua Verde 31, Olinda'),
    (030,'Camille Ferraz','Publicitária','Marketing','81932165432','milleferr@gmail.com','Rua Bela 834 Apt. 302, Recife'),
    (031,'Carlos Valência','Publicitário','Marketing','81947593456','cvalencia@hotmail.com','Rua Diadema 67, Olinda'),
    (032,'Júlio Lima','Estagiário','Marketing','81947249552','julima@gmail.com','Avenida General Dutra 55, Abreu e Lima'),
    (040,'Antônio Villar','Gerente de Mídias Sociais','Relações Públicas','81999674173','antonvilla@gmail.com','Rua Orquídea 78, Abreu e Lima'),
    (050,'Alan Trindade','Tradutor','Tradução','81983254629','alantdd@hotmail.com','Avenida do Governador 503 Apt. 800, Recife'),
    (051,'Giovanna Martinelli','Tradutora','Tradução','81957823612','giomarti@gmail.com','Rua da Hora, 12, Recife'),
    (052,'Mirella Batista','Tradutora','Tradução','81983760139','mibatista@hotmail.com','Rua 21 de Abril 34 Apt. 505, Abreu e Lima'),
    (060,'Henrique da Costa','Advogado','Jurídico','81978945646','henricos@gmail.com','Rua do Flamingo 356 Apt. 12, Olinda'),
    (061,'Márcia Pinheiros','Estagiária','Jurídico','81931290903','marpin@gmail.com','Avenida Principal 69 Recife'),
    (070,'Joanna Magalhães','Analista de RH','RH','81964490194','jojomag@hotmail.com','Rua Vagalume 902 Paulista'),
    (071,'Júnior Neto','Auxiliar de RH','RH','81996579193','junineto@gmail.com','Alameda Florida 83 Apt. 01, Recife'),
    (072,'Teresa Caldas','Recrutadora','RH','81988329936','tecaldas@gmail.com','Rua Pinheiros 53, Recife'),
    (080,'Francisco Ramalho','Editor de Cópias','Editorial','8156389947','franramal@hotmail.com','Avenida dos Bons 77 Apt. 88, Olinda'),
    (081,'Maria Teixeira','Editora de Textos','Editorial','81946758865','mariteix@gmail.com','Rua das Palmeiras 220, Paulista'),
    (082,'Darlan Xavier','Revisor','Editorial','81988445634','danxavier@gmail.com','Rua 1 440, Recife'),
    (090,'Helena Paiva','Vendedora','Vendas','81966738852','helenpai@hotmail.com','Rua Coronel Martins 54, Olinda'),
    (091,'Roberto Machado','Vendedor','Vendas','81935447686','robertmach@gmail.com','Avenida dos Reis 21, Apt. 05, Recife'),
    (092,'Fábio Moura','Jovem Aprendiz','Vendas','81948294228','fabimou@hotmail.com','Rua dos Heróis 465, Recife'),
    (100,'Victor Vasconcelos','Designer Gráfico','Produção','81968624672','victorvasc@hotmail.com','Avenida Maurício de Nassau 70, Abreu e Lima'),
    (101,'Daniel Silva','Assistente de Produção','Produção','81978256264','dansilva@gmail.com','Rua 1 de Abril 653, Recife'),
    (102,'Fabiana Martins','Operadora de Máquinas de Impressão','Produção','81948682248','fabimartins@gmail.com','Rua dos Anjos 714 Apt. 17, Paulista'),
    (103,'Gustavo Bonifácio','Jovem Aprendiz','Produção','81921237746','gustaboni@hotmail.com','Rua Jardins 329, Recife');

-- Valores de Área de conhecimento

INSERT INTO area_conhecimento( id_area ,descricao_area) VALUES

    (01, 'Literatura Clássica'),
    (02, 'História Antiga'),
    (03, 'Filosofia Política'),
    (04, 'Literatura Contemporânea'),
    (05, 'Arte Moderna'),
    (06, 'Ciências Sociais'),
    (07, 'Poesia Nacional'),
    (08, 'Economia'),
    (09, 'Ciência Política'),
    (10, 'Tecnologia da Informação'),
    (11, 'Ecologia'),
    (12, 'Química'),
    (13, 'Astronomia');

-- Valores de palavras-chave

INSERT INTO palavras_chave( id_palavra, descricao_palavra) VALUES

    (01, 'Ciência'),
    (02, 'História'),
    (03, 'Fantasia'),
    (04, 'Política'),
    (05, 'Arte'),
    (06, 'Poesia'),
    (07, 'Nacional'),
    (08, 'Estrangeiro'),
    (09, 'Drama'),
    (10, 'Terror'),
    (11, 'Suspense'),
    (12, 'Policial'),
    (13, 'Conto'),
    (14, 'Crônica'),
    (15, 'Astros');

-- Valores de vendas físicas

INSERT INTO vendas_fisicas(id_vendas, data_compra, itens_compra, forma_pagamento) VALUES

    (3500,'2023-10-12 09:39:12','1984, Harry Potter e a Pedra Filosofal','PIX'),
    (3501,'2023-10-12 10:47:23','O Hobbit, Ubirajara, O Guarani, IT a Coisa','Cartão de crédito'),
    (3509,'2023-10-12 14:25:40','Memórias Póstumas de Brás Cubas','PIX'),
    (3511,'2023-10-12 14:44:03','Vinte mil Léguas Submarinas, O Retorno do Rei, O Hobbit','Cartão de débito'),
    (3530,'2023-10-13 10:05:36','A Revoluão dos Bixos, O Sertanejo, Paraíso','PIX'),
    (3531,'2023-10-13 11:34:01','Assassinato no Campo de Golfe, A Revolução dos Bixos','Cartão de débito'),
    (3532,'2023-10-13 11:48:20','Carrie, a Estranha, Volta ao Mundo em 80 Dias, O Lustre','Cartão de crédito'),
    (3533,'2023-10-13 12:12:58','Divina Comédia, Animais Fantásticos e Onde Habitam','PIX'),
    (3578,'2023-10-13 12:21:04','O Homem no Terno Marrom, Espectros','PIX'),
    (3589,'2023-10-14 12:30:19','Hora da Estrela, Viagem ao Centro da Terra, Harry Potter e o Prisioneiro de Azkaban, O Iluminado','Cartão de crédito'),
    (3678,'2023-10-14 13:01:13','Metamorfose, A Viagem, 1984, O Inferno de Dante','Cartão de débito'),
    (3693,'2023-10-14 13:15:52','A Revolução dos Bichos, Volta ao Mundo em 80 Dias','PIX'),
    (3706,'2023-10-15 13:21:02','O Retorno do Rei, A Sociedade do Rei, Divina Comédia, O Inferno de Dante','Cartão de crédito'),
    (5409,'2023-10-15 13:27:37','Memórias Póstumas de Brás Cubas, Espectros','PIX');
    
-- Valores de pedidos

    INSERT INTO pedidos( id_pedido, data_pedido, data_entrega, status, itens_pedido, endereco_entrega) VALUES

    (5408,'2023-10-01 21:24:49','2023-10-06','Entregue','O Iluminado','Rua Grande 82, Recife'),
    (5430,'2023-10-01 22:30:41','2023-10-06','Entregue','1984, A Revolução dos Bichos','Rua do Carvalho 921 Apt. 05, Paulista'),
    (5471,'2023-10-02 08:31:58','2023-10-07','Entregue','O Hobbit, O Castelo','Avenida do Governador 826, Recife'),
    (5489,'2023-10-05 01:19:06','2023-10-12','Entregue','O Inferno de Dante, A Sociedade do Anel','Rua das Mariposas 849, Recife'),
    (5712,'2023-10-09 19:21:57','2023-10-13','Entregue','Divina Comédia','Rua Castelo Branco 735, Recife'),
    (5745,'2023-10-10 07:48:43','2023-10-16','Não entregue','Memórias Póstumas de Brás Cubas, O Guarani, Vinte mil Léguas Submarinas','Rua Azul 342, Paulista'),
    (5788,'2023-10-12 23:21:02','2023-10-16','Não entregue','Viagem ao Centro da Terra, Espectros','Rua Gonçalves Dias 294, Abreu e Lima'),
    (5821,'2023-10-13 10:54:36','2023-10-17','Não entregue','Carrie, a Estranha, IT a Coisa','Alameda do Beija-Flor 507, Olinda'),
    (5856,'2023-10-13 11:57:04','2023-10-19','Não entregue','O Iluminado, Metamorfose, 1984','Rua Lagarta Verde 51, Recife'),
    (5860,'2023-10-13 13:08:38','2023-10-19','Não entregue','Vinte mil Léguas Submarinas','Rua do Amor 673, Olinda'),
    (5869,'2023-10-13 15:09:36','2023-10-19','Não entregue','1984','Rua dos Fortes 907, Abreu e Lima'),
    (5892,'2023-10-14 12:43:23','2023-10-20','Não entregue','IT a Coisa','Rua Lamarck 895 Apt. 62, Recife');  

-- Valores de exemplar

    INSERT INTO exemplar(numero_serie, estado, localizacao_editora) VALUES
        
    (4859345730391,'Disponível','Segundo andar, Setor A'),
    (0384839482947,'Disponível','Primeiro andar, Setor E'),
    (8492984928921,'Reservado','Primeiro andar, Setor C'),
    (9284287538215,'Indisponível','Segundo andar, Setor B'),
    (6572841803822,'Disponível','Primeiro andar, Setor A'),
    (9282948230061,'Disponível','Primeiro andar, Setor C'),
    (2747385828490,'Indisponível','Segundo andar, Setor B'),
    (8592847290442,'Disponível','Primeiro andar, Setor D'),
    (9302845509218,'Disponível','Segundo andar, Setor A'),
    (9385203849103,'Danificado','Segundo andar, Setor C');
    
-- Valores de livro

    INSERT INTO  livro (isbn, titulo_livro, autor, editora, data_publicacao, genero, paginas, descricao_livro) VALUES
        
    (4859345730391,'1984','George Orwell','Mil Folhas','1949-06-08','Distopia',326,'O livro se passa em um mundo de vigilância 
    governamental e manipulação'),
    (8375827461093,'Divina Comédia','Dante Alighieri','Vaga-lume','1310-02-23','Épico',697,'descreve uma viagem onde se sucedem 
    diversos acontecimentos. Caracterizado pelas alegorias'),
    (1593859277016,'Memórias Póstumas de Brás Cubas','Machado de Assis','Mil Folhas','1880-03-15','Romance',320,'retrata a escravidão, 
    as classes sociais, o cientificismo e o positivismo'),
    (3924838345592,'Espectros','Cecília Meireles','SBD','1919-02-20','Poesia',250,'coleção de 17 sonetos de influência 
    simbolista retratando temas históricos ou religiosos'),
    (9282948230061,'Harry Potter e a Pedra Filosofal','J.K.Rowling','Mil Folhas','1997-07-22','Fantasia',223,'O livro conta a história 
    de Harry Potter, que descobre, em seu aniversário, que é um bruxo'),
    (2839118344801,'O Hobbit','J.R.R.Tolkien','Vaga-lume','1937-09-21','Fantasia',310,'o livro segue a busca do hobbit 
    Bilbo Bolseiro para conquistar o tesouro guardado pelo dragão Smaug'),
    (1839283274011,'O Iluminado','Stephen King','SBD','1977-01-28','Terror',497,'O livro trata da vida de Jack, um aspirante a escritor 
    que aceita o emprego de zelador do famoso Hotel Overlook, para onde se muda com sua esposa e seu filho'),
    (9302848283824,'A Revolução dos Bichos','George Orwell','Vaga-lume','1945-08-17','Política',113,'O livro narra uma história 
    de corrupção e traição e recorre a figuras de animais para retratar as fraquezas humanas'),
    (8492984928921,'O Guarani','José de Alencar','SBD','1857-01-01','Romance',130,'o livro trata sobre a história de Peri, um indígena
    goitacá que se apaixona por Cecília, uma mulher branca aristocrata'),
    (6834929492013,'Metamorfose','Franz Kafka','Vaga-lume','1915-04-21','Contos',96,'esta obra,descreve um viajante de nome 
    Gregor Samsa, que abandona as suas vontades e desejos para sustentar a família e pagar a dívida dos pais');
     
-- Comandos SELECT 

SELECT * FROM funcionario WHERE id_funcionario = '012';
SELECT * FROM funcionario WHERE cargo = 'Publicitário';
SELECT * FROM autor WHERE nome_autor = 'Dante Alighieri';
SELECT * FROM exemplar WHERE numero_serie = '9282948230061';
SELECT * FROM autor WHERE nacionalidade = 'Ucraniana-Brasileira';
SELECT * FROM palavras_chave WHERE id_palavra = '007';
SELECT data_pedido FROM pedidos WHERE data_pedido BETWEEN '2023-10-09' AND '2023-10-12';
SELECT id_vendas FROM vendas_fisicas WHERE forma_pagamento = 'Cartão de débito';

-- Comandos JOIN  

SELECT * FROM autor jk
INNER JOIN livro hp
ON jk.obras_escritas = hp.autor;

SELECT * FROM funcionario lc
INNER JOIN departamento cl
ON lc.departamento = cl.nome_departamento;

SELECT * FROM palavras_chave pc
INNER JOIN area_conhecimento cp
ON pc.id_palavra = cp.id_area;

SELECT * FROM vendas_fisicas vf
INNER JOIN pedidos fv
ON vf.data_compra = fv.data_pedido;

SELECT * FROM livro lv
INNER JOIN exemplar vl
ON lv.isbn = vl.numero_serie;
    
SELECT * FROM palavras_chave pac
INNER JOIN livro cap
ON pac.descricao_palavra = cap.genero;

SELECT * FROM pedidos ped
INNER JOIN vendas_fisicas dep
ON ped.itens_pedido = dep.itens_compra;

SELECT * FROM autor nom
INNER JOIN livro mon
ON nom.nome_autor = mon.autor;

SELECT * FROM autor vend
INNER JOIN pedidos dnev
ON vend.obras_escritas = dnev.itens_pedido;

SELECT * FROM autor fisi
INNER JOIN vendas_fisicas isif
ON fisi.obras_escritas = isif.itens_compra;

SELECT isbn, titulo_livro FROM livro WHERE isbn IN 
(SELECT numero_serie FROM exemplar WHERE estado = 'Disponível' AND localizacao_editora = 'Primeiro andar, Setor A');

SELECT COUNT(*) AS total_disponivel FROM exemplar WHERE estado = 'Disponível';

SELECT COUNT(*) AS total_indisponivel FROM exemplar WHERE estado = 'Indisponível';

SELECT COUNT(*) AS pedidos_entregues FROM pedidos WHERE status = 'Entregue';

-- Comandos ALTER 

ALTER TABLE funcionario ADD salario DOUBLE;
ALTER TABLE vendas_fisicas ADD nome_cliente VARCHAR(45);
ALTER TABLE departamento DROP atividades;
ALTER TABLE pedidos ADD nome_cliente VARCHAR(45);
ALTER TABLE funcionario ADD conta_discord VARCHAR(45);
ALTER TABLE pedidos ADD forma_pagamento_online VARCHAR(45);
ALTER TABLE vendas_fisicas ADD email_cliente VARCHAR(45);
ALTER TABLE departamento ADD localizacao_setor VARCHAR(50);
ALTER TABLE funcionario ADD cpf_funcionario DOUBLE;
ALTER TABLE departamento DROP COLUMN responsavel;
    
-- Comandos UPDATE 

UPDATE exemplar SET localizacao_editora = 'Segundo andar, Setor C' WHERE numero_serie = '4859345730391';
UPDATE pedidos SET status = 'Entregue' WHERE  id_pedido = '5788'; 
UPDATE autor SET nome_autor = '1265-06-01' WHERE id_autor = '301';
UPDATE funcionario SET endereco = 'Rua 1 de Abril 74, Recife' WHERE id_funcionario = '052';
UPDATE exemplar SET estado = 'Disponível' WHERE numero_serie = '2747385828490';
UPDATE pedidos SET status = 'Entregue' WHERE id_pedido = '5821';
UPDATE exemplar SET estado = 'Disponível' WHERE numero_serie = '8492984928921';
UPDATE livro SET editora = 'Nova Leitura' ;
UPDATE pedidos SET data_entrega = '2023-10-19' WHERE id_pedido = '5892';
UPDATE livro SET data_publicacao = '1880-06-01' WHERE isbn = '1593859277016';
UPDATE vendas_fisicas SET forma_pagamento = 'Cartão de crédito' WHERE id_vendas = '3530';

-- Comando DELETE 

DELETE FROM funcionario  WHERE id_funcionario = '050';
DELETE FROM exemplar WHERE numero_serie = '9284287538215';
DELETE FROM pedidos WHERE endereco_entrega = 'Rua Grande 82, Recife';
DELETE FROM area_conhecimento WHERE descricao_area = 'Química';
DELETE FROM funcionario WHERE endereco = 'Rua das Laranjeiras 59, Olinda';
DELETE FROM pedidos WHERE id_pedido = '5408';
DELETE FROM palavras_chave WHERE id_palavra = '02';
DELETE FROM vendas_fisicas WHERE id_vendas = '3509';
DELETE FROM pedidos WHERE id_pedido = '5869';
DELETE FROM funcionario WHERE id_funcionario = '010';

-- Comandos VIEW 

CREATE VIEW funcionarios_ti AS SELECT id_funcionario, nome_funcionario, departamento, cargo FROM funcionario WHERE departamento = 'Tecnologia_Informação';
CREATE VIEW vendas_pix AS SELECT forma_pagamento FROM vendas_fisicas WHERE forma_pagamento = 'PIX';
CREATE VIEW editora_mil_folhas AS SELECT editora FROM livro WHERE editora = 'Mil Folhas';
CREATE VIEW editora_vagalume AS SELECT editora FROM livro WHERE editora = 'Vaga-Lume';
CREATE VIEW vendas_cartao_credito AS SELECT id_vendas, data_compra, itens_compra, forma_pagamento FROM vendas_fisicas WHERE forma_pagamento = 'Cartão de crédito';
CREATE VIEW funcionarios_traducao AS SELECT id_funcionario, nome_funcionario, departamento, cargo FROM funcionario WHERE departamento = 'Tradução';
CREATE VIEW exemplares_disponiveis AS SELECT numero_serie, estado, localizacao_editora FROM exemplar WHERE estado = 'Disponível';
CREATE VIEW exemplares_indisponiveis AS SELECT numero_serie, estado, localizacao_editora FROM exemplar WHERE estado = 'Indisponível';
CREATE VIEW funcionarios_producao AS SELECT id_funcionario, nome_funcionario, departamento, cargo FROM funcionario WHERE departamento = 'Produção';
CREATE VIEW autores_britanicos AS SELECT id_autor, nome_autor, biografia, nacionalidade, data_nascimento, obras_escritas FROM autor WHERE 
nacionalidade = 'Britânico';

-- Comando Drop

-- DROP DATABASE;
-- DROP TABLE funcionarios;
-- DROP TABLE autor;
-- DROP TABLE palavras_chave;
-- DROP TABLE area_conhecimento;
-- DROP TABLE pedidos;
-- DROP TABLE vendas_fisicas;
-- DROP TABLE exemplar;
-- DROP TABLE DEPARTAMENTO;
