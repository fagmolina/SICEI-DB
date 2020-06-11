--------------------------------------------------------
-- Archivo creado  - jueves-mayo-28-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_PARAMETROS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PKG_PARAMETROS" is

    procedure prc_merge_parametro(p_id_parametro parametro.id_parametro%type,
                                  p_tag parametro.tag%type,
                                  p_valor_numero parametro.valor_numero%type,
                                  p_valor_caracter parametro.valor_caracter%type,
                                  p_valor_fecha parametro.valor_fecha%type,
                                  p_estado parametro.estado%type,
                                  p_mensaje out varchar2);

    function fnc_get_parametro(p_tag parametro.tag%type) return parametro%rowtype;
end;




/
--------------------------------------------------------
--  DDL for Package Body PKG_PARAMETROS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PKG_PARAMETROS" is

    procedure prc_merge_parametro(p_id_parametro parametro.id_parametro%type,
                                  p_tag parametro.tag%type,
                                  p_valor_numero parametro.valor_numero%type,
                                  p_valor_caracter parametro.valor_caracter%type,
                                  p_valor_fecha parametro.valor_fecha%type,
                                  p_estado parametro.estado%type,
                                  p_mensaje out varchar2) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;
    begin

        if p_id_parametro = 0 then
            select nvl(max(id_parametro),0)+1
            into vn_max_id
            from parametro;
        end if;            

        merge into parametro t
        using (select p_id_parametro id_parametro,
                      p_tag tag,
                      p_valor_numero valor_numero,
                      p_valor_caracter valor_caracter,
                      p_valor_fecha valor_fecha,
                      p_estado estado
               from dual) m
        on (m.id_parametro = t.id_parametro)
        when not matched then
           insert (id_parametro,tag,valor_numero,valor_caracter,valor_fecha,estado)
           values (m.id_parametro,m.tag,m.valor_numero,m.valor_caracter,m.valor_fecha,m.estado)
        when matched then
           update set t.tag = m.tag,
                      t.valor_numero = m.valor_numero,
                      t.valor_caracter = m.valor_caracter,
                      t.valor_fecha = m.valor_fecha,
                      t.estado = m.estado;
        commit;

        p_mensaje := 'OK';

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            p_mensaje := 'No procesado. Error: ('||vn_error||' - '||vv_error||')';
    end;

    function fnc_get_parametro(p_tag parametro.tag%type) return parametro%rowtype is
        vr_parametro parametro%rowtype;           
    begin

        select *
        into vr_parametro
        from parametro
        where tag = p_tag;

        return vr_parametro;

    exception
        when others then
            return null;
    end;

end;




/
