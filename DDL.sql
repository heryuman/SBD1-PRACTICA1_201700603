-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-08-25 12:15:30 CST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cpg (
    id_cla_p_g      NUMBER(10) NOT NULL,
    juego_id_juego  NUMBER(10, 2) NOT NULL,
    tbl_g_id_genero NUMBER(10) NOT NULL
);

COMMENT ON COLUMN cpg.id_cla_p_g IS
    'ID CLASIFICACION POR GENERO';

COMMENT ON COLUMN cpg.tbl_g_id_genero IS
    'id del genero que se relacionará con el jeugo';

ALTER TABLE cpg ADD CONSTRAINT cpg_pk PRIMARY KEY ( id_cla_p_g );

CREATE TABLE developer (
    id_developer NUMBER(10) NOT NULL,
    nombres      VARCHAR2(50 CHAR) NOT NULL,
    apellidos    VARCHAR2(50 CHAR) NOT NULL,
    alias        VARCHAR2(30 CHAR)
);

COMMENT ON COLUMN developer.id_developer IS
    'identificador del desarrollador';

COMMENT ON COLUMN developer.nombres IS
    'campo que almacenará el nombre o los nombres del desarrollador';

COMMENT ON COLUMN developer.apellidos IS
    'campo que almacenará los apellidos del desarrolloador';

COMMENT ON COLUMN developer.alias IS
    'campo que almacenará el alias del desarrollador';

ALTER TABLE developer ADD CONSTRAINT developer_pk PRIMARY KEY ( id_developer );

CREATE TABLE dsp (
    id_desarrollo          NUMBER(10) NOT NULL,
    juego_id_juego         NUMBER(10, 2) NOT NULL,
    developer_id_developer NUMBER(10) NOT NULL
);

COMMENT ON COLUMN dsp.id_desarrollo IS
    'campo que sirve como identificador del desarrollo ';

COMMENT ON COLUMN dsp.juego_id_juego IS
    'id del juego que relacionará con el dev que lo desarrolló';

COMMENT ON COLUMN dsp.developer_id_developer IS
    'id del dev que dearrollo el juego';

ALTER TABLE dsp ADD CONSTRAINT dsp_pk PRIMARY KEY ( id_desarrollo );

CREATE TABLE juego (
    id_juego         NUMBER(10, 2) NOT NULL,
    nombre_completo  VARCHAR2(100 CHAR) NOT NULL,
    des_cort         VARCHAR2(100 CHAR),
    des_detalle      VARCHAR2(100 CHAR),
    fecha_lanzamient DATE NOT NULL,
    precio_venta     NUMBER(7, 2) NOT NULL
);

COMMENT ON COLUMN juego.id_juego IS
    'clave que identificará a un juego ';

COMMENT ON COLUMN juego.nombre_completo IS
    'columna qu econtrendra el nombre completo del juego';

COMMENT ON COLUMN juego.des_cort IS
    'columna que contendra la descripcion corta del juego';

COMMENT ON COLUMN juego.des_detalle IS
    'contiene la descripcion detallada del juego';

COMMENT ON COLUMN juego.fecha_lanzamient IS
    'fecha de lanzamiento del juego';

COMMENT ON COLUMN juego.precio_venta IS
    'precio de venta del juego';

ALTER TABLE juego ADD CONSTRAINT juego_pk PRIMARY KEY ( id_juego );

CREATE TABLE pc (
    id_acc          NUMBER(10) NOT NULL,
    usuario_id_user NUMBER(10) NOT NULL,
    card_number     NUMBER(16) NOT NULL,
    nombre          VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON TABLE pc IS
    'esta tabla contendra información de la tarjeta de credito del cliente';

COMMENT ON COLUMN pc.id_acc IS
    'EL id que identifica el ingreso de una tarjeta de Add Credit Card';

COMMENT ON COLUMN pc.usuario_id_user IS
    'identificador  del ';

ALTER TABLE pc ADD CONSTRAINT pc_pk PRIMARY KEY ( id_acc );

CREATE TABLE rol (
    id_rol NUMBER(10) NOT NULL,
    rol    VARCHAR2(20 CHAR)
);

COMMENT ON COLUMN rol.id_rol IS
    'clave del rol';

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE tbl_bl (
    id_tb           NUMBER(10) NOT NULL,
    id_juego        NUMBER(10),
    calificacion    NUMBER(1),
    usuario_id_user NUMBER(10) NOT NULL,
    tbl_c_id_compra NUMBER(10) NOT NULL
);

COMMENT ON COLUMN tbl_bl.id_tb IS
    'clave que identifica la transaccion de la biblitoteca';

COMMENT ON COLUMN tbl_bl.id_juego IS
    'id que relaciona al juego comprado dentro de la biblioteca del usuario';

COMMENT ON COLUMN tbl_bl.calificacion IS
    'campo que almacena la calificacion que el usuario puede darle al juego luego de comprarlo';

COMMENT ON COLUMN tbl_bl.usuario_id_user IS
    'clave que identifa a que usuario pertnece el la biblioteca';

COMMENT ON COLUMN tbl_bl.tbl_c_id_compra IS
    'clave que identifica en que compra se adquirió el jeugo';

ALTER TABLE tbl_bl ADD CONSTRAINT tbl_bl_pk PRIMARY KEY ( id_tb );

CREATE TABLE tbl_c (
    id_compra        NUMBER(10) NOT NULL,
    total            NUMBER(10),
    usuario_id_user  NUMBER(10) NOT NULL,
    fecha_compra     DATE NOT NULL,
    tbl_pt_id_pmt_tp NUMBER(10) NOT NULL
);

COMMENT ON COLUMN tbl_c.id_compra IS
    'identificador de la compra';

COMMENT ON COLUMN tbl_c.total IS
    'totall de la compra';

COMMENT ON COLUMN tbl_c.usuario_id_user IS
    'identificador del usuario que realizó la compra';

COMMENT ON COLUMN tbl_c.fecha_compra IS
    'fecha de realización de la compra';

COMMENT ON COLUMN tbl_c.tbl_pt_id_pmt_tp IS
    'identificador del tipo de pago realizado por el cliente';

ALTER TABLE tbl_c ADD CONSTRAINT tbl_c_pk PRIMARY KEY ( id_compra );

CREATE TABLE tbl_cl (
    id_clasificacion   NUMBER(10) NOT NULL,
    clasificacion      VARCHAR2(25 CHAR) NOT NULL,
    edad_clasificacion NUMBER(2) NOT NULL,
    juego_id_juego     NUMBER(10, 2) NOT NULL
);

COMMENT ON TABLE tbl_cl IS
    'esta tabla contendra las distintas clasificaciones en las que un juego estára';

ALTER TABLE tbl_cl ADD CONSTRAINT tbl_cl_pk PRIMARY KEY ( id_clasificacion );

CREATE TABLE tbl_dc (
    id_transaccion  NUMBER(10) NOT NULL,
    tbl_c_id_compra NUMBER(10) NOT NULL,
    juego_id_juego  NUMBER(10, 2) NOT NULL,
    descuento       NUMBER(5, 2),
    precio_juego    NUMBER(10, 2)
);

COMMENT ON COLUMN tbl_dc.id_transaccion IS
    'Clave que almacenará la transacción realizada ';

COMMENT ON COLUMN tbl_dc.tbl_c_id_compra IS
    'clave que identificará la compra realizada ';

COMMENT ON COLUMN tbl_dc.juego_id_juego IS
    'identificador del juego que se agregará al detalle de compra';

COMMENT ON COLUMN tbl_dc.descuento IS
    'porcentaje de descuento que se le aplicará o no al precio del juego en caso tenga una promoción';

COMMENT ON COLUMN tbl_dc.precio_juego IS
    'PRECIO DEL JUEGO SIN DESCUENTO';

ALTER TABLE tbl_dc ADD CONSTRAINT tbl_dc_pk PRIMARY KEY ( tbl_c_id_compra,
                                                          id_transaccion );

CREATE TABLE tbl_g (
    id_genero NUMBER(10) NOT NULL,
    genero    VARCHAR2(30 CHAR)
);

COMMENT ON COLUMN tbl_g.id_genero IS
    'identificador del genero';

COMMENT ON COLUMN tbl_g.genero IS
    'nombreo o descripcion del juego';

ALTER TABLE tbl_g ADD CONSTRAINT tbl_g_pk PRIMARY KEY ( id_genero );

CREATE TABLE tbl_ln (
    id_registro      NUMBER(10) NOT NULL,
    tbl_pais_id_pais NUMBER(10) NOT NULL,
    juego_id_juego   NUMBER(10, 2) NOT NULL
);

COMMENT ON COLUMN tbl_ln.id_registro IS
    'clave que identificará la transacción de la lista negra';

COMMENT ON COLUMN tbl_ln.tbl_pais_id_pais IS
    'campo que relacionará el pais en el cual un juego no puede venderse';

COMMENT ON COLUMN tbl_ln.juego_id_juego IS
    'campo del juego que no se puede vender en cierto país';

ALTER TABLE tbl_ln ADD CONSTRAINT tbl_ln_pk PRIMARY KEY ( id_registro );

CREATE TABLE tbl_pais (
    id_pais NUMBER(10) NOT NULL,
    pais    VARCHAR2(20 CHAR)
);

COMMENT ON COLUMN tbl_pais.id_pais IS
    'identificador del país';

COMMENT ON COLUMN tbl_pais.pais IS
    'nombre del país';

ALTER TABLE tbl_pais ADD CONSTRAINT tbl_pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE tbl_pr (
    id_descuento   NUMBER(10) NOT NULL,
    fecha_inicio   DATE NOT NULL,
    fecha_fin      DATE NOT NULL,
    porcentaje     NUMBER(2) NOT NULL,
    juego_id_juego NUMBER(10, 2) NOT NULL
);

COMMENT ON TABLE tbl_pr IS
    'Esta tabla contendra los descuentos de los distintos juegos de la empresa';

COMMENT ON COLUMN tbl_pr.id_descuento IS
    'la clave primaria de cada descuento';

COMMENT ON COLUMN tbl_pr.fecha_inicio IS
    'campo que manjea la fecha de inicio del descuento';

COMMENT ON COLUMN tbl_pr.fecha_fin IS
    'campo que manjea la fecha FINAL del descuento';

COMMENT ON COLUMN tbl_pr.porcentaje IS
    'Este campo contempla la cantidad de descuento de la promoción';

ALTER TABLE tbl_pr ADD CONSTRAINT tbl_pr_pk PRIMARY KEY ( id_descuento );

CREATE TABLE tbl_pt (
    id_pmt_tp   NUMBER(10) NOT NULL,
    name_pmt_tp VARCHAR2(30 CHAR)
);

COMMENT ON COLUMN tbl_pt.id_pmt_tp IS
    'clave que identifca el tipo de pago';

COMMENT ON COLUMN tbl_pt.name_pmt_tp IS
    'Nombre del tipo de pago';

ALTER TABLE tbl_pt ADD CONSTRAINT tbl_pt_pk PRIMARY KEY ( id_pmt_tp );

CREATE TABLE tbl_wish_list (
    id_twl          NUMBER(10) NOT NULL,
    usuario_id_user NUMBER(10) NOT NULL,
    juego_id_juego  NUMBER(10, 2) NOT NULL,
    fecha_agregado  DATE,
    comprado        NUMBER
);

COMMENT ON COLUMN tbl_wish_list.id_twl IS
    'Identificador de la transaccion en la wishlist del usuario Transaccion Wish List';

COMMENT ON COLUMN tbl_wish_list.usuario_id_user IS
    'Id que identifacra la bibliteca de cada uno de los usuarios';

COMMENT ON COLUMN tbl_wish_list.juego_id_juego IS
    'id del juego que el usuario agrega para una posible compra';

COMMENT ON COLUMN tbl_wish_list.fecha_agregado IS
    'fecha que se añadio el juego a la lista';

COMMENT ON COLUMN tbl_wish_list.comprado IS
    'Indica que el cliente ha comprado el juego o no, para eso debe ser true si el juego estado compardo';

ALTER TABLE tbl_wish_list ADD CONSTRAINT tbl_wish_list_pk PRIMARY KEY ( id_twl );

CREATE TABLE usuario (
    id_user          NUMBER(10) NOT NULL,
    nombres          VARCHAR2(50 CHAR) NOT NULL,
    apellidos        VARCHAR2(50 CHAR) NOT NULL,
    nickname         VARCHAR2(30 CHAR) NOT NULL,
    edad             NUMBER(2) NOT NULL,
    email            VARCHAR2(30 CHAR) NOT NULL,
    telfono          NUMBER(10),
    direccion        VARCHAR2(30 CHAR),
    pawd             VARCHAR2(100 CHAR) NOT NULL,
    tbl_pais_id_pais NUMBER(10) NOT NULL,
    rol_id_rol       NUMBER(10) NOT NULL
);

COMMENT ON COLUMN usuario.id_user IS
    'clave que identificara al usuario ingresado dentro del sistema';

COMMENT ON COLUMN usuario.nombres IS
    'nombre del usuario registrado en el sistema';

COMMENT ON COLUMN usuario.apellidos IS
    'apellidos del usuario dentro del sistema';

COMMENT ON COLUMN usuario.nickname IS
    'alias del usuario en el sistema';

COMMENT ON COLUMN usuario.edad IS
    'edad del usuario registrado';

COMMENT ON COLUMN usuario.email IS
    'correo electronico del usuario';

COMMENT ON COLUMN usuario.telfono IS
    'contacto telefonico del usuario';

COMMENT ON COLUMN usuario.direccion IS
    'dirección fisica del usaurio';

COMMENT ON COLUMN usuario.pawd IS
    ' campo que contendra la contraseña encriptada del usuario en base 64';

COMMENT ON COLUMN usuario.tbl_pais_id_pais IS
    'identificador del país al que pertenece el usuario';

COMMENT ON COLUMN usuario.rol_id_rol IS
    'identificador del rol que tiene el usuario en el sistema';

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_user );

ALTER TABLE cpg
    ADD CONSTRAINT cpg_juego_fk FOREIGN KEY ( juego_id_juego )
        REFERENCES juego ( id_juego );

ALTER TABLE cpg
    ADD CONSTRAINT cpg_tbl_g_fk FOREIGN KEY ( tbl_g_id_genero )
        REFERENCES tbl_g ( id_genero );

ALTER TABLE dsp
    ADD CONSTRAINT dsp_developer_fk FOREIGN KEY ( developer_id_developer )
        REFERENCES developer ( id_developer );

ALTER TABLE dsp
    ADD CONSTRAINT dsp_juego_fk FOREIGN KEY ( juego_id_juego )
        REFERENCES juego ( id_juego );

ALTER TABLE pc
    ADD CONSTRAINT pc_usuario_fk FOREIGN KEY ( usuario_id_user )
        REFERENCES usuario ( id_user );

ALTER TABLE tbl_bl
    ADD CONSTRAINT tbl_bl_tbl_c_fk FOREIGN KEY ( tbl_c_id_compra )
        REFERENCES tbl_c ( id_compra );

ALTER TABLE tbl_bl
    ADD CONSTRAINT tbl_bl_usuario_fk FOREIGN KEY ( usuario_id_user )
        REFERENCES usuario ( id_user );

ALTER TABLE tbl_c
    ADD CONSTRAINT tbl_c_tbl_pt_fk FOREIGN KEY ( tbl_pt_id_pmt_tp )
        REFERENCES tbl_pt ( id_pmt_tp );

ALTER TABLE tbl_c
    ADD CONSTRAINT tbl_c_usuario_fk FOREIGN KEY ( usuario_id_user )
        REFERENCES usuario ( id_user );

ALTER TABLE tbl_cl
    ADD CONSTRAINT tbl_cl_juego_fk FOREIGN KEY ( juego_id_juego )
        REFERENCES juego ( id_juego );

ALTER TABLE tbl_dc
    ADD CONSTRAINT tbl_dc_juego_fk FOREIGN KEY ( juego_id_juego )
        REFERENCES juego ( id_juego );

ALTER TABLE tbl_dc
    ADD CONSTRAINT tbl_dc_tbl_c_fk FOREIGN KEY ( tbl_c_id_compra )
        REFERENCES tbl_c ( id_compra );

ALTER TABLE tbl_ln
    ADD CONSTRAINT tbl_ln_juego_fk FOREIGN KEY ( juego_id_juego )
        REFERENCES juego ( id_juego );

ALTER TABLE tbl_ln
    ADD CONSTRAINT tbl_ln_tbl_pais_fk FOREIGN KEY ( tbl_pais_id_pais )
        REFERENCES tbl_pais ( id_pais );

ALTER TABLE tbl_pr
    ADD CONSTRAINT tbl_pr_juego_fk FOREIGN KEY ( juego_id_juego )
        REFERENCES juego ( id_juego );

ALTER TABLE tbl_wish_list
    ADD CONSTRAINT tbl_wish_list_juego_fk FOREIGN KEY ( juego_id_juego )
        REFERENCES juego ( id_juego );

ALTER TABLE tbl_wish_list
    ADD CONSTRAINT tbl_wish_list_usuario_fk FOREIGN KEY ( usuario_id_user )
        REFERENCES usuario ( id_user );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( rol_id_rol )
        REFERENCES rol ( id_rol );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_tbl_pais_fk FOREIGN KEY ( tbl_pais_id_pais )
        REFERENCES tbl_pais ( id_pais );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             36
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
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
