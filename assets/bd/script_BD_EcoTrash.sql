
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
                dsCidade VARCHAR(20) NOT NULL,
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

CREATE SEQUENCE organizacao_idorganizacao_seq;

CREATE TABLE organizacao (
                idOrganizacao INTEGER NOT NULL DEFAULT nextval('organizacao_idorganizacao_seq'),
                cnpj VARCHAR(14) NOT NULL,
                razaoSocial VARCHAR(40) NOT NULL,
                nomeFantasia VARCHAR(40),
                idUsuario INTEGER NOT NULL,
                CONSTRAINT idorganizacaopk PRIMARY KEY (idOrganizacao)
);
COMMENT ON TABLE organizacao IS 'Tabela para armazenar os dados das empresas parceiras.
Obs.: A Tabela não esta totalmente normalizada para evitar complexidade desnecessaria, foi criada a coluna de idOrganizacao para evitar a necessidade de se utilizar o cnpj como pk.';
COMMENT ON COLUMN organizacao.idOrganizacao IS 'Pk da tabela';
COMMENT ON COLUMN organizacao.cnpj IS 'Coluna contendo o cnpj da empresa';
COMMENT ON COLUMN organizacao.razaoSocial IS 'Coluna contendo a razao social da empresa';
COMMENT ON COLUMN organizacao.nomeFantasia IS 'Coluna contendo o nome fantasia da organizacao';
COMMENT ON COLUMN organizacao.idUsuario IS 'Pk da tabela';


ALTER SEQUENCE organizacao_idorganizacao_seq OWNED BY organizacao.idOrganizacao;

CREATE SEQUENCE tipos_materiais_idtipomaterial_seq;

CREATE TABLE tipos_materiais (
                idTipoMaterial INTEGER NOT NULL DEFAULT nextval('tipos_materiais_idtipomaterial_seq'),
                dsTipoMaterial VARCHAR(10) NOT NULL,
                idOrganizacao INTEGER NOT NULL,
                CONSTRAINT idtiposmateriaispk PRIMARY KEY (idTipoMaterial)
);
COMMENT ON TABLE tipos_materiais IS 'Tabela para armazenar os tipos de materiais reciclaveis';
COMMENT ON COLUMN tipos_materiais.idTipoMaterial IS 'Pk da tabela';
COMMENT ON COLUMN tipos_materiais.dsTipoMaterial IS 'Coluna para armazenar o nome do material';
COMMENT ON COLUMN tipos_materiais.idOrganizacao IS 'Pk da tabela';


ALTER SEQUENCE tipos_materiais_idtipomaterial_seq OWNED BY tipos_materiais.idTipoMaterial;

CREATE SEQUENCE itens_coleta_iditemcoleta_seq;

CREATE TABLE itens_coleta (
                idItemColeta INTEGER NOT NULL DEFAULT nextval('itens_coleta_iditemcoleta_seq'),
                idTipoMaterial INTEGER NOT NULL,
                CONSTRAINT iditenscoletapk PRIMARY KEY (idItemColeta)
);
COMMENT ON TABLE itens_coleta IS 'Tabela para guardar os tipos de materiais de cada coleta';
COMMENT ON COLUMN itens_coleta.idItemColeta IS 'Pk da tabela';
COMMENT ON COLUMN itens_coleta.idTipoMaterial IS 'Pk da tabela';


ALTER SEQUENCE itens_coleta_iditemcoleta_seq OWNED BY itens_coleta.idItemColeta;

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
                complemento VARCHAR(20),
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

CREATE SEQUENCE cidadao_idcidadao_seq;

CREATE TABLE cidadao (
                idCidadao INTEGER NOT NULL DEFAULT nextval('cidadao_idcidadao_seq'),
                cpf VARCHAR(11) NOT NULL,
                nome VARCHAR(80) NOT NULL,
                email VARCHAR(30),
                idUsuario INTEGER NOT NULL,
                CONSTRAINT idcidadaopk PRIMARY KEY (idCidadao)
);
COMMENT ON TABLE cidadao IS 'Tabela de dados dos cidadãos.Obs.: A tabela não esta totalmente normalizada para evitar complexidade desnecessaria de separar o nome e sobrenome do cliente, bem como a inclusão de idOrganizacao para evitar a complexidade de utilizar o cpf como chave primaria.';
COMMENT ON COLUMN cidadao.idCidadao IS 'Chave primaria da tabela';
COMMENT ON COLUMN cidadao.cpf IS 'Coluna para guardar o cpf do cliente sem formatacao';
COMMENT ON COLUMN cidadao.nome IS 'Coluna para guardar o nome completo do cliente';
COMMENT ON COLUMN cidadao.email IS 'Coluna para armazenar o email';
COMMENT ON COLUMN cidadao.idUsuario IS 'Pk da tabela';


ALTER SEQUENCE cidadao_idcidadao_seq OWNED BY cidadao.idCidadao;

CREATE SEQUENCE coletas_idcoleta_seq;

CREATE TABLE coletas (
                idColeta INTEGER NOT NULL DEFAULT nextval('coletas_idcoleta_seq'),
                data DATE NOT NULL,
                idCidadao INTEGER NOT NULL,
                idOrganizacao INTEGER NOT NULL,
                idItemColeta INTEGER NOT NULL,
                CONSTRAINT idcoletaspk PRIMARY KEY (idColeta)
);
COMMENT ON TABLE coletas IS 'Tabela para armazenar os dados relativos a cada coleta realizada';
COMMENT ON COLUMN coletas.idColeta IS 'Pk da tabela';
COMMENT ON COLUMN coletas.data IS 'Coluna para armazenar a data da coleta';
COMMENT ON COLUMN coletas.idCidadao IS 'Chave primaria da tabela';
COMMENT ON COLUMN coletas.idOrganizacao IS 'Pk da tabela';
COMMENT ON COLUMN coletas.idItemColeta IS 'Pk da tabela';


ALTER SEQUENCE coletas_idcoleta_seq OWNED BY coletas.idColeta;

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
                complemento VARCHAR(20),
                cep VARCHAR(8),
                idRegiao INTEGER DEFAULT 1 NOT NULL,
                sigla CHAR(2) DEFAULT BR NOT NULL,
                uf CHAR(2) DEFAULT ES NOT NULL,
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

ALTER TABLE cidadao ADD CONSTRAINT usuarios_cidadao_fk
FOREIGN KEY (idUsuario)
REFERENCES usuarios (idUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao ADD CONSTRAINT usuarios_organizacao_fk
FOREIGN KEY (idUsuario)
REFERENCES usuarios (idUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_enderecos ADD CONSTRAINT organizacao_organizacao_enderecos_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacao (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE organizacao_telefones ADD CONSTRAINT organizacao_organizacao_telefones_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacao (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tipos_materiais ADD CONSTRAINT organizacao_tipos_materiais_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacao (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE coletas ADD CONSTRAINT organizacao_coletas_fk
FOREIGN KEY (idOrganizacao)
REFERENCES organizacao (idOrganizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE itens_coleta ADD CONSTRAINT tipos_materiais_itens_coleta_fk
FOREIGN KEY (idTipoMaterial)
REFERENCES tipos_materiais (idTipoMaterial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE coletas ADD CONSTRAINT itens_coleta_coletas_fk
FOREIGN KEY (idItemColeta)
REFERENCES itens_coleta (idItemColeta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_enderecos ADD CONSTRAINT cidadao_cidadao_enderecos_fk
FOREIGN KEY (idCidadao)
REFERENCES cidadao (idCidadao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cidadao_telefones ADD CONSTRAINT cidadao_cidadao_telefones_fk
FOREIGN KEY (idCidadao)
REFERENCES cidadao (idCidadao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE coletas ADD CONSTRAINT cidadao_coletas_fk
FOREIGN KEY (idCidadao)
REFERENCES cidadao (idCidadao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
