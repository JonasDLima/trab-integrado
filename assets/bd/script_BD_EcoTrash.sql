
CREATE SEQUENCE tipos_materiais_idtipomaterial_seq;

CREATE TABLE tipos_materiais (
                idTipoMaterial INTEGER NOT NULL DEFAULT nextval('tipos_materiais_idtipomaterial_seq'),
                dsTipoMaterial VARCHAR(20) NOT NULL,
                CONSTRAINT idtipomaterialpk PRIMARY KEY (idTipoMaterial)
);
COMMENT ON TABLE tipos_materiais IS 'Tabela para armazenar os tipos de materias reciclaveis';
COMMENT ON COLUMN tipos_materiais.idTipoMaterial IS 'Pk da tabela';
COMMENT ON COLUMN tipos_materiais.dsTipoMaterial IS 'Nome do material';


ALTER SEQUENCE tipos_materiais_idtipomaterial_seq OWNED BY tipos_materiais.idTipoMaterial;

CREATE SEQUENCE regioes_idregiao_seq;

CREATE TABLE regioes (
                idRegiao INTEGER NOT NULL DEFAULT nextval('regioes_idregiao_seq'),
                dsRegiao VARCHAR(20) NOT NULL,
                CONSTRAINT idregiaopk PRIMARY KEY (idRegiao)
);
COMMENT ON TABLE regioes IS 'Tabela para armazenar as regioes de maneira global';
COMMENT ON COLUMN regioes.idRegiao IS 'Pk da tabela';
COMMENT ON COLUMN regioes.dsRegiao IS 'Coluna para guardar o nome da região';


ALTER SEQUENCE regioes_idregiao_seq OWNED BY regioes.idRegiao;

CREATE TABLE paises (
                sigla CHAR(2) NOT NULL,
                dsPais VARCHAR(20) NOT NULL,
                idRegiao INTEGER NOT NULL,
                CONSTRAINT idpais PRIMARY KEY (sigla)
);
COMMENT ON TABLE paises IS 'Tabela para armazenar os paises relacionados a uma regiao';
COMMENT ON COLUMN paises.sigla IS 'Coluna contendo a sigla do pais';
COMMENT ON COLUMN paises.dsPais IS 'Coluna para guardar o nome do pais';
COMMENT ON COLUMN paises.idRegiao IS 'Pk da tabela';


CREATE TABLE unidades_federativas (
                uf CHAR(2) NOT NULL,
                dsUnidadeFederativa VARCHAR(20) NOT NULL,
                sigla CHAR(2) NOT NULL,
                CONSTRAINT idunidadefederativa PRIMARY KEY (uf)
);
COMMENT ON TABLE unidades_federativas IS 'Tabela para armazenar as ciglas e o nome dos estados';
COMMENT ON COLUMN unidades_federativas.uf IS 'Coluna para armazenar a cigla do unidade federativa';
COMMENT ON COLUMN unidades_federativas.dsUnidadeFederativa IS 'Coluna para o nome da unidade federativa';
COMMENT ON COLUMN unidades_federativas.sigla IS 'Coluna contendo a sigla do pais';


CREATE SEQUENCE cidades_idcidade_seq;

CREATE TABLE cidades (
                idCidade INTEGER NOT NULL DEFAULT nextval('cidades_idcidade_seq'),
                dsCidade VARCHAR(40) NOT NULL,
                uf CHAR(2) NOT NULL,
                CONSTRAINT idcidadepk PRIMARY KEY (idCidade)
);
COMMENT ON TABLE cidades IS 'Tabela para armazenar as cidades relacionadas a um estado';
COMMENT ON COLUMN cidades.idCidade IS 'Pk da tabela';
COMMENT ON COLUMN cidades.dsCidade IS 'Coluna contendo o nome da cidade';
COMMENT ON COLUMN cidades.uf IS 'Coluna para armazenar a cigla do unidade federativa';


ALTER SEQUENCE cidades_idcidade_seq OWNED BY cidades.idCidade;

CREATE SEQUENCE bairros_idbairro_seq;

CREATE TABLE bairros (
                idBairro INTEGER NOT NULL DEFAULT nextval('bairros_idbairro_seq'),
                dsBairro VARCHAR(20) NOT NULL,
                idCidade INTEGER NOT NULL,
                CONSTRAINT idbairropk PRIMARY KEY (idBairro)
);
COMMENT ON TABLE bairros IS 'Tabela para armazenar os bairros relacionados a determinada cidade';
COMMENT ON COLUMN bairros.idBairro IS 'Pk da tabela';
COMMENT ON COLUMN bairros.dsBairro IS 'Coluna para guardar o nome do bairro';
COMMENT ON COLUMN bairros.idCidade IS 'Pk da tabela';


ALTER SEQUENCE bairros_idbairro_seq OWNED BY bairros.idBairro;

CREATE SEQUENCE logradouros_idlogradouro_seq;

CREATE TABLE logradouros (
                idLogradouro INTEGER NOT NULL DEFAULT nextval('logradouros_idlogradouro_seq'),
                dsLogradouro VARCHAR(40) NOT NULL,
                idBairro INTEGER NOT NULL,
                CONSTRAINT idlogradouropk PRIMARY KEY (idLogradouro)
);
COMMENT ON TABLE logradouros IS 'Tabela para guardar o nome das ruas, avenidas, ladeiras e etc..
que compoem um endereco';
COMMENT ON COLUMN logradouros.idLogradouro IS 'Pk da tabela';
COMMENT ON COLUMN logradouros.dsLogradouro IS 'Coluna para armazenar o nome do logradouro';
COMMENT ON COLUMN logradouros.idBairro IS 'Pk da tabela';


ALTER SEQUENCE logradouros_idlogradouro_seq OWNED BY logradouros.idLogradouro;

CREATE SEQUENCE usuarios_idusuario_seq;

CREATE TABLE usuarios (
                idUsuario INTEGER NOT NULL DEFAULT nextval('usuarios_idusuario_seq'),
                login VARCHAR(10) NOT NULL,
                senha VARCHAR(20) NOT NULL,
                CONSTRAINT idusuariospk PRIMARY KEY (idUsuario)
);
COMMENT ON TABLE usuarios IS 'Tabela para armazenar os dados de acesso dos usuarios';
COMMENT ON COLUMN usuarios.idUsuario IS 'Pk da tabela';
COMMENT ON COLUMN usuarios.login IS 'Coluna para armazenar o login do usuario';
COMMENT ON COLUMN usuarios.senha IS 'Coluna para armazenar a senha criptografada';


ALTER SEQUENCE usuarios_idusuario_seq OWNED BY usuarios.idUsuario;

CREATE SEQUENCE organizacoes_idorganizacao_seq;

CREATE TABLE organizacoes (
                idOrganizacao INTEGER NOT NULL DEFAULT nextval('organizacoes_idorganizacao_seq'),
                cnpj VARCHAR(14) NOT NULL,
                razaoSocial VARCHAR(40) NOT NULL,
                nomeFantasia VARCHAR(40),
                idUsuario INTEGER,
                CONSTRAINT idorganizacaopk PRIMARY KEY (idOrganizacao)
);
COMMENT ON TABLE organizacoes IS 'Tabela para armazenar os dados das empresas parceiras.
Obs.: A Tabela não esta totalmente normalizada para evitar complexidade desnecessaria, foi criada a coluna de idOrganizacao para evitar a necessidade de se utilizar o cnpj como pk.';
COMMENT ON COLUMN organizacoes.idOrganizacao IS 'Pk da tabela';
COMMENT ON COLUMN organizacoes.cnpj IS 'Coluna contendo o cnpj da empresa';
COMMENT ON COLUMN organizacoes.razaoSocial IS 'Coluna contendo a razao social da empresa';
COMMENT ON COLUMN organizacoes.nomeFantasia IS 'Coluna contendo o nome fantasia da organizacao';
COMMENT ON COLUMN organizacoes.idUsuario IS 'Pk da tabela';


ALTER SEQUENCE organizacoes_idorganizacao_seq OWNED BY organizacoes.idOrganizacao;

CREATE SEQUENCE tipos_materiais_organizacao_idtipomaterialorganizacao_seq;

CREATE TABLE tipos_materiais_organizacao (
                idTipoMaterialOrganizacao INTEGER NOT NULL DEFAULT nextval('tipos_materiais_organizacao_idtipomaterialorganizacao_seq'),
                idOrganizacao INTEGER NOT NULL,
                idTipoMaterial INTEGER NOT NULL,
                CONSTRAINT idtipomateriaisorganizacaopk PRIMARY KEY (idTipoMaterialOrganizacao, idOrganizacao)
);
COMMENT ON TABLE tipos_materiais_organizacao IS 'Tabela para armazenar os tipos de materiais que a organizacao trata';
COMMENT ON COLUMN tipos_materiais_organizacao.idTipoMaterialOrganizacao IS 'Pk da tabela';
COMMENT ON COLUMN tipos_materiais_organizacao.idOrganizacao IS 'Pk da tabela';
COMMENT ON COLUMN tipos_materiais_organizacao.idTipoMaterial IS 'Pk da tabela';


ALTER SEQUENCE tipos_materiais_organizacao_idtipomaterialorganizacao_seq OWNED BY tipos_materiais_organizacao.idTipoMaterialOrganizacao;

CREATE SEQUENCE organizacao_telefones_idorganizacaotelefone_seq;

CREATE TABLE organizacao_telefones (
                idOrganizacaoTelefone INTEGER NOT NULL DEFAULT nextval('organizacao_telefones_idorganizacaotelefone_seq'),
                idOrganizacao INTEGER NOT NULL,
                telefone VARCHAR(20) NOT NULL,
                CONSTRAINT idorganizacaotelefones PRIMARY KEY (idOrganizacaoTelefone, idOrganizacao)
);
COMMENT ON TABLE organizacao_telefones IS 'Tabela para guardar os telefones para contato da organizacao';
COMMENT ON COLUMN organizacao_telefones.idOrganizacaoTelefone IS 'Pk da tabela';
COMMENT ON COLUMN organizacao_telefones.idOrganizacao IS 'Pk da tabela';
COMMENT ON COLUMN organizacao_telefones.telefone IS 'Coluna para armazenar o telefone';


ALTER SEQUENCE organizacao_telefones_idorganizacaotelefone_seq OWNED BY organizacao_telefones.idOrganizacaoTelefone;

CREATE SEQUENCE organizacao_enderecos_idorganizacao_seq;

CREATE TABLE organizacao_enderecos (
                idOrganizacaoEndereco INTEGER NOT NULL DEFAULT nextval('organizacao_enderecos_idorganizacao_seq'),
                idOrganizacao INTEGER NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR(40),
                cep VARCHAR(8),
                idRegiao INTEGER NOT NULL,
                sigla CHAR(2) NOT NULL,
                uf CHAR(2) NOT NULL,
                idCidade INTEGER NOT NULL,
                idBairro INTEGER NOT NULL,
                idLogradouro INTEGER NOT NULL,
                CONSTRAINT idorganizacaoenderecospk PRIMARY KEY (idOrganizacaoEndereco, idOrganizacao)
);
COMMENT ON TABLE organizacao_enderecos IS 'Tabela contendo os enderecos das organizacoes';
COMMENT ON COLUMN organizacao_enderecos.idOrganizacaoEndereco IS 'Pk da tabela';
COMMENT ON COLUMN organizacao_enderecos.idOrganizacao IS 'Pk da tabela';
COMMENT ON COLUMN organizacao_enderecos.numero IS 'Coluna para armazenar o numero da sede da empresa';
COMMENT ON COLUMN organizacao_enderecos.complemento IS 'Coluna para armazenar pontos de referência para encontrar a empresa';
COMMENT ON COLUMN organizacao_enderecos.cep IS 'Coluna para armazenar o cep do endereco da empresa';
COMMENT ON COLUMN organizacao_enderecos.idRegiao IS 'Pk da tabela';
COMMENT ON COLUMN organizacao_enderecos.sigla IS 'Coluna contendo a sigla do pais';
COMMENT ON COLUMN organizacao_enderecos.uf IS 'Coluna para armazenar a cigla do unidade federativa';
COMMENT ON COLUMN organizacao_enderecos.idCidade IS 'Pk da tabela';
COMMENT ON COLUMN organizacao_enderecos.idBairro IS 'Pk da tabela';
COMMENT ON COLUMN organizacao_enderecos.idLogradouro IS 'Pk da tabela';


ALTER SEQUENCE organizacao_enderecos_idorganizacao_seq OWNED BY organizacao_enderecos.idOrganizacaoEndereco;

CREATE SEQUENCE cidadaos_idcidadao_seq;

CREATE TABLE cidadaos (
                idCidadao INTEGER NOT NULL DEFAULT nextval('cidadaos_idcidadao_seq'),
                cpf VARCHAR(11) NOT NULL,
                nome VARCHAR(80) NOT NULL,
                email VARCHAR(30),
                idUsuario INTEGER,
                CONSTRAINT idcidadaopk PRIMARY KEY (idCidadao)
);
COMMENT ON TABLE cidadaos IS 'Tabela de dados dos cidadãos.Obs.: A tabela não esta totalmente normalizada para evitar complexidade desnecessaria de separar o nome e sobrenome do cliente, bem como a inclusão de idOrganizacao para evitar a complexidade de utilizar o cpf como chave primaria.';
COMMENT ON COLUMN cidadaos.idCidadao IS 'Chave primaria da tabela';
COMMENT ON COLUMN cidadaos.cpf IS 'Coluna para guardar o cpf do cliente sem formatacao';
COMMENT ON COLUMN cidadaos.nome IS 'Coluna para guardar o nome completo do cliente';
COMMENT ON COLUMN cidadaos.email IS 'Coluna para armazenar o email';
COMMENT ON COLUMN cidadaos.idUsuario IS 'Pk da tabela';


ALTER SEQUENCE cidadaos_idcidadao_seq OWNED BY cidadaos.idCidadao;

CREATE TABLE coletas (
                idColeta INTEGER NOT NULL,
                data DATE NOT NULL,
                idCidadao INTEGER NOT NULL,
                idOrganizacao INTEGER NOT NULL,
                CONSTRAINT idcoletaspk PRIMARY KEY (idColeta)
);
COMMENT ON TABLE coletas IS 'Tabela para armazenar os dados relativos a cada coleta realizada';
COMMENT ON COLUMN coletas.idColeta IS 'Pk da tabela';
COMMENT ON COLUMN coletas.data IS 'Coluna para armazenar a data da coleta';
COMMENT ON COLUMN coletas.idCidadao IS 'Chave primaria da tabela';
COMMENT ON COLUMN coletas.idOrganizacao IS 'Pk da tabela';


CREATE TABLE itens_coleta (
                idTipoMaterial INTEGER NOT NULL,
                idColeta INTEGER NOT NULL,
                CONSTRAINT iditenscoletapk PRIMARY KEY (idTipoMaterial, idColeta)
);
COMMENT ON TABLE itens_coleta IS 'Tabela para guardar os tipos de materiais de cada coleta';
COMMENT ON COLUMN itens_coleta.idTipoMaterial IS 'Pk da tabela';
COMMENT ON COLUMN itens_coleta.idColeta IS 'Pk da tabela';


CREATE SEQUENCE cidadao_telefones_idcidadaotelefone_seq;

CREATE TABLE cidadao_telefones (
                idCidadaoTelefone INTEGER NOT NULL DEFAULT nextval('cidadao_telefones_idcidadaotelefone_seq'),
                idCidadao INTEGER NOT NULL,
                telefone VARCHAR(20) NOT NULL,
                CONSTRAINT idcidadaotelefonespk PRIMARY KEY (idCidadaoTelefone, idCidadao)
);
COMMENT ON TABLE cidadao_telefones IS 'Tabela para armazenar os dados de contato de um cidadao';
COMMENT ON COLUMN cidadao_telefones.idCidadaoTelefone IS 'Pk da tabela';
COMMENT ON COLUMN cidadao_telefones.idCidadao IS 'Chave primaria da tabela';
COMMENT ON COLUMN cidadao_telefones.telefone IS 'Coluna para armazenar o telefone';


ALTER SEQUENCE cidadao_telefones_idcidadaotelefone_seq OWNED BY cidadao_telefones.idCidadaoTelefone;

CREATE SEQUENCE cidadao_enderecos_idcidadaoendereco_seq;

CREATE TABLE cidadao_enderecos (
                idCidadaoEndereco INTEGER NOT NULL DEFAULT nextval('cidadao_enderecos_idcidadaoendereco_seq'),
                idCidadao INTEGER NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR(40),
                cep VARCHAR(8),
                idRegiao INTEGER DEFAULT 1 NOT NULL,
                sigla CHAR(2) DEFAULT 'BR' NOT NULL,
                uf CHAR(2) DEFAULT 'ES' NOT NULL,
                idCidade INTEGER DEFAULT 1 NOT NULL,
                idBairro INTEGER NOT NULL,
                idLogradouro INTEGER NOT NULL,
                CONSTRAINT idcidadaoenderecopk PRIMARY KEY (idCidadaoEndereco, idCidadao)
);
COMMENT ON TABLE cidadao_enderecos IS 'Tabela de enderecos dos cidadaos.';
COMMENT ON COLUMN cidadao_enderecos.idCidadaoEndereco IS 'Pk da tabela';
COMMENT ON COLUMN cidadao_enderecos.idCidadao IS 'Chave primaria da tabela';
COMMENT ON COLUMN cidadao_enderecos.numero IS 'Coluna para armazenar o numero da residencia';
COMMENT ON COLUMN cidadao_enderecos.complemento IS 'Coluna para informações para facilitar a identificação da residência como: andar, bloco e algum ponto de referência próximo';
COMMENT ON COLUMN cidadao_enderecos.cep IS 'Código postal de um endereco';
COMMENT ON COLUMN cidadao_enderecos.idRegiao IS 'Pk da tabela';
COMMENT ON COLUMN cidadao_enderecos.sigla IS 'Coluna contendo a sigla do pais';
COMMENT ON COLUMN cidadao_enderecos.uf IS 'Coluna para armazenar a cigla do unidade federativa';
COMMENT ON COLUMN cidadao_enderecos.idCidade IS 'Pk da tabela';
COMMENT ON COLUMN cidadao_enderecos.idBairro IS 'Pk da tabela';
COMMENT ON COLUMN cidadao_enderecos.idLogradouro IS 'Pk da tabela';


ALTER SEQUENCE cidadao_enderecos_idcidadaoendereco_seq OWNED BY cidadao_enderecos.idCidadaoEndereco;

-- Cadastro dos dados das tabelas basicas ou dados base

INSERT INTO regioes (idRegiao, dsRegiao) VALUES (1, 'América do Sul');
INSERT INTO regioes (idRegiao, dsRegiao) VALUES (2, 'América do Norte');
INSERT INTO regioes (idRegiao, dsRegiao) VALUES (3, 'América Central');

INSERT INTO paises (sigla, dsPais, idRegiao) VALUES ('BR', 'Brasil', 1);
INSERT INTO paises (sigla, dsPais, idRegiao) VALUES ('US', 'Estados Unidos', 2);
INSERT INTO paises (sigla, dsPais, idRegiao) VALUES ('DO', 'República Dominicana', 3);

INSERT INTO unidades_federativas (uf, dsUnidadeFederativa, sigla) VALUES ('ES', 'Espirito Santo', 'BR');
INSERT INTO unidades_federativas (uf, dsUnidadeFederativa, sigla) VALUES ('DC', 'Washington', 'US');
INSERT INTO unidades_federativas (uf, dsUnidadeFederativa, sigla) VALUES ('SD', 'São Domingos', 'DO');

INSERT INTO cidades (idCidade, dsCidade, uf) VALUES (1, 'Vila Velha', 'ES');
INSERT INTO cidades (idCidade, dsCidade, uf) VALUES (2, 'Walla Walla', 'DC');
INSERT INTO cidades (idCidade, dsCidade, uf) VALUES (3, 'San Antonio de Guerra', 'SD');

INSERT INTO bairros (idBairro, dsBairro, idCidade) VALUES (1, 'Boa Vista', 1);
INSERT INTO bairros (idBairro, dsBairro, idCidade) VALUES (2, 'Capitol Hill', 2);
INSERT INTO bairros (idBairro, dsBairro, idCidade) VALUES (3, 'Hato Viejo', 3);

INSERT INTO logradouros (idLogradouro, dsLogradouro, idBairro) VALUES (
    1, 'Av. Comissário José Dantas de Melo', 1
);

INSERT INTO logradouros (idLogradouro, dsLogradouro, idBairro) VALUES (
    2, '615 Independence Ave SE', 2
);

INSERT INTO logradouros (idLogradouro, dsLogradouro, idBairro) VALUES (
    3, 'Carr. Sierra Prieta, 92000', 3
);

INSERT INTO logradouros (idLogradouro, dsLogradouro, idBairro) VALUES (
    4, 'Rua Girassol', 1
);

INSERT INTO tipos_materiais (idTipoMaterial, dsTipoMaterial) VALUES (
    1, 'Plastico'
);

INSERT INTO tipos_materiais (idTipoMaterial, dsTipoMaterial) VALUES (
    2, 'Metal'
);

INSERT INTO tipos_materiais (idTipoMaterial, dsTipoMaterial) VALUES (
    3, 'Papel'
);

INSERT INTO tipos_materiais_organizacao (idTipoMaterialOrganizacao, idOrganizacao, idTipoMaterial) VALUES (
    1, 1, 1
);

INSERT INTO tipos_materiais_organizacao (idTipoMaterialOrganizacao, idOrganizacao, idTipoMaterial) VALUES (
    2, 1, 2
);

INSERT INTO tipos_materiais_organizacao (idTipoMaterialOrganizacao, idOrganizacao, idTipoMaterial) VALUES (
    3, 1, 3
);

-- Fim dos dados basicos

-- Cadastro de cidadaos/Organizacoes

INSERT INTO cidadaos (idCidadao, cpf, nome, email) VALUES (
    1, '12345678998', 'Juquinha da Silva Cunha', 'mrCunha@gmail.com'
);

INSERT INTO cidadao_telefones (idCidadaoTelefone, idCidadao, telefone) VALUES (
    1, 1, '27994667801'
);

INSERT INTO cidadao_enderecos (
    idCidadaoEndereco, idCidadao, numero, complemento, cep, idRegiao,
    idCidade, idBairro, idLogradouro)
VALUES (
    1, 1, 21, 'Em frente ao shopping vv', '29032586', 1, 1, 1, 1
);

INSERT INTO organizacoes (idOrganizacao, cnpj, razaoSocial, nomeFantasia) VALUES (
    1, '12345678998765', 'Recicla Plus LTDA', 'Recicla+'
);

INSERT INTO organizacao_telefones (idOrganizacaoTelefone, idOrganizacao, telefone) VALUES (
    1, 1, '2732336895'
);

INSERT INTO organizacao_enderecos (
    idOrganizacaoEndereco, idOrganizacao, numero, complemento, cep, idRegiao, sigla, uf,
    idCidade, idBairro, idLogradouro)
VALUES (
    1, 1, 380, 'Proximo ao cerimonial', '29032861', 1, 'BR', 'ES', 1, 1, 4
);

-- Finalizacao de cadastros dos cidadaos/organizacoes

-- Cadastro de coletas

INSERT INTO coletas (idColeta, data, idCidadao, idOrganizacao) VALUES (
    1, '02-12-2022 00:25', 1, 1
);

INSERT INTO itens_coleta (idColeta, idTipoMaterial) VALUES (
    1, 1
);

INSERT INTO itens_coleta (idColeta, idTipoMaterial) VALUES (
    1, 2
);

INSERT INTO itens_coleta (idColeta, idTipoMaterial) VALUES (
    1, 3
);

-- Finalizacao do cadastro de coletas

ALTER TABLE tipos_materiais_organizacao ADD CONSTRAINT tipos_materiais_tipos_materiais_organizacao_fk
FOREIGN KEY (idTipoMaterial)
REFERENCES tipos_materiais (idTipoMaterial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE itens_coleta ADD CONSTRAINT tipos_materiais_itens_coleta_fk
FOREIGN KEY (idTipoMaterial)
REFERENCES tipos_materiais (idTipoMaterial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE paises ADD CONSTRAINT regioes_paises_fk
FOREIGN KEY (idRegiao)
REFERENCES regioes (idRegiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT regioes_cidadao_enderecos_fk
FOREIGN KEY (idRegiao)
REFERENCES regioes (idRegiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT regioes_organizacao_enderecos_fk
FOREIGN KEY (idRegiao)
REFERENCES regioes (idRegiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE unidades_federativas ADD CONSTRAINT paises_unidades_federativas_fk
FOREIGN KEY (sigla)
REFERENCES paises (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT paises_cidadao_enderecos_fk
FOREIGN KEY (sigla)
REFERENCES paises (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT paises_organizacao_enderecos_fk
FOREIGN KEY (sigla)
REFERENCES paises (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidades ADD CONSTRAINT unidades_federativas_cidades_fk
FOREIGN KEY (uf)
REFERENCES unidades_federativas (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT unidades_federativas_cidadao_enderecos_fk
FOREIGN KEY (uf)
REFERENCES unidades_federativas (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT unidades_federativas_organizacao_enderecos_fk
FOREIGN KEY (uf)
REFERENCES unidades_federativas (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE bairros ADD CONSTRAINT cidades_bairros_fk
FOREIGN KEY (idCidade)
REFERENCES cidades (idCidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT cidades_cidadao_enderecos_fk
FOREIGN KEY (idCidade)
REFERENCES cidades (idCidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT cidades_organizacao_enderecos_fk
FOREIGN KEY (idCidade)
REFERENCES cidades (idCidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE logradouros ADD CONSTRAINT bairros_logradouros_fk
FOREIGN KEY (idBairro)
REFERENCES bairros (idBairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT bairros_cidadao_enderecos_fk
FOREIGN KEY (idBairro)
REFERENCES bairros (idBairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT bairros_organizacao_enderecos_fk
FOREIGN KEY (idBairro)
REFERENCES bairros (idBairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT logradouros_cidadao_enderecos_fk
FOREIGN KEY (idLogradouro)
REFERENCES logradouros (idLogradouro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT logradouros_organizacao_enderecos_fk
FOREIGN KEY (idLogradouro)
REFERENCES logradouros (idLogradouro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadaos ADD CONSTRAINT usuarios_cidadao_fk
FOREIGN KEY (idUsuario)
REFERENCES usuarios (idUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacoes ADD CONSTRAINT usuarios_organizacao_fk
FOREIGN KEY (idUsuario)
REFERENCES usuarios (idUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT organizacao_organizacao_enderecos_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacoes (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_telefones ADD CONSTRAINT organizacao_organizacao_telefones_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacoes (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tipos_materiais_organizacao ADD CONSTRAINT organizacao_tipos_materiais_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacoes (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE coletas ADD CONSTRAINT organizacao_coletas_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacoes (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT cidadao_cidadao_enderecos_fk
FOREIGN KEY (idCidadao)
REFERENCES cidadaos (idCidadao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_telefones ADD CONSTRAINT cidadao_cidadao_telefones_fk
FOREIGN KEY (idCidadao)
REFERENCES cidadaos (idCidadao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE coletas ADD CONSTRAINT cidadao_coletas_fk
FOREIGN KEY (idCidadao)
REFERENCES cidadaos (idCidadao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE itens_coleta ADD CONSTRAINT coletas_itens_coleta_fk
FOREIGN KEY (idColeta)
REFERENCES coletas (idColeta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
