-- Criação das tabelas

-- Aqui, de curiosidade, temos o código de criação da Database 'airbnb_icmc'. Realizamos o bloqueio e a liberação de autocommit antes e depois da criação da base.
COMMIT;
DROP DATABASE IF EXISTS airbnb_icmc WITH (FORCE);
COMMIT;
CREATE DATABASE airbnb_icmc
    WITH OWNER = postgres
    ENCODING = 'UTF8';
COMMIT;

-- Aqui começamos com os comandos de criação:
CREATE TYPE tipo_locacao AS ENUM {"quarto individual", "quarto compartilhado", "casa própria", "apartamento", "chalé"}; 
CREATE TYPE tipo_sexo AS ENUM {"F", "M"};
CREATE TYPE tipo_quarto AS ENUM {"solteiro", "casal", "beliche"};
CREATE TYPE tipo_conta AS ENUM {"corrente", "poupança"};
CREATE TYPE tipo_usuario AS ENUM {"locatário", "proprietário", "locatário e proprietário"};

-- Tabela de Localizações:
CREATE TABLE IF NOT EXISTS Localizacao(
  cidade         VARCHAR(40),
  estado         VARCHAR(20),
  pais           VARCHAR(30),
  PRIMARY KEY (cidade, estado, pais)
);

-- Tabela de Usuários:
CREATE TABLE IF NOT EXISTS Usuario(
  nome             VARCHAR(70) NOT NULL,
  sobrenome        VARCHAR(70) NOT NULL,
  num_tel          VARCHAR(11) NOT NULL,
  tipo             tipo_usuario NOT NULL,
  rua              VARCHAR(50) NOT NULL,
  numero           INTEGER NOT NULL,
  complemento      VARCHAR(40),
  cidade           VARCHAR(40),
  estado           VARCHAR(20),
  pais             VARCHAR(30),
  bairro           VARCHAR(50),
  dt_nascimento    DATE NOT NULL,
  sexo             tipo_sexo NOT NULL,
  email            VARCHAR(50) UNIQUE NOT NULL,
  senha            VARCHAR(40) NOT NULL,
  PRIMARY KEY (nome, sobrenome, num_tel),
  FOREIGN KEY (cidade, estado, pais) REFERENCES Localizacao (cidade, estado, pais)
);

-- Tabela de Propriedades:
CREATE TABLE IF NOT EXISTS Propriedade(
  id               INTEGER,
  nome             VARCHAR(70) NOT NULL,
  rua              VARCHAR(50) NOT NULL,
  numero           INTEGER NOT NULL,
  complemento      VARCHAR(40),
  cidade           VARCHAR(40),
  estado           VARCHAR(20),
  pais             VARCHAR(30),
  bairro           VARCHAR(50),
  nome_dono        VARCHAR(70),
  sobrenome_dono   VARCHAR(70),
  num_tel_dono     VARCHAR(11),
  num_quartos      INTEGER NOT NULL,
  tipo_quarto      tipo_quarto NOT NULL,
  num_camas        INTEGER,
  num_banheiros    INTEGER NOT NULL,
  tipo_hospedagem  tipo_locacao NOT NULL,
  preco_noite      DECIMAL(6,2) NOT NULL,
  num_max_hosp     INTEGER NOT NULL,
  num_min_noites   INTEGER NOT NULL,
  num_max_noites   INTEGER NOT NULL,
  taxa_limpeza     DECIMAL(6,2),
  horario_check_in  TIME,
  horario_check_out TIME,
  PRIMARY KEY (id),
  CONSTRAINT Propriedade_CK1 UNIQUE (nome, rua, numero),
  FOREIGN KEY (nome_dono, sobrenome_dono, num_tel_dono) REFERENCES Usuario (nome, sobrenome, num_tel),
  FOREIGN KEY (cidade, estado, pais) REFERENCES Localizacao (cidade, estado, pais)
);

-- Tabela de Locações:
CREATE TABLE IF NOT EXISTS Locacao(
  id                  INTEGER,
  data_check_in       DATE NOT NULL,
  data_check_out      DATE NOT NULL,
  num_hospedes        INTEGER NOT NULL,
  valor               DECIMAL(10,2) NOT NULL,
  taxa_limpeza        DECIMAL(10,2),
  imposto             DECIMAL(4,2),
  codigo_promocao     VARCHAR(50), 
  desconto            DECIMAL(4,2),
  valor_total         DECIMAL(10,2),
  PRIMARY KEY (id)
);

-- Tabela de Contas Bancárias:
CREATE TABLE IF NOT EXISTS Conta_bancaria(
  num_conta         VARCHAR(15),
  nome_dono         VARCHAR(70),
  sobrenome_dono    VARCHAR(70),
  num_tel_dono      VARCHAR(11),
  num_roteamento    VARCHAR(50) NOT NULL,
  tipo_conta        tipo_conta NOT NULL,
  PRIMARY KEY (num_conta, nome_dono, sobrenome_dono, num_tel_dono),
  FOREIGN KEY (nome_dono, sobrenome_dono, num_tel_dono) REFERENCES Usuario (nome, sobrenome, num_tel)
);

-- Tabela de Comodidades:
CREATE TABLE IF NOT EXISTS Comodidade(
  nome              VARCHAR(70),
  id_propriedade    INTEGER,
  quantidade        INTEGER,
  PRIMARY KEY (nome, id_propriedade),
  FOREIGN KEY (id_propriedade) REFERENCES Propriedade (id)
);

-- Tabela de Regras:
CREATE TABLE IF NOT EXISTS Regra(
  nome              VARCHAR(70),
  id_propriedade    INTEGER,
  descricao         TEXT,
  PRIMARY KEY (nome, id_propriedade),
  FOREIGN KEY (id_propriedade) REFERENCES Propriedade (id)
);

-- Tabela de Pontos de Interesse:
CREATE TABLE IF NOT EXISTS Pontos_interesse(
  nome                  VARCHAR(70),
  cidade                VARCHAR(40),
  estado                VARCHAR(20),
  pais                  VARCHAR(30),
  preco                 DECIMAL(10,2),
  horario_inicio        TIME,
  horario_encerramento  TIME,
  PRIMARY KEY (nome, cidade, estado, pais),
  FOREIGN KEY (cidade, estado, pais) REFERENCES Localizacao (cidade, estado, pais)
);

-- Tabela de Avaliações:
CREATE TABLE IF NOT EXISTS Avaliar(
  nome_locatario         VARCHAR(70),
  sobrenome_locatario    VARCHAR(70),
  num_tel_locatario      VARCHAR(11),
  id_prop                INTEGER,
  mensagem               TEXT,
  hora_mensagem          TIMESTAMP,
  nota_limpeza           INTEGER CHECK (nota_limpeza BETWEEN 1 AND 5) NOT NULL,
  nota_comunicacao       INTEGER CHECK (nota_comunicacao BETWEEN 1 AND 5) NOT NULL,
  nota_localizacao       INTEGER CHECK (nota_localizacao BETWEEN 1 AND 5) NOT NULL,
  nota_valor             INTEGER CHECK (nota_valor BETWEEN 1 AND 5) NOT NULL,
  PRIMARY KEY (nome_locatario, sobrenome_locatario, num_tel_locatario, id_prop),
  FOREIGN KEY (nome_locatario, sobrenome_locatario, num_tel_locatario) REFERENCES Usuario (nome, sobrenome, num_tel),
  FOREIGN KEY (id_prop) REFERENCES Propriedade (id)
);

-- Tabela de Reservas:
CREATE TABLE IF NOT EXISTS Reservar(
  nome_locatario         VARCHAR(70),
  sobrenome_locatario    VARCHAR(70),
  num_tel_locatario      VARCHAR(11),
  id_prop                INTEGER,
  id_locacao             INTEGER,
  data_reserva           DATE,
  confirmacao            BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (nome_locatario, sobrenome_locatario, num_tel_locatario, id_prop, id_locacao),
  FOREIGN KEY (nome_locatario, sobrenome_locatario, num_tel_locatario) REFERENCES Usuario (nome, sobrenome, num_tel),
  FOREIGN KEY (id_prop) REFERENCES Propriedade (id),
  FOREIGN KEY (id_locacao) REFERENCES Locacao (id)
);