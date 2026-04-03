CREATE TABLE tb_cargos(
	id_cargo INT PRIMARY KEY,
	nm_cargos VARCHAR(100) NOT NULL
);

--inserindo cargos na tabela
INSERT INTO tb_cargos VALUES(1, 'Gerente de Projetos');
INSERT INTO tb_cargos VALUES(2, 'Analista de Sistemas');
INSERT INTO tb_cargos VALUES(3, 'Desenvolvedor Web');
INSERT INTO tb_cargos VALUES(4, 'Especialista de IA');

--select * from tb_cargos 

CREATE TABLE tb_profissionais(
	id_cargo INT,
	id_profissional INT,
	nm_profissional VARCHAR(100) NOT NULL,
	qt_salario FLOAT,
	qt_idade INT,
	PRIMARY KEY(id_profissional),
	FOREIGN KEY(id_cargo) REFERENCES tb_cargos(id_cargo)
);

--Inserir Profissionais e seus cargos

INSERT INTO tb_profissionais VALUES(1,1, 'João', 5000.00, 40);
INSERT INTO tb_profissionais VALUES(1,2, 'Maria', 3800.70, 36);
INSERT INTO tb_profissionais VALUES(2,3, 'Walter', 4000.50, 29);
INSERT INTO tb_profissionais VALUES(3,4, 'Jordana', 3800.00, 32);
INSERT INTO tb_profissionais VALUES(4,5, 'Carolina', 4500.00, 43);

--select * from tb_profissionais

CREATE TABLE tb_projetos(
	id_projeto INT PRIMARY KEY,
	nm_projeto VARCHAR(100) NOT NULL
);

--Criação dos projetos
INSERT INTO tb_projetos VALUES(1, 'projeto1');
INSERT INTO tb_projetos VALUES(2, 'projeto2');
INSERT INTO tb_projetos VALUES(3, 'projeto3');

--select * from tb_projetos

CREATE TABLE tb_profissional_projeto(
	id_projeto INT,
	id_profissional INT,
	FOREIGN KEY (id_projeto) REFERENCES tb_projetos(id_projeto),
	FOREIGN KEY (id_profissional) REFERENCES tb_profissionais(id_profissional),
	PRIMARY KEY (id_projeto, id_profissional)
);

--Inserir projetos para os profissionais
INSERT INTO tb_profissional_projeto VALUES(1,1);
INSERT INTO tb_profissional_projeto VALUES(1,2);
INSERT INTO tb_profissional_projeto VALUES(1,3);
INSERT INTO tb_profissional_projeto VALUES(2,1);
INSERT INTO tb_profissional_projeto VALUES(2,3);

SELECT 
	s.id_profissional,
	s.nm_profissional,
	s.id_cargo,
	d.id_projeto
FROM tb_profissionais s
JOIN tb_profissional_projeto d
	ON d.id_profissional = s.id_profissional
ORDER BY s.id_cargo, s.id_profissional, d.id_projeto;