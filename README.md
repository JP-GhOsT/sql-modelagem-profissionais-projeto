# 🗃️ Modelagem Relacional: Profissionais e Projetos (SQL)

Este projeto demonstra a modelagem de um banco relacional com **relacionamentos 1:N e N:N**, aplicando **boas práticas de banco de dados** e **integridade referencial** com `PRIMARY KEY` e `FOREIGN KEY`.

> Ideal para estudo, aulas de Banco de Dados e portfólio técnico.

---

## 🎯 Objetivos

- Criar tabelas relacionadas por chave estrangeira  
- Modelar relacionamento 1:N (Cargos → Profissionais)  
- Modelar relacionamento N:N (Profissionais ↔ Projetos)  
- Garantir integridade referencial  
- Popular o banco com dados de teste  
- Consultar dados usando JOIN

---

## 🧱 Estrutura das Tabelas

### `tb_cargos`
| Campo      | Tipo         | Regra       |
|------------|--------------|------------|
| id_cargo   | INT          | PK         |
| nm_cargos  | VARCHAR(100) | NOT NULL   |

### `tb_profissionais`
| Campo           | Tipo         | Regra                             |
|-----------------|--------------|----------------------------------|
| id_profissional | INT          | PK                               |
| id_cargo        | INT          | FK → tb_cargos(id_cargo)        |
| nm_profissional | VARCHAR(100) | NOT NULL                         |
| qt_salario      | FLOAT        |                                  |
| qt_idade        | INT          |                                  |

### `tb_projetos`
| Campo       | Tipo         | Regra       |
|-------------|--------------|------------|
| id_projeto  | INT          | PK         |
| nm_projeto  | VARCHAR(100) | NOT NULL   |

### `tb_profissional_projeto` (associativa N:N)
| Campo           | Tipo | Regra                             |
|-----------------|------|----------------------------------|
| id_projeto      | INT  | FK → tb_projetos(id_projeto)     |
| id_profissional | INT  | FK → tb_profissionais(id_profissional) |
| **PK composta** |      | (id_projeto, id_profissional)    |

---

## 🔗 Relacionamentos

tb_cargos (1) -------- (N) tb_profissionais (1) -------- (N) tb_profissional_projeto (N) -------- (1) tb_projetos


---

## 🧪 Inserção de Dados (Exemplo)

```sql
-- Cargos
INSERT INTO tb_cargos VALUES
(1, 'Gerente de Projetos'),
(2, 'Analista de Sistemas'),
(3, 'Desenvolvedor Web'),
(4, 'Especialista de IA');

-- Profissionais
INSERT INTO tb_profissionais VALUES
(1,1,'João',5000,40),
(1,2,'Maria',3800.7,36),
(2,3,'Walter',4000.5,29),
(3,4,'Jordana',3800,32),
(4,5,'Carolina',4500,43);

-- Projetos
INSERT INTO tb_projetos VALUES
(1,'projeto1'),
(2,'projeto2'),
(3,'projeto3');

-- Associar profissionais a projetos
INSERT INTO tb_profissional_projeto VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,3);

---

## 🔎 Consulta Exemplo

```sql
SELECT 
    p.id_profissional,
    p.nm_profissional,
    c.nm_cargos AS cargo,
    pr.nm_projeto AS projeto
FROM tb_profissionais p
JOIN tb_cargos c ON p.id_cargo = c.id_cargo
JOIN tb_profissional_projeto pp ON pp.id_profissional = p.id_profissional
JOIN tb_projetos pr ON pp.id_projeto = pr.id_projeto
ORDER BY p.id_cargo, p.id_profissional, pp.id_projeto;

> Mostra cada profissional com seu cargo e os projetos que participa.

---

## 🛠️ Conceitos Demonstrados

- Modelagem Relacional  
- Relacionamento 1:N (Cargos → Profissionais)  
- Relacionamento N:N (Profissionais ↔ Projetos)  
- Chave Primária Simples e Composta  
- Chave Estrangeira (FK)  
- Integridade Referencial  
- Dados de Teste  
- JOIN entre tabelas  

---

## ▶️ Como Executar

1. Crie um banco de dados (MySQL, PostgreSQL, etc.)  
2. Execute o script `.sql` completo  
3. Rode o SELECT final para visualizar profissionais, cargos e projetos  

---

## 👨‍💻 Autor

🚀 **JP**    
🐙 GitHub: [github.com/JP-GhOsT](https://github.com/JP-GhOsT)

---

## 📌 Observação

Projeto didático para demonstrar **relacionamentos e integridade em banco relacional**.
