--------------------------------------------------------
-- Archivo creado  - jueves-mayo-28-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_CRUDS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PKG_CRUDS" is

    procedure prc_merge_usuarios(p_id_usuario usuarios.id_usuario%type,
                                 p_id_tipo_documento usuarios.id_tipo_documento%type,
                                 p_documento usuarios.documento%type,
                                 p_nombres usuarios.nombres%type,
                                 p_apellidos usuarios.apellidos%type,
                                 p_id_grado usuarios.id_grado%type,
                                 p_id_unidad usuarios.id_unidad%type,
                                 p_email usuarios.email%type,
                                 p_contrasena usuarios.contrasena%type,
                                 p_telefono usuarios.telefono%type,
                                 p_usuario usuarios.usuario%type,
                                 p_perfil usuarios.perfil%type,
                                 p_resultado out sys_refcursor);

    procedure prc_delete_usuario(p_id_usuario usuarios.id_usuario%type,
                                 p_resultado out sys_refcursor);

    procedure prc_merge_grado(p_id_grado grado.id_grado%type,
                              p_descripcion grado.descripcion%type,
                              p_mensaje out varchar2);

    procedure prc_merge_tipo(p_id_tipo tipo.id_tipo%type,
                             p_descripcion tipo.descripcion%type,
                             p_mensaje out varchar2);

    procedure prc_merge_unidad(p_id_unidad unidad.id_unidad%type,
                               p_sigla unidad.sigla%type,
                               p_descripcion unidad.descripcion%type,
                               p_id_tipo unidad.id_tipo%type,
                               p_mensaje out sys_refcursor);

    procedure prc_get_usuarios(p_resultado out sys_refcursor);

    procedure prc_get_grado(p_resultado out sys_refcursor);

    procedure prc_get_tipo(p_resultado out sys_refcursor);

    procedure prc_get_unidad(p_resultado out sys_refcursor);

    procedure prc_merge_area(p_id_area area.id_area%type,
                             p_nombre area.nombre%type,
                             p_mensaje out varchar2);

    procedure prc_merge_investigacion(p_id_investigacion investigacion.id_investigacion%type,
                                      p_titulo investigacion.titulo%type,
                                      p_direccion investigacion.direccion%type,
                                      p_ano investigacion.ano%type,
                                      p_participacion investigacion.participacion%type,
                                      p_exp_participa investigacion.exp_participa%type,
                                      p_escuela investigacion.escuela%type,
                                      p_formulario investigacion.formulario%type,       
                                      p_mensaje out sys_refcursor);

    procedure prc_merge_investigador(p_id_investigador investigador.id_investigador%type,
                                     p_id_grado investigador.id_grado%type,
                                     p_documento investigador.documento%type,
                                     p_nombres investigador.nombres%type,
                                     p_apellidos investigador.apellidos%type,
                                     p_email investigador.email%type,
                                     p_telefono investigador.telefono%type,
                                     p_direccion investigador.direccion%type,
                                     p_estudios investigador.estudios%type,
                                     p_categorizado investigador.categorizado%type,
                                     p_categorizado_valor investigador.categorizado_valor%type,
                                     p_profesor investigador.profesor%type,
                                     p_estudiante investigador.estudiante%type,
                                     p_mensaje out sys_refcursor);

    procedure prc_delete_investigador(p_id_investigador investigador.id_investigador%type,
                                          p_resultado out sys_refcursor);

    procedure prc_merge_linea(p_id_linea linea.id_linea%type,
                                  p_nombre linea.nombre%type,
                                  p_mensaje out varchar2);

    procedure prc_merge_area_linea(p_id_area area_linea.id_area%type,
                                   p_id_linea area_linea.id_linea%type,
                                   p_mensaje out varchar2);

    procedure prc_merge_area_linea_inv(p_id_investigacion area_linea_investigacion.id_investigacion%type,
                                       p_id_area area_linea_investigacion.id_area%type,
                                       p_id_linea area_linea_investigacion.id_linea%type,
                                       p_mensaje out sys_refcursor);

    procedure prc_merge_investigadores_inv(p_id_investigacion investigadores_investigacion.id_investigacion%type,
                                           p_id_investigador investigadores_investigacion.id_investigador%type,
                                           p_mensaje out sys_refcursor);

    procedure prc_merge_producto_inv(p_id_investigacion producto_investigacion.id_investigacion%type,
                                     p_tipo_producto producto_investigacion.tipo_producto%type,
                                     p_autor producto_investigacion.autor%type,
                                     p_nombre_revista producto_investigacion.nombre_revista%type,
                                     p_nombre_articulo producto_investigacion.nombre_articulo%type,
                                     p_ano producto_investigacion.ano%type,
                                     p_codigo_issn producto_investigacion.codigo_issn%type,
                                     p_codigo_isbn producto_investigacion.codigo_isbn%type,
                                     p_nombre_libro producto_investigacion.nombre_libro%type,
                                     p_pagina_inicio producto_investigacion.pagina_inicio%type,
                                     p_pagina_final producto_investigacion.pagina_final%type,
                                     p_editorial producto_investigacion.editorial%type,
                                     p_fecha_publicacion producto_investigacion.fecha_publicacion%type,
                                     p_mensaje out sys_refcursor);       

    procedure prc_get_area(p_resultado out sys_refcursor);

    procedure prc_get_investigacion(p_resultado out sys_refcursor);

    procedure prc_get_investigador(p_resultado out sys_refcursor);    

    procedure prc_get_area_linea(p_resultado out sys_refcursor);

    procedure prc_get_area_linea_inv(p_id_investigacion varchar2, p_resultado out sys_refcursor);    

    procedure prc_get_investigadores_inv(p_id_investigacion varchar2, p_resultado out sys_refcursor); 

    procedure prc_get_producto_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor);

    procedure prc_merge_estimulos_inv(p_id_investigacion estimulos_investigacion.id_investigacion%type,
                                      p_condecoraciones estimulos_investigacion.condecoraciones%type,
                                      p_felicitaciones estimulos_investigacion.felicitaciones%type,
                                      p_personaje_mes estimulos_investigacion.personaje_mes%type,
                                      p_permiso estimulos_investigacion.permiso%type,
                                      p_estatuillas estimulos_investigacion.estatuillas%type,
                                      p_monedas estimulos_investigacion.monedas%type,
                                      p_capacitaciones estimulos_investigacion.capacitaciones%type,
                                      p_message out sys_refcursor);

    procedure prc_get_estimulos_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor);          

    procedure prc_merge_eventos_inv(p_id_investigacion eventos_investigacion.id_investigacion%type,
                                      p_tipo eventos_investigacion.tipo%type,
                                      p_participacion eventos_investigacion.participacion%type,
                                      p_fecha eventos_investigacion.fecha%type,
                                      p_tipo_region eventos_investigacion.tipo_region%type,
                                      p_desc_region eventos_investigacion.desc_region%type,
                                      p_desc_subregion eventos_investigacion.desc_subregion%type,
                                      p_message out sys_refcursor);    

    procedure prc_get_eventos_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor);    

    procedure prc_merge_presup_investigacion(p_id_investigacion presupuesto_investigacion.id_investigacion%type,
                                             p_nombre_presupuesto presupuesto_investigacion.nombre_presupuesto%type,
                                             p_desc_presupuesto presupuesto_investigacion.desc_presupuesto%type,
                                             p_aporte presupuesto_investigacion.aporte%type,
                                             p_message out sys_refcursor);  

    procedure prc_get_presup_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor);                 

    procedure prc_confirma_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor);
    
    procedure prc_datos_inv(p_resultado out sys_refcursor);
    
    procedure prc_elimina_inv(p_id_investigacion varchar2, p_resultado out sys_refcursor);
end;

/
--------------------------------------------------------
--  DDL for Package Body PKG_CRUDS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PKG_CRUDS" is

    procedure prc_merge_usuarios(p_id_usuario usuarios.id_usuario%type,
                                 p_id_tipo_documento usuarios.id_tipo_documento%type,
                                 p_documento usuarios.documento%type,
                                 p_nombres usuarios.nombres%type,
                                 p_apellidos usuarios.apellidos%type,
                                 p_id_grado usuarios.id_grado%type,
                                 p_id_unidad usuarios.id_unidad%type,
                                 p_email usuarios.email%type,
                                 p_contrasena usuarios.contrasena%type,
                                 p_telefono usuarios.telefono%type,
                                 p_usuario usuarios.usuario%type,
                                 p_perfil usuarios.perfil%type,                                 
                                 p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;
    begin

        if p_id_usuario = 0 then
            select nvl(max(id_usuario),0)+1
            into vn_max_id
            from usuarios;
        else
            vn_max_id := p_id_usuario;
        end if;

        merge into usuarios t
        using (select vn_max_id id_usuario,
                      p_id_tipo_documento id_tipo_documento,
                      p_documento documento,
                      p_nombres nombres,
                      p_apellidos apellidos,
                      p_id_grado id_grado,
                      p_id_unidad id_unidad,
                      p_email email,
                      pkg_login.fnc_encripta(p_contrasena) contrasena,
                      p_telefono telefono,
                      p_usuario usuario,
                      p_perfil perfil
               from dual) m
        on (m.id_usuario = t.id_usuario)
        when not matched then
           insert (id_usuario,id_tipo_documento,documento,nombres,apellidos,id_grado,id_unidad,email,contrasena,
                   telefono,usuario,perfil)
           values (m.id_usuario,m.id_tipo_documento,m.documento,m.nombres,m.apellidos,m.id_grado,m.id_unidad,m.email,m.contrasena,
                   m.telefono,m.usuario,m.perfil)
        when matched then
           update set t.id_tipo_documento = m.id_tipo_documento,
                      t.documento = m.documento,
                      t.nombres = m.nombres,
                      t.apellidos = m.apellidos,
                      t.id_grado = m.id_grado,
                      t.id_unidad = m.id_unidad,
                      t.email = m.email,
                      t.contrasena = m.contrasena,
                      t.telefono = m.telefono,
                      t.usuario = m.usuario,
                      t.perfil = m.perfil;
        commit;

        OPEN p_resultado FOR
        SELECT 1 AS CODIGO, 'OK' AS MENSAJE
          FROM DUAL;

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
       OPEN p_resultado FOR
        SELECT -1 AS CODIGO, 'ERROR' AS MENSAJE
          FROM DUAL;
    end;

    procedure prc_delete_usuario(p_id_usuario usuarios.id_usuario%type,
                                 p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        delete from usuarios u where u.id_usuario =  p_id_usuario;
        commit;

         OPEN p_resultado FOR
            SELECT 1 AS CODIGO, 'OK' AS MENSAJE
          FROM DUAL;

        exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
       OPEN p_resultado FOR
        SELECT -1 AS CODIGO, 'ERROR' AS MENSAJE
          FROM DUAL;

    end;


    procedure prc_merge_grado(p_id_grado grado.id_grado%type,
                              p_descripcion grado.descripcion%type,
                              p_mensaje out varchar2) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;
    begin

        if p_id_grado = 0 then
            select nvl(max(id_grado),0)+1
            into vn_max_id
            from grado;
        else
            vn_max_id := p_id_grado;
        end if;

        merge into grado t
        using (select vn_max_id id_grado,
                      p_descripcion descripcion
               from dual) m
        on (m.id_grado = t.id_grado)
        when not matched then
           insert (id_grado,descripcion)
           values (m.id_grado,m.descripcion)
        when matched then
           update set t.descripcion = m.descripcion;
        commit;

        p_mensaje := 'OK';

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            p_mensaje := 'No procesado. Error: ('||vn_error||' - '||vv_error||')';
    end;

    procedure prc_merge_tipo(p_id_tipo tipo.id_tipo%type,
                             p_descripcion tipo.descripcion%type,
                             p_mensaje out varchar2) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;
    begin

        if p_id_tipo = 0 then
            select nvl(max(id_tipo),0)+1
            into vn_max_id
            from tipo;
        else
            vn_max_id := p_id_tipo;
        end if;

        merge into tipo t
        using (select vn_max_id id_tipo,
                      p_descripcion descripcion
               from dual) m
        on (m.id_tipo = t.id_tipo)
        when not matched then
           insert (id_tipo,descripcion)
           values (m.id_tipo,m.descripcion)
        when matched then
           update set t.descripcion = m.descripcion;
        commit;

        p_mensaje := 'OK';

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            p_mensaje := 'No procesado. Error: ('||vn_error||' - '||vv_error||')';
    end;

    procedure prc_merge_unidad(p_id_unidad unidad.id_unidad%type,
                               p_sigla unidad.sigla%type,
                               p_descripcion unidad.descripcion%type,
                               p_id_tipo unidad.id_tipo%type,
                               p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;        
    begin

        if p_id_unidad = 0 then
            select nvl(max(id_unidad),0)+1
            into vn_max_id
            from unidad;
        else
            vn_max_id := p_id_unidad;
        end if;    

        merge into unidad t
        using (select vn_max_id id_unidad,
                      p_sigla sigla,
                      p_descripcion descripcion,
                      p_id_tipo id_tipo
               from dual) m
        on (m.id_unidad = t.id_unidad)
        when not matched then
           insert (id_unidad,sigla,descripcion,id_tipo)
           values (m.id_unidad,m.sigla,m.descripcion,m.id_tipo)
        when matched then
           update set t.sigla = m.sigla,
                      t.descripcion = m.descripcion;
        commit;

        open p_mensaje for
        select 1 codigo, 'OK' from dual;


    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_mensaje for
            select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
            from dual;
    end;

    procedure prc_get_usuarios(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select us.id_usuario,
               do.id_tipo_documento id_tipo_documento,
               do.valor sigla_tipo_documento,
               do.descripcion desc_tipo_documento,
               us.documento,
               us.nombres,
               us.apellidos,
               gr.id_grado,
               gr.descripcion desc_grado,
               un.id_unidad,
               un.sigla sigla_unidad,
               un.descripcion desc_unidad,
               us.email,
               pkg_login.fnc_desencripta(us.contrasena) contrasena,
               us.telefono,
               us.usuario,
               us.perfil
        from usuarios us
        left join tipo_documento do
            on us.id_tipo_documento = do.id_tipo_documento
        left join grado gr
            on gr.id_grado = us.id_grado
        left join unidad un
            on un.id_unidad = us.id_unidad;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_get_grado(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from grado;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_get_tipo(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from tipo;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_get_unidad(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from unidad;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;    

    procedure prc_merge_area(p_id_area area.id_area%type,
                             p_nombre area.nombre%type,
                             p_mensaje out varchar2) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        if p_id_area = 0 then
            select nvl(max(id_area),0)+1
            into vn_max_id
            from area;
        else
            vn_max_id := p_id_area;
        end if;

        merge into area t
        using (select vn_max_id id_area,
                      p_nombre nombre
        from dual) m
        on (m.id_area = t.id_area)
        when not matched then
           insert (id_area,nombre)
           values (m.id_area,m.nombre)
        when matched then
           update set t.nombre = m.nombre;
        commit;

        p_mensaje := 'OK';

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            p_mensaje := 'No procesado. Error: ('||vn_error||' - '||vv_error||')';
    end;

    procedure prc_merge_investigacion(p_id_investigacion investigacion.id_investigacion%type,
                                      p_titulo investigacion.titulo%type,
                                      p_direccion investigacion.direccion%type,
                                      p_ano investigacion.ano%type,
                                      p_participacion investigacion.participacion%type,
                                      p_exp_participa investigacion.exp_participa%type,
                                      p_escuela investigacion.escuela%type,
                                      p_formulario investigacion.formulario%type,                                      
                                      p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
        vv_sigla_escuela varchar2(20);
        v_id_investigacion varchar2(50);
    begin

        begin
            select sigla
            into vv_sigla_escuela
            from unidad
            where id_unidad = p_escuela;
        exception
            when others then
                vv_sigla_escuela := 'NOESC';
        end;

        if p_id_investigacion = '0' then
            vn_max_id := seq_id_inv.nextval;
            v_id_investigacion := 'VICIN'||vv_sigla_escuela||lpad(vn_max_id,3,'0');
        else
            v_id_investigacion := p_id_investigacion;
        end if;

        merge into investigacion t
        using (select v_id_investigacion id_investigacion,
                     p_titulo titulo,
                     p_direccion direccion,
                     p_ano ano,
                     p_participacion participacion,
                     p_exp_participa exp_participa,
                     p_escuela escuela,
                     p_formulario formulario
        from dual) m    
        on (m.id_investigacion = t.id_investigacion)
        when not matched then
           insert (id_investigacion,titulo,direccion,ano,participacion,exp_participa,escuela,estado,formulario)
           values (m.id_investigacion,m.titulo,m.direccion,m.ano,m.participacion,m.exp_participa,m.escuela,0,m.formulario)
        when matched then
           update set t.titulo = m.titulo,
                      t.direccion = m.direccion,
                      t.ano = m.ano,
                      t.participacion = m.participacion,
                      t.exp_participa = m.exp_participa,
                      t.formulario = m.formulario,
                      t.escuela = m.escuela;
        commit;

        open p_mensaje for
        select v_id_investigacion codigo, 'OK'  mensaje from dual;

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_mensaje for
            select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
            from dual;

    end;


    procedure prc_merge_investigador(p_id_investigador investigador.id_investigador%type,
                                     p_id_grado investigador.id_grado%type,
                                     p_documento investigador.documento%type,
                                     p_nombres investigador.nombres%type,
                                     p_apellidos investigador.apellidos%type,
                                     p_email investigador.email%type,
                                     p_telefono investigador.telefono%type,
                                     p_direccion investigador.direccion%type,
                                     p_estudios investigador.estudios%type,
                                     p_categorizado investigador.categorizado%type,
                                     p_categorizado_valor investigador.categorizado_valor%type,
                                     p_profesor investigador.profesor%type,
                                     p_estudiante investigador.estudiante%type,
                                     p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        if p_id_investigador = 0 then
            select nvl(max(id_investigador),0)+1
            into vn_max_id
            from investigador;
        else
            vn_max_id := p_id_investigador;
        end if;

        merge into investigador t
        using (select vn_max_id id_investigador,
                      p_id_grado id_grado,
                      p_documento documento,
                      p_nombres nombres,
                      p_apellidos apellidos,
                      p_email email,
                      p_telefono telefono,
                      p_direccion direccion,
                      p_estudios estudios,
                      p_categorizado categorizado,
                      p_categorizado_valor categorizado_valor,
                      p_profesor profesor,
                      p_estudiante estudiante
        from dual) m
        on (m.id_investigador = t.id_investigador)
        when not matched then
            insert (id_investigador,id_grado,documento,nombres,apellidos,email,telefono,direccion,estudios,categorizado,categorizado_valor,profesor,estudiante)
            values (m.id_investigador,m.id_grado,m.documento,m.nombres,m.apellidos,m.email,m.telefono,m.direccion,m.estudios,m.categorizado,m.categorizado_valor,m.profesor,m.estudiante)
        when matched then
        update set t.id_grado = m.id_grado,
                   t.documento = m.documento,
                   t.nombres = m.nombres,
                   t.apellidos = m.apellidos,
                   t.email = m.email,
                   t.telefono = m.telefono,
                   t.direccion = m.direccion,
                   t.estudios = m.estudios,
                   t.categorizado = m.categorizado,
                   t.categorizado_valor = m.categorizado_valor,
                   t.profesor = m.profesor,
                   t.estudiante = m.estudiante;
        commit;

        OPEN p_mensaje FOR
        SELECT 1 AS CODIGO, 'OK' AS MENSAJE
          FROM DUAL;

    exception
    when others then
        vv_error := sqlerrm;
        vn_error := sqlcode;
       OPEN p_mensaje FOR
        SELECT -1 AS CODIGO, 'ERROR' AS MENSAJE
          FROM DUAL;
    end;

    procedure prc_delete_investigador(p_id_investigador investigador.id_investigador%type,
                                          p_resultado out sys_refcursor) is
    vv_error varchar2(2000);
        vn_error number := 0;
        l_exst number:=0;
    begin
        select case 
           when exists(select ii.id_investigador from investigadores_investigacion ii
                            where ii.id_investigador =p_id_investigador
                          and rownum = 1
                        )
           then 1
           else 0
         end  into l_exst
          from dual;
        
          if l_exst = 1 
          then
               OPEN p_resultado FOR
                SELECT -1 AS CODIGO, 'No se puede eliminar debido a que esta asociado a una investigación' AS MENSAJE
              FROM DUAL;
          else
              delete from investigador i where i.id_investigador =  p_id_investigador;
            commit;
             OPEN p_resultado FOR
            SELECT 1 AS CODIGO, 'OK' AS MENSAJE
          FROM DUAL;
          end if;
    
        exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
       OPEN p_resultado FOR
        SELECT -1 AS CODIGO, 'ERROR AL ELIMINAR' AS MENSAJE
          FROM DUAL;

    end;            

    procedure prc_merge_linea(p_id_linea linea.id_linea%type,
                              p_nombre linea.nombre%type,
                              p_mensaje out varchar2) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        if p_id_linea = 0 then
            select nvl(max(id_linea),0)+1
            into vn_max_id
            from linea;
        else
            vn_max_id := p_id_linea;
        end if;

        merge into linea t
        using (select vn_max_id id_linea,
                      p_nombre nombre
        from dual) m
        on (m.id_linea = t.id_linea)
        when not matched then
            insert (id_linea,nombre)
            values (m.id_linea,m.nombre)
        when matched then
        update set t.nombre = m.nombre;
        commit;

        p_mensaje := 'OK';

    exception
    when others then
        vv_error := sqlerrm;
        vn_error := sqlcode;
        p_mensaje := 'No procesado. Error: ('||vn_error||' - '||vv_error||')';
    end;

    procedure prc_merge_area_linea(p_id_area area_linea.id_area%type,
                                   p_id_linea area_linea.id_linea%type,
                                   p_mensaje out varchar2) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        merge into area_linea t
        using (select p_id_area id_area,
                      p_id_linea id_linea
        from dual) m
        on (m.id_area = t.id_area and m.id_linea = t.id_linea)
        when not matched then
            insert (id_area,id_linea)
            values (m.id_area,m.id_linea);
        commit;

        p_mensaje := 'OK';

    exception
    when others then
        vv_error := sqlerrm;
        vn_error := sqlcode;
        p_mensaje := 'No procesado. Error: ('||vn_error||' - '||vv_error||')';
    end;

    procedure prc_merge_area_linea_inv(p_id_investigacion area_linea_investigacion.id_investigacion%type,
                                       p_id_area area_linea_investigacion.id_area%type,
                                       p_id_linea area_linea_investigacion.id_linea%type,
                                       p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        merge into area_linea_investigacion t
        using (select p_id_investigacion id_investigacion,
                      p_id_area id_area,
                      p_id_linea id_linea
        from dual) m
        on (m.id_investigacion = t.id_investigacion and m.id_area = t.id_area and m.id_linea = t.id_linea)
        when not matched then
        insert (id_investigacion,id_area,id_linea)
        values (m.id_investigacion,m.id_area,m.id_linea);
        commit;

        open p_mensaje for
        select 1 codigo, 'OK' mensaje 
        from dual;

    exception
    when others then
        vv_error := sqlerrm;
        vn_error := sqlcode;
        open p_mensaje for
        select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
        from dual;
    end;

    procedure prc_merge_investigadores_inv(p_id_investigacion investigadores_investigacion.id_investigacion%type,
                                           p_id_investigador investigadores_investigacion.id_investigador%type,
                                           p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        merge into investigadores_investigacion t
        using (select p_id_investigacion id_investigacion,
                      p_id_investigador id_investigador
        from dual) m
        on (m.id_investigacion = t.id_investigacion and m.id_investigador = t.id_investigador)
        when not matched then
            insert (id_investigacion,id_investigador)
            values (m.id_investigacion,m.id_investigador);
        commit;

       open p_mensaje for
        select  1 codigo, 'OK' mensaje 
        from dual;

    exception
    when others then
        vv_error := sqlerrm;
        vn_error := sqlcode;
      open p_mensaje for
         select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
        from dual;
    end;

    procedure prc_merge_producto_inv(p_id_investigacion producto_investigacion.id_investigacion%type,
                                     p_tipo_producto producto_investigacion.tipo_producto%type,
                                     p_autor producto_investigacion.autor%type,
                                     p_nombre_revista producto_investigacion.nombre_revista%type,
                                     p_nombre_articulo producto_investigacion.nombre_articulo%type,
                                     p_ano producto_investigacion.ano%type,
                                     p_codigo_issn producto_investigacion.codigo_issn%type,
                                     p_codigo_isbn producto_investigacion.codigo_isbn%type,
                                     p_nombre_libro producto_investigacion.nombre_libro%type,
                                     p_pagina_inicio producto_investigacion.pagina_inicio%type,
                                     p_pagina_final producto_investigacion.pagina_final%type,
                                     p_editorial producto_investigacion.editorial%type,
                                     p_fecha_publicacion producto_investigacion.fecha_publicacion%type,
                                     p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        merge into producto_investigacion t
        using (select p_id_investigacion id_investigacion,
                      p_tipo_producto tipo_producto,
                      p_autor autor,
                      p_nombre_revista nombre_revista,
                      p_nombre_articulo nombre_articulo,
                      p_ano ano,
                      p_codigo_issn codigo_issn,
                      p_codigo_isbn codigo_isbn,
                      p_nombre_libro nombre_libro,
                      p_pagina_inicio pagina_inicio,
                      p_pagina_final pagina_final,
                      p_editorial editorial,
                      p_fecha_publicacion fecha_publicacion
        from dual) m
        on (m.id_investigacion = t.id_investigacion and m.tipo_producto = t.tipo_producto)
        when not matched then
        insert (id_investigacion,tipo_producto,autor,nombre_revista,nombre_articulo,ano,codigo_issn,codigo_isbn,nombre_libro,
                pagina_inicio,pagina_final,editorial,fecha_publicacion)
        values (m.id_investigacion,m.tipo_producto,m.autor,m.nombre_revista,m.nombre_articulo,m.ano,m.codigo_issn,m.codigo_isbn,m.nombre_libro,
                m.pagina_inicio,m.pagina_final,m.editorial,m.fecha_publicacion)
        when matched then
        update set t.autor = m.autor,
                   t.nombre_revista = m.nombre_revista,
                   t.nombre_articulo = m.nombre_articulo,
                   t.ano = m.ano,
                   t.codigo_issn = m.codigo_issn,
                   t.codigo_isbn = m.codigo_isbn,
                   t.nombre_libro = m.nombre_libro,
                   t.pagina_inicio = m.pagina_inicio,
                   t.pagina_final = m.pagina_final,
                   t.editorial = m.editorial,
                   t.fecha_publicacion = m.fecha_publicacion;
        commit;

        open p_mensaje for
        select 1 codigo, 'OK' mensaje
        from dual;

    exception
    when others then
        vv_error := sqlerrm;
        vn_error := sqlcode;
        open p_mensaje for
        select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
        from dual;
    end;

    procedure prc_get_area(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from area;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_get_investigacion(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select inv.id_investigacion,
               inv.titulo,
               inv.direccion,
               inv.ano,
               inv.participacion,
               inv.exp_participa, 
               inv.escuela id_unidad_escuela,
               un.sigla sigla_escuela,
               un.descripcion desc_escuela,
               inv.estado
        from investigacion inv
        left join unidad un
            on un.id_unidad = inv.escuela;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_get_investigador(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select inv.id_investigador,
               inv.id_grado,
               gr.descripcion desc_grado,
               inv.documento,
               inv.nombres,
               inv.apellidos,
               inv.email,
               inv.telefono,
               inv.direccion,
               inv.estudios,
               inv.categorizado,
               inv.categorizado_valor,
               inv.profesor,
               inv.estudiante
        from investigador inv
        left join grado gr
            on gr.id_grado = inv.id_grado;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;    

    procedure prc_get_area_linea(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select a.nombre area_nombre, l.nombre linea_nombre, al.id_area area, al.id_linea linea
        from area_linea al, area a, linea l
        where al.id_area = a.id_area
        and al.id_linea = l.id_linea;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;    

    procedure prc_get_area_linea_inv(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select ali.id_investigacion,
               ali.id_area,
               ar.nombre nombre_area,
               ali.id_linea,
               li.nombre nombre_linea
        from area_linea_investigacion ali
        left join area ar
            on ar.id_area = ali.id_area
        left join linea li
            on li.id_linea = ali.id_linea
        where ali.id_investigacion = p_id_investigacion;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;   

    procedure prc_get_investigadores_inv(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select inv.id_investigacion,
               inv.id_investigador,
               inves.id_grado,
               gr.descripcion desc_grado,
               inves.documento,
               inves.nombres,
               inves.apellidos,
               inves.email,
               inves.telefono,
               inves.direccion,
               inves.estudios,
               inves.categorizado,
               inves.categorizado_valor,
               inves.profesor,
               inves.estudiante
        from investigadores_investigacion inv
        left join investigador inves
            on inves.id_investigador = inv.id_investigador
        left join grado gr
            on gr.id_grado = inves.id_grado
        where inv.id_investigacion = p_id_investigacion;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;  

    procedure prc_get_producto_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from producto_investigacion
        where id_investigacion = p_id_investigacion;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;  

    procedure prc_merge_estimulos_inv(p_id_investigacion estimulos_investigacion.id_investigacion%type,
                                      p_condecoraciones estimulos_investigacion.condecoraciones%type,
                                      p_felicitaciones estimulos_investigacion.felicitaciones%type,
                                      p_personaje_mes estimulos_investigacion.personaje_mes%type,
                                      p_permiso estimulos_investigacion.permiso%type,
                                      p_estatuillas estimulos_investigacion.estatuillas%type,
                                      p_monedas estimulos_investigacion.monedas%type,
                                      p_capacitaciones estimulos_investigacion.capacitaciones%type,
                                      p_message out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_error_id number; 
    begin

        merge into estimulos_investigacion t
        using (select p_id_investigacion id_investigacion,
                      p_condecoraciones condecoraciones,
                      p_felicitaciones felicitaciones,
                      p_personaje_mes personaje_mes,
                      p_permiso permiso,
                      p_estatuillas estatuillas,
                      p_monedas monedas,
                      p_capacitaciones capacitaciones
        from dual) m
        on (m.id_investigacion = t.id_investigacion)
        when not matched then
           insert (id_investigacion,condecoraciones,felicitaciones,personaje_mes,permiso,estatuillas,monedas,capacitaciones)
           values (m.id_investigacion,m.condecoraciones,m.felicitaciones,m.personaje_mes,m.permiso,m.estatuillas,m.monedas,m.capacitaciones)
        when matched then
           update set t.condecoraciones = m.condecoraciones,
                      t.felicitaciones = m.felicitaciones,
                      t.personaje_mes = m.personaje_mes,
                      t.permiso = m.permiso,
                      t.estatuillas = m.estatuillas,
                      t.monedas = m.monedas,
                      t.capacitaciones = m.capacitaciones;
        commit;

        open p_message for
        select 1 codigo, 'OK' mensaje
        from dual;

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_message for
            select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
            from dual;
    end;

    procedure prc_get_estimulos_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from estimulos_investigacion
        where id_investigacion = p_id_investigacion;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_merge_eventos_inv(p_id_investigacion eventos_investigacion.id_investigacion%type,
                                      p_tipo eventos_investigacion.tipo%type,
                                      p_participacion eventos_investigacion.participacion%type,
                                      p_fecha eventos_investigacion.fecha%type,
                                      p_tipo_region eventos_investigacion.tipo_region%type,
                                      p_desc_region eventos_investigacion.desc_region%type,
                                      p_desc_subregion eventos_investigacion.desc_subregion%type,
                                      p_message out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_error_id number;                                       
    begin
        merge into eventos_investigacion t
        using (select p_id_investigacion id_investigacion,
                      p_tipo tipo,
                      p_participacion participacion,
                      p_fecha fecha,
                      p_tipo_region tipo_region,
                      p_desc_region desc_region,
                      p_desc_subregion desc_subregion
        from dual) m
        on (m.id_investigacion = t.id_investigacion)
        when not matched then
           insert (id_investigacion,tipo,participacion,fecha,tipo_region,desc_region,desc_subregion)
           values (m.id_investigacion,m.tipo,m.participacion,m.fecha,m.tipo_region,m.desc_region,m.desc_subregion)
        when matched then
           update set t.tipo = m.tipo,
                      t.participacion = m.participacion,
                      t.fecha = m.fecha,
                      t.tipo_region = m.tipo_region,
                      t.desc_region = m.desc_region,
                      t.desc_subregion = m.desc_subregion;
        commit;

        open p_message for
        select 1 codigo, 'OK' mensaje
        from dual;

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_message for
            select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
            from dual;
    end;

    procedure prc_get_eventos_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from eventos_investigacion
        where id_investigacion = p_id_investigacion;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_merge_presup_investigacion(p_id_investigacion presupuesto_investigacion.id_investigacion%type,
                                             p_nombre_presupuesto presupuesto_investigacion.nombre_presupuesto%type,
                                             p_desc_presupuesto presupuesto_investigacion.desc_presupuesto%type,
                                             p_aporte presupuesto_investigacion.aporte%type,
                                             p_message out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_error_id number;                                       
    begin

        merge into presupuesto_investigacion t
        using (select p_id_investigacion id_investigacion,
                      p_nombre_presupuesto nombre_presupuesto,
                      p_desc_presupuesto desc_presupuesto,
                      p_aporte aporte
        from dual) m
        on (m.id_investigacion = t.id_investigacion)
        when not matched then
           insert (id_investigacion,nombre_presupuesto,desc_presupuesto,aporte)
           values (m.id_investigacion,m.nombre_presupuesto,m.desc_presupuesto,m.aporte)
        when matched then
           update set t.nombre_presupuesto = m.nombre_presupuesto,
                      t.desc_presupuesto = m.desc_presupuesto,
                      t.aporte = m.aporte;
        commit;              

        open p_message for
        select 1 codigo, 'OK' mensaje
        from dual;

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_message for
            select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
            from dual;
    end;

    procedure prc_get_presup_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from presupuesto_investigacion
        where id_investigacion = p_id_investigacion;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;    

    procedure prc_confirma_investigacion(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;    
    begin

        update investigacion
        set estado = 1
        where id_investigacion = p_id_investigacion;
        commit;

        open p_resultado for
        select 1 codigo, 'OK' mensaje
        from dual;

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
            from dual;
    end;


     procedure prc_datos_inv( p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select inv.id_investigacion ticket, inv.titulo nombre, inv.ano fecha, 
               inv.escuela escuela, esc.sigla sigla_escuela, esc.descripcion nombre_escuela,
               inv.direccion direccion, dir.sigla sigla_direccion, dir.descripcion nombre_direccion,
               inv.formulario formulario
        from investigacion inv
        left join unidad esc
            on inv.escuela = esc.id_unidad
        left join unidad dir
            on inv.direccion = dir.id_unidad
        where esc.id_tipo = 1
        and dir.id_tipo = 2;        
        
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;
    
    procedure prc_elimina_inv(p_id_investigacion varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;    
    begin
    
        delete from presupuesto_investigacion
        where id_investigacion = p_id_investigacion;
        commit;
        
        delete from eventos_investigacion
        where id_investigacion = p_id_investigacion;
        commit;
        
        delete from estimulos_investigacion
        where id_investigacion = p_id_investigacion;
        commit;
        
        delete from producto_investigacion
        where id_investigacion = p_id_investigacion;
        commit;
        
        delete from area_linea_investigacion
        where id_investigacion = p_id_investigacion;
        commit;       
        
        delete from investigadores_investigacion
        where id_investigacion = p_id_investigacion;
        commit;              
        
        delete from investigacion
        where id_investigacion = p_id_investigacion;
        commit;   
		
        open p_resultado for
        select 1 codigo, 'OK' mensaje
        from dual;		
    
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;	

end;

/
