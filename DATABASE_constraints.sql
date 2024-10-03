CREATE DATABASE IF NOT EXISTS constraints;

USE constraints;

-- 1.NOT NULL: Crie uma tabela usuarios com uma coluna nome que não pode ser nula.
CREATE TABLE IF NOT EXISTS usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL 
);

-- 2.UNIQUE: Crie uma tabela clientes com uma coluna email que deve ser única.
CREATE TABLE IF NOT EXISTS clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(45) UNIQUE
);

-- 3.PRIMARY KEY: Defina uma tabela produtos onde a coluna id_produto é a chave primária.
CREATE TABLE IF NOT EXISTS produtos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30) NOT NULL,
data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
); 

-- 4.FOREIGN KEY: Crie uma tabela pedidos que referencie a tabela clientes usando uma chave estrangeira.
CREATE TABLE IF NOT EXISTS pedidos(
id INT AUTO_INCREMENT PRIMARY KEY,
numero_pedido VARCHAR(15),
clientes_id INT NOT NULL,
FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);

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
id INT1 AUTO_INCREMENT PRIMARY KEY,
statuss VARCHAR(10) DEFAULT 'Pendente'
);

-- 7.INDEX: Crie um índice na coluna nome da tabela clientes para otimizar buscas.








-- 8.REFERENCES: Crie uma tabela alugueis que tenha uma coluna id_cliente referenciando a tabela clientes.
-- 9.AUTO_INCREMENT: Crie uma tabela categorias onde a coluna id_categoria é auto-incrementada.
-- 10.TRIGGER: Crie um trigger que registre a data e hora de criação ao inserir um novo registro na tabela usuarios.
-- 11.SET NULL: Crie uma tabela comentarios com uma coluna id_post que, ao excluir um post, deve ser definida como NULL.
-- 12.SET DEFAULT: Crie uma tabela reservas onde a coluna data_reserva tem o valor padrão da data atual.
-- 13.CHECK CONSTRAINT (com múltiplas colunas): Crie uma tabela vendas com uma coluna quantidade e preco, onde a soma deve ser maior que 0.
-- 14.FOREIGN KEY com ON DELETE CASCADE: Crie uma tabela cursos e uma tabela matriculas que exclua as matrículas se o curso for excluído.
-- 15.UNIQUE INDEX: Crie um índice único na tabela usuarios que garanta que não existam duplicatas no campo cpf.
-- 16.CHECK com função: Crie uma tabela produtos que utilize uma função personalizada para validar que o preço é positivo.
-- 17.TRIGGER com múltiplas ações: Crie um trigger que atualiza o estoque de produtos toda vez que uma venda for registrada.
