-- Carregamento de Dados

-- Carregamento de Localizações:
INSERT INTO Localizacao (cidade, estado, pais)
VALUES 
('São Paulo', 'São Paulo', 'Brasil'),
('Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
('Belo Horizonte', 'Minas Gerais', 'Brasil'),
('Porto Alegre', 'Rio Grande do Sul', 'Brasil'),
('Curitiba', 'Paraná', 'Brasil'),
('Salvador', 'Bahia', 'Brasil'),
('Fortaleza', 'Ceará', 'Brasil'),
('Recife', 'Pernambuco', 'Brasil'),
('Brasília', 'Distrito Federal', 'Brasil'),
('New York City', 'New York', 'Estados Unidos'),
('Los Angeles', 'California', 'Estados Unidos'),
('Chicago', 'Illinois', 'Estados Unidos'),
('Houston', 'Texas', 'Estados Unidos'),
('Miami', 'Florida', 'Estados Unidos'),
('Boston', 'Massachusetts', 'Estados Unidos'),
('San Francisco', 'California', 'Estados Unidos'),
('Seattle', 'Washington', 'Estados Unidos'),
('Las Vegas', 'Nevada', 'Estados Unidos'),
('Orlando', 'Florida', 'Estados Unidos'),
('Campinas', 'São Paulo', 'Brasil'),
('Ribeirão Preto', 'São Paulo', 'Brasil'),
('Santos', 'São Paulo', 'Brasil'),
('São José dos Campos', 'São Paulo', 'Brasil');

-- Carregamento de Usuários:
INSERT INTO Usuario (nome, sobrenome, num_tel, tipo, rua, numero, complemento, cidade, estado, pais, bairro, dt_nascimento, sexo, email, senha)
VALUES 
('Lucas', 'Silva', '11987654321', 'locatário', 'Rua das Flores', 123, 'Apto 101', 'São Paulo', 'São Paulo', 'Brasil', 'Centro', '1990-05-15', 'M', 'lucas.silva@example.com', 'senha123'),
('Carolina', 'Santos', '11965437892', 'proprietário', 'Av. Principal', 456, NULL, 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 'Copacabana', '1985-10-20', 'F', 'carolina.santos@example.com', 'senha456'),
('Marcos', 'Oliveira', '1135678901', 'locatário e proprietário', 'Rua dos Coqueiros', 789, 'Bloco B', 'Belo Horizonte', 'Minas Gerais', 'Brasil', 'Centro', '1980-03-25', 'M', 'marcos.oliveira@example.com', 'senha789'),
('Camila', 'Costa', '11987651234', 'locatário', 'Rua das Palmeiras', 1011, NULL, 'Porto Alegre', 'Rio Grande do Sul', 'Brasil', 'Jardim Botânico', '1975-08-10', 'F', 'camila.costa@example.com', 'senha1011'),
('Rafael', 'Ferreira', '11999887766', 'locatário', 'Av. das Flores', 222, 'Apto 202', 'Curitiba', 'Paraná', 'Brasil', 'Batel', '1988-12-03', 'M', 'rafael.ferreira@example.com', 'senha2022'),
('Juliana', 'Oliveira', '11987651234', 'proprietário', 'Rua dos Pinheiros', 333, NULL, 'Santos', 'São Paulo', 'Brasil', 'Ponta da Praia', '1982-07-18', 'F', 'juliana.oliveira@example.com', 'senha3333'),
('Bruno', 'Almeida', '1135678901', 'locatário', 'Av. das Acácias', 444, 'Casa 1', 'Campinas', 'São Paulo', 'Brasil', 'Cambuí', '1979-09-05', 'M', 'bruno.almeida@example.com', 'senha4444'),
('Vanessa', 'Souza', '11999887766', 'locatário', 'Rua dos Girassóis', 555, NULL, 'Ribeirão Preto', 'São Paulo', 'Brasil', 'Jardim Paulista', '2004-09-24', 'F', 'vanessa.souza@example.com', 'senha5555'),
('Rodrigo', 'Machado', '11987651234', 'locatário e proprietário', 'Rua das Orquídeas', 666, NULL, 'São José dos Campos', 'São Paulo', 'Brasil', 'Vila Ema', '1983-01-30', 'M', 'rodrigo.machado@example.com', 'senha6666'),
('Patrícia', 'Gomes', '1135678901', 'proprietário', 'Av. dos Jacarandás', 777, 'Bloco C', 'São Paulo', 'São Paulo', 'Brasil', 'Moema', '1980-11-08', 'F', 'patricia.gomes@example.com', 'senha7777'),
('Fernando', 'Lima', '11999887766', 'locatário', 'Rua das Violetas', 888, NULL, 'Campinas', 'São Paulo', 'Brasil', 'Taquaral', '1976-06-22', 'M', 'fernando.lima@example.com', 'senha8888'),
('Patrícia', 'Sousa', '1135678901', 'locatário', 'Av. das Magnólias', 999, NULL, 'São Paulo', 'São Paulo', 'Brasil', 'Vila Mariana', '2003-03-17', 'F', 'patricia.sousa@example.com', 'senha9999'),
('Gustavo', 'Oliveira', '11987651234', 'locatário e proprietário', 'Rua das Orquídeas', 666, NULL, 'São José dos Campos', 'São Paulo', 'Brasil', 'Vila Ema', '1983-01-30', 'M', 'gustavo.oliveira@example.com', 'senha1111'),
('Camila', 'Lima', '1135678901', 'proprietário', 'Av. dos Jacarandás', 777, 'Bloco C', 'São Paulo', 'São Paulo', 'Brasil', 'Moema', '1980-11-08', 'F', 'camila.lima@example.com', 'senha2222'),
('Fernando', 'Machado', '11999887766', 'locatário', 'Rua das Violetas', 888, NULL, 'Campinas', 'São Paulo', 'Brasil', 'Taquaral', '1976-06-22', 'M', 'fernando.machado@example.com', 'senha3333'),
('Paula', 'Sousa', '1135678901', 'locatário', 'Av. das Magnólias', 999, NULL, 'São Paulo', 'São Paulo', 'Brasil', 'Vila Mariana', '2003-03-17', 'F', 'paula.sousa@example.com', 'senha4444'),
('Victor', 'Amaral', '1976543210', 'proprietário', 'Av. Norte-Sul', 458, NULL, 'Campinas', 'São Paulo', 'Brasil', 'Cambuí', '2002-01-12', 'M', 'victor.amaral@example.com', 'senha123@321'),
('João', 'Buzzo', '1976542222', 'proprietário', 'Av. Norte-Sul', 412, NULL, 'Campinas', 'São Paulo', 'Brasil', 'Cambuí', '1999-05-12', 'M', 'joao.buzzo@example.com', 'senha123@buzzo'),
('Leonardo', 'Ishida', '1976540009', 'proprietário', 'Av. Paulista', 1000, 'Apt 234', 'São Paulo', 'São Paulo', 'Brasil', 'Pinheiros', '2002-09-01', 'M', 'leozim@example.com', 'senhaLeo');

-- Carregamento de Propriedades:
INSERT INTO Propriedade (id, nome, rua, numero, complemento, cidade, estado, pais, bairro, nome_dono, sobrenome_dono, num_tel_dono, num_quartos, tipo_quarto, num_camas, num_banheiros, tipo_hospedagem, preco_noite, num_max_hosp, num_min_noites, num_max_noites, taxa_limpeza, horario_check_in, horario_check_out)
VALUES 
(21, 'Cozy Apartment', 'Sunset Blvd', 123, 'Apt 301', 'Los Angeles', 'California', 'Estados Unidos', 'Hollywood Hills', 'Carolina', 'Santos', '11965437892', 1, 'solteiro', 1, 1, 'apartamento', 100.00, 1, 1, 7, 20.00, '15:00', '11:00'),
(22, 'Beachfront Villa', 'Ocean Drive', 456, NULL, 'Miami', 'Florida', 'Estados Unidos', 'South Beach', 'Marcos', 'Oliveira', '1135678901', 3, 'casal', 6, 2, 'casa própria', 350.00, 8, 2, 14, 60.00, '16:00', '10:00'),
(25, 'Beach House', 'Beach Road', 111, NULL, 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 'Copacabana', 'Rodrigo', 'Machado', '11987651234', 4, 'casal', 8, 3, 'casa própria', 500.00, 10, 3, 30, 80.00, '14:00', '12:00'),
(1, 'Apartamento Aconchegante', 'Rua das Flores', 123, 'Apt 101', 'São Paulo', 'São Paulo', 'Brasil', 'Centro', 'Patrícia', 'Gomes', '1135678901', 2, 'casal', 4, 2, 'apartamento', 200.00, 4, 1, 7, 30.00, '14:00', '11:00'),
(2, 'Casa na Praia', 'Av. Principal', 456, NULL, 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 'Copacabana', 'Gustavo', 'Oliveira', '11987651234', 3, 'casal', 6, 2, 'casa própria', 300.00, 6, 2, 14, 40.00, '15:00', '10:00'),
(3, 'Chalé Charmoso', 'Rua dos Coqueiros', 789, 'Casa de Hóspedes', 'Belo Horizonte', 'Minas Gerais', 'Brasil', 'Centro', 'Camila', 'Lima', '1135678901', 1, 'solteiro', 2, 1, 'quarto individual', 100.00, 2, 1, 7, 20.00, '16:00', '12:00'),
(4, 'Casa de Campo', 'Rua das Palmeiras', 1011, NULL, 'Porto Alegre', 'Rio Grande do Sul', 'Brasil', 'Jardim Botânico', 'Marcos', 'Oliveira', '1135678901', 4, 'casal', 8, 3, 'chalé', 400.00, 8, 2, 21, 60.00, '15:00', '11:00'),
(5, 'Apartamento Moderno', 'Av. dos Pinheiros', 222, 'Apt 202', 'Santos', 'São Paulo', 'Brasil', 'Ponta da Praia', 'Juliana', 'Oliveira', '11987651234', 2, 'casal', 4, 2, 'apartamento', 250.00, 4, 2, 14, 50.00, '14:00', '11:00'),
(17, 'Casa na Praia Bonita', 'Rua dos Coqueiros', 123, NULL, 'Fortaleza', 'Ceará', 'Brasil', 'Praia de Iracema', 'Juliana', 'Oliveira', '11987651234', 3, 'casal', 6, 2, 'casa própria', 300.00, 6, 2, 14, 40.00, '15:00', '11:00'),
(18, 'Apartamento Monstruoso', 'Av. das Flores', 456, 'Apt 202', 'Recife', 'Pernambuco', 'Brasil', 'Boa Viagem', 'Rodrigo', 'Machado', '11987651234', 2, 'casal', 4, 1, 'apartamento', 250.00, 4, 1, 7, 30.00, '14:00', '10:00'),
(19, 'Chalé na Montanha', 'Rua das Palmeiras', 789, NULL, 'São José dos Campos', 'São Paulo', 'Brasil', 'Vila Ema', 'Rodrigo', 'Machado', '11987651234', 1, 'solteiro', 1, 1, 'quarto individual', 100.00, 2, 1, 7, 20.00, '16:00', '12:00'),
(20, 'Casa de Campo Luxuosa', 'Av. das Acácias', 1011, 'Casa de Hóspedes', 'Santos', 'São Paulo', 'Brasil', 'Ponta da Praia', 'Juliana', 'Oliveira', '11987651234', 4, 'casal', 8, 3, 'chalé', 400.00, 8, 2, 21, 60.00, '15:00', '11:00'),
(26, 'Casa de Hobbit', 'Av. das Macieiras', 101, NULL, 'Campinas', 'São Paulo', 'Brasil', NULL, 'Victor', 'Amaral', '1976543210', 4, 'casal', 8, 3, 'chalé', 300.00, 8, 1, 7, 60.00, '15:00', '11:00'),
(27, 'Casa de Praiana', 'Av. da Brisa', 1021, NULL, 'Santos', 'São Paulo', 'Brasil', 'Centro', 'João', 'Buzzo', '1976542222', 4, 'casal', 8, 3, 'casa própria', 300.00, 8, 1, 7, 60.00, '12:00', '12:00'),
(28, 'Apartamento Vista Boa', 'Av. das Moradias', 11, 'Apto 291', 'São Paulo', 'São Paulo', 'Brasil', 'Tatuapé', 'Leonardo', 'Ishida', '1976540009', 4, 'casal', 8, 3, 'apartamento', 300.00, 8, 1, 7, 60.00, '12:00', '12:00');

-- Carregamento de Locações:
INSERT INTO Locacao (id, data_check_in, data_check_out, num_hospedes, valor, taxa_limpeza, imposto, codigo_promocao, desconto, valor_total)
VALUES 
(1, '2024-06-15', '2024-06-20', 1, 500.00, 20.00, 0.05, NULL, NULL, 546.00),
(2, '2024-07-02', '2024-07-14', 8, 4200.00, 720.00, 0.05, '1424139839', 0.08, 4752.72),  
(3, '2024-05-28', '2024-06-02', 5, 2500.00, 400.00, 0.05, NULL, NULL, 3045.00),
(4, '2024-12-20', '2024-12-27', 4, 1400.00, 210.00, 0.05, NULL, NULL, 1690.50),
(5, '2024-01-03', '2024-01-05', 6, 600.00, 80.00, 0.05, NULL, NULL, 714.00),
(6, '2023-11-12', '2023-11-13', 1, 100.00, 20.00, 0.05, '1119826108', 0.10, 113.40),
(7, '2022-05-06', '2022-05-10', 4, 1400.00, 240.00, 0.03, NULL, NULL, 1722.00),
(8, '2024-05-20', '2024-05-22', 2, 500.00, 60.00, 0.05, NULL, NULL, 588.00),
(9, '2018-11-01', '2018-11-22', 5, 8400.00, 1260.00, 0.05, NULL, NULL, 10143.00),
(10, '2024-01-10', '2024-01-11', 2, 100.00, 20.00, 0.05, NULL, NULL, 126.00),
(11, '2017-07-03', '2017-07-07', 4, 1400.00, 240.00, 0.03, NULL, NULL, 1689.20),      
(12, '2023-09-03', '2023-09-04', 4, 300.00, 60.00, 0.05, NULL, NULL, 378.00),
(13, '2024-05-25', '2024-05-26', 4, 300.00, 60.00, 0.05, NULL, NULL, 378.00);

-- Carregamento de Reservas: 
INSERT INTO Reservar (nome_locatario, sobrenome_locatario, num_tel_locatario, id_prop, id_locacao, data_reserva, confirmacao)
VALUES 
('Lucas', 'Silva', '11987654321', 21, 1, '2024-03-15', TRUE),
('Paula', 'Sousa', '1135678901', 22, 2, '2024-05-01', FALSE),    
('Camila', 'Costa', '11987651234', 25, 3, '2024-03-05', TRUE),
('Rafael', 'Ferreira', '11999887766', 1, 4, '2024-05-12', FALSE),
('Bruno', 'Almeida', '1135678901', 2, 5, '2023-12-01', TRUE),
('Vanessa', 'Souza', '11999887766', 3, 6, '2023-07-11', TRUE),
('Rodrigo', 'Machado', '11987651234', 22, 7, '2022-02-28', TRUE),
('Fernando', 'Lima', '11999887766', 18, 8, '2024-04-29', FALSE),
('Patrícia', 'Sousa', '1135678901', 20, 9, '2018-09-25', TRUE),
('Gustavo', 'Oliveira', '11987651234', 19, 10, '2024-01-05', TRUE),
('Paula', 'Sousa', '1135678901', 22, 11, '2017-08-28', TRUE),         
('Fernando', 'Machado', '11999887766', 26, 12, '2023-07-25', TRUE),
('Paula', 'Sousa', '1135678901', 27, 13, '2024-05-16', TRUE);

-- Carregamento de Contas Bancárias:
INSERT INTO Conta_bancaria (num_conta, nome_dono, sobrenome_dono, num_tel_dono, num_roteamento, tipo_conta)
VALUES 
('123456789', 'Carolina', 'Santos', '11965437892', '111000025', 'corrente'),
('987654321', 'Marcos', 'Oliveira', '1135678901', '222110011', 'poupança'),
('555555555', 'Juliana', 'Oliveira', '11987651234', '333222111', 'corrente'),
('888888888', 'Rodrigo', 'Machado', '11987651234', '444333222', 'poupança'),
('777777777', 'Patrícia', 'Gomes', '1135678901', '555444333', 'corrente'),
('999999999', 'Gustavo', 'Oliveira', '11987651234', '666555444', 'poupança'),
('111111111', 'Camila', 'Lima', '1135678901', '777666555', 'corrente'),
('222222222', 'Victor', 'Amaral', '1976543210', '987126916', 'corrente'),
('222222221', 'João', 'Buzzo', '1976542222', '886126916', 'corrente'),
('222222223', 'Leonardo', 'Ishida', '1976540009', '081126916', 'poupança');

-- Carregamento de Comodidades:
%%sql
INSERT INTO Comodidade (nome, id_propriedade, quantidade)
VALUES 
('Wi-fi', 21, 1),
('Televisão', 21, 1),
('Ar-condicionado', 21, 1),
('Secador de cabelo', 21, 1),
('Lavadora de roupas', 21, 1),
('Wi-fi', 22, 1),
('Televisão', 22, 1),
('Netflix', 22, 1),
('Ar-condicionado', 22, 1),
('Secador de cabelo', 22, 1),
('Lavadora de roupas', 22, 1),
('Wi-fi', 25, 1),
('Televisão', 25, 1),
('Netflix', 25, 1),
('Ar-condicionado', 25, 1),
('Secador de cabelo', 25, 1),
('Lavadora de roupas', 25, 1),
('Wi-fi', 1, 1),
('Televisão', 1, 1),
('Ar-condicionado', 1, 1),
('Secador de cabelo', 1, 1),
('Lavadora de roupas', 1, 1),
('Wi-fi', 2, 1),
('Televisão', 2, 1),
('Ar-condicionado', 2, 1),
('Secador de cabelo', 2, 1),
('Lavadora de roupas', 2, 1),
('Wi-fi', 3, 1),
('Televisão', 3, 1),
('Ar-condicionado', 3, 1),
('Wi-fi', 4, 1),
('Televisão', 4, 1),
('Netflix', 4, 1),
('Ar-condicionado', 4, 1),
('Secador de cabelo', 4, 1),
('Lavadora de roupas', 4, 1),
('Wi-fi', 5, 1),
('Televisão', 5, 1),
('Ar-condicionado', 5, 1),
('Secador de cabelo', 5, 1),
('Lavadora de roupas', 5, 1),
('Wi-fi', 17, 1),
('Televisão', 17, 1),
('Netflix', 17, 1),
('Ar-condicionado', 17, 1),
('Secador de cabelo', 17, 1),
('Lavadora de roupas', 17, 1),
('Wi-fi', 18, 1),
('Televisão', 18, 1),
('Ar-condicionado', 18, 1),
('Secador de cabelo', 18, 1),
('Lavadora de roupas', 18, 1),
('Wi-fi', 20, 1),
('Televisão', 20, 1),
('Netflix', 20, 1),
('Ar-condicionado', 20, 1),
('Secador de cabelo', 20, 1),
('Lavadora de roupas', 20, 1);

-- Carregamento de Avaliações:
INSERT INTO Avaliar (nome_locatario, sobrenome_locatario, num_tel_locatario, id_prop, mensagem, hora_mensagem, nota_limpeza, nota_comunicacao, nota_localizacao, nota_valor)
VALUES 
('Bruno', 'Almeida', '1135678901', 2, NULL, '2024-01-07 15:31:43', 5, 4, 5, 5),
('Vanessa', 'Souza', '11999887766', 3, 'Gostei muito do chalé. Superou minhas expectativas! Porém, somente a limpeza deixou a desejar... O lençol estava meio sujo.', '2023-07-11 22:09:01', 2, 5, 5, 5),
('Rodrigo', 'Machado', '11987651234', 22, NULL, '2022-03-04 10:32:33', 5, 5, 5, 5),
('Patrícia', 'Sousa', '1135678901', 20, 'A casa de campo é perfeita! Recomendo a todos...', '2018-09-26 14:08:55', 5, 5, 5, 5);

-- Carregamento de Regras:
INSERT INTO Regra (nome, id_propriedade, descricao) 
VALUES
('Regra de Cancelamento', 25, 'Cancelamento gratuito até 7 dias antes da chegada'),
('Regra de Cancelamento', 17, 'Cancelamento gratuito até 7 dias antes da chegada'),
('Regra de Cancelamento', 4, 'Taxa de cancelamento de 50% se cancelado dentro de 14 dias da chegada'),
('Regra de Cancelamento', 20, 'Taxa de cancelamento de 50% se cancelado dentro de 14 dias da chegada'),
('Política de Animais de Estimação', 21, 'Animais de estimação não são permitidos'),
('Política de Animais de Estimação', 22, 'Animais de estimação são permitidos com taxa adicional'),
('Política de Animais de Estimação', 25, 'Animais de estimação são permitidos gratuitamente'),
('Política de Animais de Estimação', 1, 'Animais de estimação são permitidos com taxa adicional'),
('Política de Animais de Estimação', 2, 'Animais de estimação são permitidos com taxa adicional'),
('Política de Animais de Estimação', 3, 'Animais de estimação são permitidos com taxa adicional'),
('Política de Animais de Estimação', 4, 'Animais de estimação não são permitidos'),
('Política de Animais de Estimação', 5, 'Animais de estimação não são permitidos'),
('Política de Animais de Estimação', 17, 'Animais de estimação são permitidos com taxa adicional'),
('Política de Animais de Estimação', 18, 'Animais de estimação não são permitidos'),
('Política de Animais de Estimação', 19, 'Animais de estimação são permitidos com taxa adicional'),
('Política de Animais de Estimação', 20, 'Animais de estimação são permitidos com taxa adicional');

-- Carregamento de Pontos de Interesse:
INSERT INTO Pontos_interesse (nome, cidade, estado, pais, preco, horario_inicio, horario_encerramento) VALUES
('Parque Ibirapuera', 'São Paulo', 'São Paulo', 'Brasil', 0.00, '06:00:00', '22:00:00'),
('Museu de Arte de São Paulo (MASP)', 'São Paulo', 'São Paulo', 'Brasil', 20.00, '10:00:00', '18:00:00'),
('Cristo Redentor', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 30.00, '08:00:00', '19:00:00'),
('Pão de Açúcar', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 40.00, '08:00:00', '20:00:00'),
('Inhotim', 'Belo Horizonte', 'Minas Gerais', 'Brasil', 50.00, '09:30:00', '16:30:00'),
('Mercado Municipal de Porto Alegre', 'Porto Alegre', 'Rio Grande do Sul', 'Brasil', 0.00, '08:00:00', '18:00:00'),
('Jardim Botânico de Curitiba', 'Curitiba', 'Paraná', 'Brasil', 10.00, '09:00:00', '17:00:00'),
('Elevador Lacerda', 'Salvador', 'Bahia', 'Brasil', 5.00, '07:00:00', '22:00:00'),
('Praia de Iracema', 'Fortaleza', 'Ceará', 'Brasil', 0.00, '08:00:00', '18:00:00'),
('Recife Antigo', 'Recife', 'Pernambuco', 'Brasil', 0.00, '09:00:00', '21:00:00');
