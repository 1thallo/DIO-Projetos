-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2025-01-21 19:50:10 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE SEQUENCE sq01_tb001 START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE sq01_tb004 START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE sq01_tb008 START WITH 1 NOCACHE ORDER;

CREATE TABLE diobt016_pecas_em_os (
    id_peca          INTEGER NOT NULL,
    id_ordem_servico INTEGER NOT NULL,
    qt_peca          NUMBER NOT NULL
)
LOGGING;

ALTER TABLE diobt016_pecas_em_os ADD CONSTRAINT pk_dtiobt01 PRIMARY KEY ( id_ordem_servico,
                                                                          id_peca );

CREATE TABLE diotb001_cliente (
    id_cliente     INTEGER NOT NULL,
    no_cliente     VARCHAR2(150 CHAR) NOT NULL,
    nr_cpf_cliente CHAR(11 CHAR) NOT NULL
)
LOGGING;

ALTER TABLE diotb001_cliente ADD CONSTRAINT pk_diotb001 PRIMARY KEY ( id_cliente );

CREATE TABLE diotb002_veiculo (
    id_veiculo         INTEGER NOT NULL,
    cd_renavam         NUMBER(38) NOT NULL,
    no_marca           VARCHAR2(200) NOT NULL,
    nr_placa           VARCHAR2(10 CHAR) NOT NULL,
    an_modelo          NUMBER(4) NOT NULL,
    dt_ultima_revisao  DATE,
    dt_proxima_revisao DATE NOT NULL,
    id_cliente         INTEGER NOT NULL
)
LOGGING;

ALTER TABLE diotb002_veiculo ADD CONSTRAINT pk_diotb002 PRIMARY KEY ( id_veiculo );

CREATE TABLE diotb003_endereco_cliente (
    id_endereco_cliente INTEGER NOT NULL,
    id_cliente          INTEGER NOT NULL,
    ed_cliente          VARCHAR2(1000 CHAR) NOT NULL
)
LOGGING;

ALTER TABLE diotb003_endereco_cliente ADD CONSTRAINT pk_diotb003 PRIMARY KEY ( id_endereco_cliente,
                                                                               id_cliente );

CREATE TABLE diotb004_telefone_cliente (
    id_telefone_cliente INTEGER NOT NULL,
    id_cliente          INTEGER NOT NULL,
    nr_telefone         NUMBER(*, 0) NOT NULL,
    tp_telefone         VARCHAR2(100 CHAR) NOT NULL
)
LOGGING;

ALTER TABLE diotb004_telefone_cliente ADD CONSTRAINT pk_diotb004 PRIMARY KEY ( id_telefone_cliente,
                                                                               id_cliente );

CREATE TABLE diotb005_ordem_servico (
    id_ordem_servico INTEGER NOT NULL,
    vl_total         NUMBER(*, 2) NOT NULL,
    dt_emissao       DATE NOT NULL,
    dt_conclusãƒo    DATE NOT NULL,
    id_status        INTEGER NOT NULL,
    ic_autorizado    NUMBER NOT NULL
)
LOGGING;

ALTER TABLE diotb005_ordem_servico
    ADD CONSTRAINT cc01_diotb005 CHECK ( ic_autorizado IN ( 0, 1 ) );

COMMENT ON COLUMN diotb005_ordem_servico.vl_total IS
    'Soma das peÃ§as e serviÃ§o';

COMMENT ON COLUMN diotb005_ordem_servico.ic_autorizado IS
    ' 0 - Nao Autorizado
 1 - Autorizado';

ALTER TABLE diotb005_ordem_servico ADD CONSTRAINT pk_diotb005 PRIMARY KEY ( id_ordem_servico );

CREATE TABLE diotb006_mecanico (
    cd_mecanico INTEGER NOT NULL,
    no_mecanico VARCHAR2(250 CHAR) NOT NULL,
    id_equipe   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE diotb006_mecanico ADD CONSTRAINT pk_diotb006 PRIMARY KEY ( cd_mecanico );

CREATE TABLE diotb007_endereco_mecanico (
    id_endereco_mecanico INTEGER NOT NULL,
    cd_mecanico          INTEGER NOT NULL,
    ed_mecanico          VARCHAR2(2000 CHAR) NOT NULL
)
LOGGING;

COMMENT ON COLUMN diotb007_endereco_mecanico.cd_mecanico IS
    'CÃ³digo do mecÃ¢nico';

COMMENT ON COLUMN diotb007_endereco_mecanico.ed_mecanico IS
    'EndereÃ§o do mecÃ¢nico';

ALTER TABLE diotb007_endereco_mecanico ADD CONSTRAINT pk_diotb007 PRIMARY KEY ( id_endereco_mecanico,
                                                                                cd_mecanico );

CREATE TABLE diotb008_especialidade (
    id_especialidade INTEGER NOT NULL,
    no_especialidade VARCHAR2(200 CHAR) NOT NULL,
    ds_especialidade VARCHAR2(2000 CHAR)
)
LOGGING;

ALTER TABLE diotb008_especialidade ADD CONSTRAINT pk_diotb008 PRIMARY KEY ( id_especialidade );

CREATE TABLE diotb009_status (
    id_status INTEGER NOT NULL,
    no_status VARCHAR2(100 CHAR) NOT NULL,
    ds_status VARCHAR2(200 CHAR)
)
LOGGING;

ALTER TABLE diotb009_status ADD CONSTRAINT pk_diotb009 PRIMARY KEY ( id_status );

CREATE TABLE diotb010_equipe (
    id_equipe INTEGER NOT NULL,
    no_equipe VARCHAR2(150 CHAR) NOT NULL,
    ds_equipe VARCHAR2(250 CHAR)
)
LOGGING;

ALTER TABLE diotb010_equipe ADD CONSTRAINT pk_diotb010 PRIMARY KEY ( id_equipe );

CREATE TABLE diotb011_servico (
    id_servico     INTEGER NOT NULL,
    no_servico     VARCHAR2(250 CHAR) NOT NULL,
    id_mao_de_obra INTEGER NOT NULL,
    ds_servico     VARCHAR2(2000 CHAR)
)
LOGGING;

ALTER TABLE diotb011_servico ADD CONSTRAINT pk_diotb011 PRIMARY KEY ( id_servico );

CREATE TABLE diotb012_servico_os (
    id_ordem_servico INTEGER NOT NULL,
    id_servico       INTEGER NOT NULL,
    id_avaliacao     INTEGER NOT NULL
)
LOGGING;

ALTER TABLE diotb012_servico_os ADD CONSTRAINT pk_diotb012 PRIMARY KEY ( id_ordem_servico,
                                                                         id_servico );

CREATE TABLE diotb013_avaliacao (
    id_avaliacao INTEGER NOT NULL,
    id_veiculo   INTEGER NOT NULL,
    id_equipe    INTEGER NOT NULL,
    dt_avaliacao DATE NOT NULL
)
LOGGING;

ALTER TABLE diotb013_avaliacao ADD CONSTRAINT pk_diotb013 PRIMARY KEY ( id_avaliacao );

CREATE TABLE diotb014_mecanico_especialidade (
    id_especialidade            INTEGER NOT NULL,
    cd_mecanico                 INTEGER NOT NULL,
    dt_conclusao_especializacao DATE NOT NULL
)
LOGGING;

ALTER TABLE diotb014_mecanico_especialidade ADD CONSTRAINT pk_diotb014 PRIMARY KEY ( id_especialidade,
                                                                                     cd_mecanico );

CREATE TABLE diotb015_peca (
    id_peca     INTEGER NOT NULL,
    no_peca     VARCHAR2(250 CHAR) NOT NULL,
    vl_unitario NUMBER(*, 2) NOT NULL,
    ds_peca     VARCHAR2(1000 CHAR)
)
LOGGING;

ALTER TABLE diotb015_peca ADD CONSTRAINT pk_diotb015 PRIMARY KEY ( id_peca );

CREATE TABLE diotb016_mao_de_obra (
    id_mao_de_obra INTEGER NOT NULL,
    vl_mao_de_obra FLOAT(*) NOT NULL
)
LOGGING;

ALTER TABLE diotb016_mao_de_obra ADD CONSTRAINT pk_diotb016 PRIMARY KEY ( id_mao_de_obra );

ALTER TABLE diotb002_veiculo
    ADD CONSTRAINT fk01_diotb002_diotb001 FOREIGN KEY ( id_cliente )
        REFERENCES diotb001_cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE diotb004_telefone_cliente
    ADD CONSTRAINT fk01_diotb004_diotb001 FOREIGN KEY ( id_cliente )
        REFERENCES diotb001_cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE diotb005_ordem_servico
    ADD CONSTRAINT fk01_diotb005_diotb009 FOREIGN KEY ( id_status )
        REFERENCES diotb009_status ( id_status )
    NOT DEFERRABLE;

ALTER TABLE diotb007_endereco_mecanico
    ADD CONSTRAINT fk01_diotb007_diotb006 FOREIGN KEY ( cd_mecanico )
        REFERENCES diotb006_mecanico ( cd_mecanico )
    NOT DEFERRABLE;

ALTER TABLE diotb012_servico_os
    ADD CONSTRAINT fk01_diotb012_diotb005 FOREIGN KEY ( id_ordem_servico )
        REFERENCES diotb005_ordem_servico ( id_ordem_servico )
    NOT DEFERRABLE;

ALTER TABLE diotb013_avaliacao
    ADD CONSTRAINT fk01_diotb013_diotb002 FOREIGN KEY ( id_veiculo )
        REFERENCES diotb002_veiculo ( id_veiculo )
    NOT DEFERRABLE;

ALTER TABLE diotb014_mecanico_especialidade
    ADD CONSTRAINT fk01_diotb014_diotb008 FOREIGN KEY ( id_especialidade )
        REFERENCES diotb008_especialidade ( id_especialidade )
    NOT DEFERRABLE;

ALTER TABLE diobt016_pecas_em_os
    ADD CONSTRAINT fk01_dtiobt01_diotb015 FOREIGN KEY ( id_peca )
        REFERENCES diotb015_peca ( id_peca )
    NOT DEFERRABLE;

ALTER TABLE diotb003_endereco_cliente
    ADD CONSTRAINT fk02_diotb003_diotb001 FOREIGN KEY ( id_cliente )
        REFERENCES diotb001_cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE diotb006_mecanico
    ADD CONSTRAINT fk02_diotb006_diotb010 FOREIGN KEY ( id_equipe )
        REFERENCES diotb010_equipe ( id_equipe )
    NOT DEFERRABLE;

ALTER TABLE diotb011_servico
    ADD CONSTRAINT fk02_diotb011_diotb016 FOREIGN KEY ( id_mao_de_obra )
        REFERENCES diotb016_mao_de_obra ( id_mao_de_obra )
    NOT DEFERRABLE;

ALTER TABLE diotb012_servico_os
    ADD CONSTRAINT fk02_diotb012_tb011_se FOREIGN KEY ( id_servico )
        REFERENCES diotb011_servico ( id_servico )
    NOT DEFERRABLE;

ALTER TABLE diotb013_avaliacao
    ADD CONSTRAINT fk02_diotb013_diotb010 FOREIGN KEY ( id_equipe )
        REFERENCES diotb010_equipe ( id_equipe )
    NOT DEFERRABLE;

ALTER TABLE diotb014_mecanico_especialidade
    ADD CONSTRAINT fk02_diotb014_diotb006 FOREIGN KEY ( cd_mecanico )
        REFERENCES diotb006_mecanico ( cd_mecanico )
    NOT DEFERRABLE;

ALTER TABLE diobt016_pecas_em_os
    ADD CONSTRAINT fk02_dtiobt01_diotb005 FOREIGN KEY ( id_ordem_servico )
        REFERENCES diotb005_ordem_servico ( id_ordem_servico )
    NOT DEFERRABLE;

ALTER TABLE diotb012_servico_os
    ADD CONSTRAINT fk03_diotb012_diotb013 FOREIGN KEY ( id_avaliacao )
        REFERENCES diotb013_avaliacao ( id_avaliacao )
    NOT DEFERRABLE;

CREATE SEQUENCE sq01_diotb001 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb001 BEFORE
    INSERT ON diotb001_cliente
    FOR EACH ROW
    WHEN ( new.id_cliente IS NULL )
BEGIN
    :new.id_cliente := sq01_diotb001.nextval;
END;
/

CREATE OR REPLACE TRIGGER tr01_diotb001 BEFORE
    INSERT ON diotb002_veiculo
    FOR EACH ROW
    WHEN ( new.id_veiculo IS NULL )
BEGIN
    :new.id_veiculo := sq01_diotb001.nextval;
END;
/

CREATE SEQUENCE sq01_diotb003 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb003 BEFORE
    INSERT ON diotb003_endereco_cliente
    FOR EACH ROW
    WHEN ( new.id_endereco_cliente IS NULL )
BEGIN
    :new.id_endereco_cliente := sq01_diotb003.nextval;
END;
/

CREATE SEQUENCE sq01_diotb004 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb004 BEFORE
    INSERT ON diotb004_telefone_cliente
    FOR EACH ROW
    WHEN ( new.id_telefone_cliente IS NULL )
BEGIN
    :new.id_telefone_cliente := sq01_diotb004.nextval;
END;
/

CREATE SEQUENCE sq01_diotb005 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb005 BEFORE
    INSERT ON diotb005_ordem_servico
    FOR EACH ROW
    WHEN ( new.id_ordem_servico IS NULL )
BEGIN
    :new.id_ordem_servico := sq01_diotb005.nextval;
END;
/

CREATE SEQUENCE sq01_diotb006 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb006 BEFORE
    INSERT ON diotb006_mecanico
    FOR EACH ROW
    WHEN ( new.cd_mecanico IS NULL )
BEGIN
    :new.cd_mecanico := sq01_diotb006.nextval;
END;
/

CREATE SEQUENCE sq01_diotb007 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb007 BEFORE
    INSERT ON diotb007_endereco_mecanico
    FOR EACH ROW
    WHEN ( new.id_endereco_mecanico IS NULL )
BEGIN
    :new.id_endereco_mecanico := sq01_diotb007.nextval;
END;
/

CREATE SEQUENCE sq01_diotb008 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb008 BEFORE
    INSERT ON diotb008_especialidade
    FOR EACH ROW
    WHEN ( new.id_especialidade IS NULL )
BEGIN
    :new.id_especialidade := sq01_diotb008.nextval;
END;
/

CREATE SEQUENCE sq01_diotb009 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb009 BEFORE
    INSERT ON diotb009_status
    FOR EACH ROW
    WHEN ( new.id_status IS NULL )
BEGIN
    :new.id_status := sq01_diotb009.nextval;
END;
/

CREATE SEQUENCE sq01_diotb010 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb010 BEFORE
    INSERT ON diotb010_equipe
    FOR EACH ROW
    WHEN ( new.id_equipe IS NULL )
BEGIN
    :new.id_equipe := sq01_diotb010.nextval;
END;
/

CREATE SEQUENCE sq01_diotb011 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb011 BEFORE
    INSERT ON diotb011_servico
    FOR EACH ROW
    WHEN ( new.id_servico IS NULL )
BEGIN
    :new.id_servico := sq01_diotb011.nextval;
END;
/

CREATE SEQUENCE sq01_diotb013 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb013 BEFORE
    INSERT ON diotb013_avaliacao
    FOR EACH ROW
    WHEN ( new.id_avaliacao IS NULL )
BEGIN
    :new.id_avaliacao := sq01_diotb013.nextval;
END;
/

CREATE SEQUENCE sq01_diotb015 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb015 BEFORE
    INSERT ON diotb015_peca
    FOR EACH ROW
    WHEN ( new.id_peca IS NULL )
BEGIN
    :new.id_peca := sq01_diotb015.nextval;
END;
/

CREATE SEQUENCE sq01_diotb016 START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr01_diotb016 BEFORE
    INSERT ON diotb016_mao_de_obra
    FOR EACH ROW
    WHEN ( new.id_mao_de_obra IS NULL )
BEGIN
    :new.id_mao_de_obra := sq01_diotb016.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          14
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         16
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
