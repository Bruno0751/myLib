CREATE DATABASE servlet;

USE servlet;

CREATE TABLE servlet.tipo_servlet (
	id_tipo INT AUTO_INCREMENT NOT NULL,
	descricao ENUM('ADM', 'USER', 'OUTRO') NULL,
	bl_ativo BOOL NOT NULL,
    data_registro DATE NOT NULL,
	hora_registro TIME NOT NULL,
	CONSTRAINT pk_id_combo PRIMARY KEY(id_tipo));
    
INSERT INTO servlet.tipo_servlet
VALUES(NULL, 'ADM', 1, NOW(), NOW()),
(NULL, 'USER', 1, NOW(), NOW()),
(NULL, 'OUTRO', 0, NOW(), NOW());

CREATE TABLE servlet.cliente_servlet (
	id_cliente INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(30) NULL,
	idade INT NULL,
	enviar_email BOOL NULL,
    tipo INT NOT NULL,
	data_registro DATE NOT NULL,
	hora_registro TIME NOT NULL,
	CONSTRAINT pk_id_cliente PRIMARY KEY(id_cliente),
    CONSTRAINT fk_tipo FOREIGN KEY(tipo) REFERENCES servlet.tipo_servlet(id_tipo) ON DELETE CASCADE);
    
INSERT INTO servlet.cliente_servlet
VALUES(NULL, 'Bruno Gressler da Silveira', 26, 1, 1, NOW(), NOW()),
(NULL, 'Fernando Rodriguez', 30, 0, 2, NOW(), NOW()),
(NULL, 'Jessica de Souza Tavares', 21, 1 , 2, NOW(), NOW());

CREATE TABLE servlet.venda_servlet (
	id_venda INT AUTO_INCREMENT NOT NULL,
	cidade VARCHAR(50) NULL,
	uf CHAR(2) NULL,
    valor DOUBLE NULL,
	cliente INT NOT NULL,
	data_registro DATE NOT NULL,
	hora_registro TIME NOT NULL,
	CONSTRAINT pk_id_venda PRIMARY KEY(id_venda),
	CONSTRAINT fk_cliente FOREIGN KEY(cliente) REFERENCES servlet.cliente_servlet(id_cliente));
    
INSERT INTO servlet.venda_servlet
VALUES(NULL, 'Porto Alegre', 'RS', 300.40, 1, NOW(), NOW()),
(NULL, 'São Paulo', 'SP', 4120.30, 3, NOW(), NOW()),
(NULL, 'Maceio', 'AL', 10.30, 3, NOW(), NOW());

ALTER TABLE servlet.cliente_servlet DROP CONSTRAINT fk_tipo;

ALTER TABLE servlet.cliente_servlet DROP INDEX fk_tipo;

ALTER TABLE servlet.cliente_servlet ADD CONSTRAINT fk_tipo FOREIGN KEY(tipo) REFERENCES servlet.tipo_servlet(id_tipo) ON UPDATE NO ACTION ON DELETE NO ACTION;



