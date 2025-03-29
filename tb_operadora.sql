USE teste_intuitive_care

CREATE TABLE tb_operadoras_plano_de_saude (
    Registro_ANS VARCHAR(10) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL PRIMARY KEY,
    Razao_Social VARCHAR(140) NOT NULL,
    Nome_Fantasia VARCHAR(100),
    Modalidade VARCHAR(45) NOT NULL,
    Logradouro VARCHAR(120) NOT NULL,
    Numero varchar(20),
    Complemento VARCHAR(50),
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    UF VARCHAR(4) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    DDD VARCHAR(3) NOT NULL,
    Telefone varchar(20),
    Fax varchar(15),
    Endereco_eletronico VARCHAR(60),
    Representante VARCHAR(50) NOT NULL,
    Cargo_Representante VARCHAR(45) NOT NULL,
    Regiao_de_Comercializacao varchar(5),
    Data_Registro_ANS DATE NOT NULL
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Relatorio_cadop.csv'
INTO TABLE tb_operadoras_plano_de_saude
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Registro_ANS, @CNPJ, @Razao_Social, @Nome_Fantasia, @Modalidade, @Logradouro, @Numero, @Complemento,
 @Bairro, @Cidade, @UF, @CEP, @DDD, @Telefone, @Fax, @Endereco_eletronico, @Representante,
 @Cargo_Representante, @Regiao_de_Comercializacao, @Data_Registro_ANS)
SET 
    Registro_ANS = TRIM(BOTH '"' FROM @Registro_ANS),
    CNPJ = TRIM(BOTH '"' FROM @CNPJ),
    Razao_Social = TRIM(BOTH '"' FROM @Razao_Social),
    Nome_Fantasia = TRIM(BOTH '"' FROM @Nome_Fantasia),
    Modalidade = TRIM(BOTH '"' FROM @Modalidade),
    Logradouro = TRIM(BOTH '"' FROM @Logradouro),
    Numero = @Numero,
    Complemento = TRIM(BOTH '"' FROM @Complemento),
    Bairro = TRIM(BOTH '"' FROM @Bairro),
    Cidade = TRIM(BOTH '"' FROM @Cidade),
    UF = TRIM(BOTH '"' FROM @UF),
    CEP = TRIM(BOTH '"' FROM @CEP),
    DDD = TRIM(BOTH '"' FROM @DDD),
    Telefone = @Telefone,
    Fax = IF(@Fax = '', NULL, @Fax), 
    Endereco_eletronico = TRIM(BOTH '"' FROM @Endereco_eletronico),
    Representante = TRIM(BOTH '"' FROM @Representante),
    Cargo_Representante = TRIM(BOTH '"' FROM @Cargo_Representante),
    Regiao_de_Comercializacao = @Regiao_de_Comercializacao,
    Data_Registro_ANS = STR_TO_DATE(TRIM(BOTH '"' FROM @Data_Registro_ANS), '%Y-%m-%d');

SELECT * FROM tb_operadoras_plano_de_saude

