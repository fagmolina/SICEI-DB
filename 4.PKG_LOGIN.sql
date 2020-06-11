--------------------------------------------------------
-- Archivo creado  - jueves-mayo-28-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_LOGIN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PKG_LOGIN" is
    
    vv_set_caract varchar2(20) := pkg_parametros.fnc_get_parametro('SETCARACT').valor_caracter;
    vv_cadena_semilla varchar2(64) := pkg_parametros.fnc_get_parametro('CADSEMILLA').valor_caracter;
    vraw_llave raw(250) := utl_i18n.string_to_raw(data => vv_cadena_semilla, dst_charset => vv_set_caract);
    vi_tipo_encripcion pls_integer := dbms_crypto.encrypt_des + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;

    function fnc_encripta(pvi_valor varchar2) return raw;

    function fnc_desencripta(pvi_valor raw) return varchar2;

    procedure prc_acceso(p_usuario varchar2, p_contrasena varchar2, p_respuesta out sys_refcursor);
end;

/
--------------------------------------------------------
--  DDL for Package Body PKG_LOGIN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PKG_LOGIN" is

    function fnc_encripta(pvi_valor varchar2) return raw is
        vraw_valor raw(32);
        vraw_encriptado raw(32);
    begin
        vraw_valor := utl_i18n.string_to_raw(data => pvi_valor, dst_charset => vv_set_caract);
        vraw_encriptado := dbms_crypto.encrypt(src => vraw_valor, typ => vi_tipo_encripcion, key => vraw_llave);
        return vraw_encriptado;
    end;

    function fnc_desencripta(pvi_valor raw) return varchar2 is
        vraw_valor raw(2000);
        vv_desencriptado varchar2(2000);
    begin
        vraw_valor := dbms_crypto.decrypt(src => pvi_valor, typ => vi_tipo_encripcion, key => vraw_llave);
        vv_desencriptado := utl_i18n.raw_to_char(vraw_valor, vv_set_caract);
        return vv_desencriptado;
    end;

    procedure prc_acceso(p_usuario varchar2, p_contrasena varchar2, p_respuesta out sys_refcursor) is
        vn_acceso number := 0;
        vv_error varchar2(2000);
    begin

        select count(0)
        into vn_acceso
        from usuarios
        where pkg_login.fnc_desencripta(contrasena) = p_contrasena
        and usuario = p_usuario;

        if vn_acceso > 0 then
            open p_respuesta for
            select id_usuario,id_tipo_documento,documento,nombres,apellidos,
                   id_grado,id_unidad,email,telefono,usuario,perfil
            from usuarios
            where pkg_login.fnc_desencripta(contrasena) = p_contrasena
            and usuario = p_usuario;
        else
            open p_respuesta for
            select -1 codigo, 'Usuario no existe o contraseña no es correcta.' mensaje
            from dual;
        end if;

    exception
        when others then
            vv_error := sqlerrm;
            open p_respuesta for
            select -1 codigo, vv_error mensaje
            from dual;
    end;
end;

/
