CREATE DATABASE IF NOT EXISTS constraints;

USE constraints;


-- 1.NOT NULL: Crie uma tabela usuarios com uma coluna nome que não pode ser nula.
CREATE TABLE IF NOT EXISTS usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL 
);

insert into usuarios(nome)
	values ('Bruno Henrique');


-- 2.UNIQUE: Crie uma tabela clientes com uma coluna email que deve ser única.
CREATE TABLE IF NOT EXISTS clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(45) UNIQUE
);

insert into clientes(email)
	values ('Bh@flamengo.com');
    
    
-- 3.PRIMARY KEY: Defina uma tabela produtos onde a coluna id_produto é a chave primária.
CREATE TABLE IF NOT EXISTS produtos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30) NOT NULL,
data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
); 

insert into produtos(nome)
	values ('Bola de Futebol Nike');


-- 4.FOREIGN KEY: Crie uma tabela pedidos que referencie a tabela clientes usando uma chave estrangeira.
CREATE TABLE IF NOT EXISTS pedidos(
id INT AUTO_INCREMENT PRIMARY KEY,
numero_pedido VARCHAR(15),
clientes_id INT NOT NULL,
FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);

insert into pedidos(numero_pedido, clientes_id)
	values ('1', 1);
    
    
-- 5.CHECK: Crie uma tabela funcionarios com uma coluna idade que deve ser maior ou igual a 18.
CREATE TABLE IF NOT EXISTS funcionarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
idade INT NOT NULL CHECK (idade >= 18)
);

INSERT INTO funcionarios(nome, idade)
	 VALUES('Jason', 18);

-- 6.DEFAULT: Crie uma tabela transacoes onde a coluna status tem um valor padrão de 'Pendente'.
CREATE TABLE IF NOT EXISTS transacoes (
id INT AUTO_INCREMENT PRIMARY KEY,
statuss VARCHAR(10) DEFAULT 'Pendente'
);
    
INSERT INTO transacoes() VALUES();
    
SELECT * FROM transacoes;


-- 7.INDEX: Crie um índice na coluna nome da tabela clientes para otimizar buscas.

DESC clientes;
ALTER TABLE clientes 
	ADD COLUMN nome VARCHAR(40) NOT NULL;

CREATE INDEX idx_nome ON clientes(nome);

SHOW INDEX FROM clientes;
DROP INDEX idx_email ON clientes;


-- 8.REFERENCES: Crie uma tabela alugueis que tenha uma coluna id_cliente referenciando a tabela clientes.
CREATE TABLE IF NOT EXISTS alugueis(
id INT AUTO_INCREMENT PRIMARY KEY,
endereco VARCHAR(45) NOT NULL,
valor_aluguel DECIMAL(8,2),
clientes_id INT, 
FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);


-- 9.AUTO_INCREMENT: Crie uma tabela categorias onde a coluna id_categoria é auto-incrementada.
CREATE TABLE IF NOT EXISTS categorias(
id INT AUTO_INCREMENT PRIMARY KEY,
tipo_categoria VARCHAR(45) NOT NULL
);


-- 10.TRIGGER: Crie um trigger que registre a data e hora de criação ao inserir um novo registro na tabela usuarios.
DESC usuarios;

ALTER TABLE usuarios 
	ADD COLUMN data_criacao DATETIME;

CREATE TRIGGER log_data_hora
BEFORE INSERT ON usuarios
FOR EACH ROW
SET NEW.data_criacao = NOW();

INSERT INTO usuarios(nome)
	 VALUES ('De La Cruz');

SELECT * FROM usuarios;


-- 11.SET NULL: Crie uma tabela comentarios com uma coluna id_post que, ao excluir um post, deve ser definida como NULL.
CREATE TABLE IF NOT EXISTS posts(
id INT AUTO_INCREMENT PRIMARY KEY,
conteudo VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS comentarios(
id INT AUTO_INCREMENT PRIMARY KEY,
msg VARCHAR(50),
likes INT,
post_id INT,
FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE SET NULL -- on delete: significa que quando for deletado ira definir como um valor nulo
);
DROP TABLE comentarios;

-- inserindo os dados
INSERT INTO posts(conteudo) VALUES ('Foto na praia');
INSERT INTO comentarios(msg, post_id) VALUES ('top top', 1);

SELECT * FROM posts
JOIN comentarios ON comentarios.post_id = posts.id;

-- deletando os comentarios e posts
DELETE FROM posts WHERE id = 1;
SELECT * FROM posts;

-- TESTANDO SE FUNCIONOU
select comentarios.*, posts.conteudo
	from comentarios
    left join posts on comentarios.post_id = posts.id;
    
    
-- 12.SET DEFAULT: Crie uma tabela reservas onde a coluna data_reserva tem o valor padrão da data atual.
CREATE TABLE IF NOT EXISTS reservas(
id INT AUTO_INCREMENT PRIMARY KEY,
data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP -- default para vir padrão uma data quando for adicionado uma reserva
);

select * from reservas;

-- inserindo valores de forma escrita
INSERT INTO reservas(data_reserva) VALUES ('2024-12-24 23:00');

-- inserindo valores vazios
INSERT INTO reservas() VALUES();

-- 13.CHECK CONSTRAINT (com múltiplas colunas): Crie uma tabela vendas com uma coluna quantidade e preco, onde a soma deve ser maior que 0.
CREATE TABLE vendas(
quantidade INT,
preco DECIMAL(10,2),
CHECK (quantidade + preco > 0) -- o CHECK funciona como uma checagem para dar TRUE numa condicao
);

-- TESTANDO SE A CHECK VAI FUNCIONAR
INSERT INTO vendas(quantidade, preco)
	 VALUES(0, '0.00');

-- inserindo os valores corretamente agora
INSERT INTO vendas(quantidade, preco)
	 VALUES(1, '222.00');
     
SELECT * FROM vendas;
          
-- 14.FOREIGN KEY com ON DELETE CASCADE: Crie uma tabela cursos e uma tabela matriculas que exclua as matrículas se o curso for excluído.
-- 15.UNIQUE INDEX: Crie um índice único na tabela usuarios que garanta que não existam duplicatas no campo cpf.
-- 16.CHECK com função: Crie uma tabela produtos que utilize uma função personalizada para validar que o preço é positivo.
-- 17.TRIGGER com múltiplas ações: Crie um trigger que atualiza o estoque de produtos toda vez que uma venda for registrada.
