CREATE SCHEMA projeto6 DEFAULT CHARACTER SET utf8;

USE projeto6;

CREATE TABLE funcionarios (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nasc INT(8),
    cpf INT(11),
    PRIMARY KEY(id)
);

CREATE TABLE caixa (
	id INT NOT NULL AUTO_INCREMENT,
    cod_caixa INT(11),
    controle_envios BOOL,
	PRIMARY KEY(id)
);

CREATE TABLE entregador (
	id INT NOT NULL AUTO_INCREMENT,
	cod_entregador INT(11),
    controle_entregas BOOL,
	PRIMARY KEY(id)
);

CREATE TABLE clientes (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf_cnpj INT(14),
    email VARCHAR(100),
    endereco VARCHAR(100),
    num_end INT(10),
    bairro VARCHAR(10),
    cidade VARCHAR(50),
    estado VARCHAR(10),
    telefone INT(11),
	PRIMARY KEY(id_cliente)
);

CREATE TABLE pacote (
	id_pacote INT NOT NULL AUTO_INCREMENT,
    data_entrega INT(11),
    data_envio INT(8),
    id_cliente INT(11),
    peso INT(8),
    tamanho_larg INT(6), 
    tamanho_alt INT(6),
    tamanho_compr INT(6),
    env_logr VARCHAR(100),
    env_num INT(10),
    env_bairro VARCHAR(10),
    env_cidade VARCHAR(50),
    env_estado VARCHAR(10),
    CONSTRAINT fk_cliente_id FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
	PRIMARY KEY(id_pacote)
);

CREATE TABLE entregas (
	id_entrega INT NOT NULL AUTO_INCREMENT,
    id_pacote INT(11),
    cod_rastr VARCHAR(13),
    tempo_est VARCHAR(10),
    CONSTRAINT fk_pacote_id FOREIGN KEY (id_pacote) REFERENCES pacote (id_pacote),
	PRIMARY KEY(id)
);

INSERT INTO funcionarios (id, nome, data_nasc, cpf) VALUES
(1, "Joao", 17081997, 09878976567),
(2, "Marina", 23041989, 08973465789);
SELECT * FROM funcionarios;

INSERT INTO caixa (id, cod_caixa, controle_envios) VALUES
(2, 00000000001, 1);
SELECT * FROM caixa;

INSERT INTO entregador (id, cod_entregador, controle_entregas) VALUES
(1, 00000000001, 1);
SELECT * FROM entregador;

INSERT INTO clientes (id_cliente, nome, cpf_cnpj, email, endereco, num_end, bairro, cidade, estado, telefone) VALUES
(1, "Jefferson", 00024768594831, "jeffinho@hotmail.com", "rua indaial", 256, "beira mar", "Santos", "Sao Paulo", 1132479697),
(2, "Cristina", 00034765819265, "cris@gmail.com", "rua jose tedeo", 102, "centro", "Sao Bernardo do Campo", "Sao Paulo", 1135698999),
(3, "Jonas", 00034765456367, "jns@gmail.com", "rua bartolomeu", 47, "centro", "Ananindeua", "Para", 1137079787);
SELECT * FROM clientes;

INSERT INTO pacote (id_pacote, data_entrega, data_envio, id_cliente, peso, tamanho_larg, tamanho_alt, tamanho_compr, env_logr, env_num, env_bairro, env_cidade, env_estado) VALUES
(1, 06062020, 29062020, 1, 399, 680, 680, 680, "rua tiradentes", 57, "laranjeiras", "Lages", "Santa Catarina"),
(2, 12062020, 29062020, 2, 240, 150, 150, 150, "rua washington", 90, "centro", "Goiania", "Goias");
SELECT * FROM pacote;

INSERT INTO entregas (id_entrega, id_pacote, cod_rastr, tempo_est) VALUES
(1, 1, "BD154826731JI", "uma uma semana"),
(2, 2, "FG847512369LO", "duas semanas");
SELECT * FROM entregas;

UPDATE entregas SET tempo_est = "uma semana e meia" WHERE id_entrega = 2;
SELECT * FROM entregas;

SELECT id_cliente, nome  FROM clientes;

DELETE FROM clientes WHERE id_cliente = 3;
SELECT * FROM clientes;







