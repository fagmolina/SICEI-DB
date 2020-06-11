--------------------------------------------------------
-- Archivo creado  - jueves-mayo-28-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_CRUDS_ADIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PKG_CRUDS_ADIC" is

    procedure prc_merge_caso_emblematico(p_id_caso caso_emblematico.id_caso%type,
                                         p_nombre_caso caso_emblematico.nombre_caso%type,
                                         p_lugar_afectacion caso_emblematico.lugar_afectacion%type,
                                         p_actividades caso_emblematico.actividades%type,
                                         p_mensaje out sys_refcursor);

    procedure prc_merge_caso_emb_inv(p_id_caso investigador_caso_emb.id_caso%type,
                                     p_id_investigador investigador_caso_emb.id_investigador%type,
                                     p_mensaje out sys_refcursor);

    procedure prc_get_caso_emblematico(p_id_caso varchar2, p_resultado out sys_refcursor);  

    procedure prc_merge_red_investigacion(p_id_red red_investigacion.id_red%type,
                                          p_nombre_red red_investigacion.nombre_red%type,
                                          p_entidad red_investigacion.entidad%type,
                                          p_ano_creacion red_investigacion.ano_creacion%type,
                                          p_sede_depto red_investigacion.sede_depto%type,
                                          p_sede_ciudad red_investigacion.sede_ciudad%type,
                                          p_mensaje out sys_refcursor);

    procedure prc_get_red_inv(p_resultado out sys_refcursor);     

    procedure prc_merge_semillero(p_id_semillero semillero.id_semillero%type,
                                  p_nombre_semillero semillero.nombre_semillero%type,
                                  p_id_unidad semillero.id_unidad%type,
                                  p_mensaje out sys_refcursor);

    procedure prc_merge_linea_semillero(p_id_semillero area_linea_semillero.id_semillero%type,
                                        p_id_area area_linea_semillero.id_area%type,
                                        p_id_linea area_linea_semillero.id_linea%type,
                                        p_mensaje out sys_refcursor);

    procedure prc_get_area_linea_sem(p_id_semillero varchar2, p_resultado out sys_refcursor);  


    procedure prc_merge_investigadores_sem(p_id_semillero investigadores_semillero.id_semillero%type,
                                           p_id_investigador investigadores_semillero.id_investigador%type,
                                           p_mensaje out sys_refcursor);    

    procedure prc_get_investigadores_sem(p_id_semillero number, p_resultado out sys_refcursor);           

    procedure prc_merge_eventos_sem(p_id_semillero eventos_semillero.id_semillero%type,
                                    p_tipo eventos_semillero.tipo%type,
                                    p_participacion eventos_semillero.participacion%type,
                                    p_fecha eventos_semillero.fecha%type,
                                    p_tipo_region eventos_semillero.tipo_region%type,
                                    p_desc_region eventos_semillero.desc_region%type,
                                    p_desc_subregion eventos_semillero.desc_subregion%type,
                                    p_mensaje out sys_refcursor);     

    procedure prc_get_eventos_semillero(p_id_semillero number, p_resultado out sys_refcursor);          

    procedure prc_merge_estimulos_sem(p_id_semillero estimulos_semillero.id_semillero%type,
                                      p_condecoraciones estimulos_semillero.condecoraciones%type,
                                      p_felicitaciones estimulos_semillero.felicitaciones%type,
                                      p_personaje_mes estimulos_semillero.personaje_mes%type,
                                      p_permiso estimulos_semillero.permiso%type,
                                      p_estatuillas estimulos_semillero.estatuillas%type,
                                      p_monedas estimulos_semillero.monedas%type,
                                      p_capacitaciones estimulos_semillero.capacitaciones%type,
                                      p_mensaje out sys_refcursor);    

    procedure prc_get_estimulos_semillero(p_id_semillero number, p_resultado out sys_refcursor);                                           
end;


/
--------------------------------------------------------
--  DDL for Package Body PKG_CRUDS_ADIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PKG_CRUDS_ADIC" is

    procedure prc_merge_caso_emblematico(p_id_caso caso_emblematico.id_caso%type,
                                         p_nombre_caso caso_emblematico.nombre_caso%type,
                                         p_lugar_afectacion caso_emblematico.lugar_afectacion%type,
                                         p_actividades caso_emblematico.actividades%type,
                                         p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;                                         
    begin

        if p_id_caso = 0 then
            select nvl(max(id_caso),0)+1
            into vn_max_id
            from caso_emblematico;
        else
            vn_max_id := p_id_caso;
        end if;

        merge into caso_emblematico t
        using (select vn_max_id id_caso,
                      p_nombre_caso nombre_caso,
                      p_lugar_afectacion lugar_afectacion,
                      p_actividades actividades
        from dual) m
        on (m.id_caso = t.id_caso)
        when not matched then
           insert (id_caso,nombre_caso,lugar_afectacion,actividades)
           values (m.id_caso,m.nombre_caso,m.lugar_afectacion,m.actividades)
        when matched then
           update set t.nombre_caso = m.nombre_caso,
                      t.lugar_afectacion = m.lugar_afectacion,
                      t.actividades = m.actividades;
        commit;

        open p_mensaje for
        select vn_max_id codigo, 'OK' mensaje
        from dual;

    exception
    when others then
        vv_error := sqlerrm;
        vn_error := sqlcode;
        open p_mensaje for
        select -1 codigo, 'No procesado. Error: ('||vn_error||' - '||vv_error||')' mensaje
        from dual;
    end;

    procedure prc_merge_caso_emb_inv(p_id_caso investigador_caso_emb.id_caso%type,
                                     p_id_investigador investigador_caso_emb.id_investigador%type,
                                     p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;                                         
    begin

        merge into investigador_caso_emb t
        using (select p_id_caso id_caso,
                      p_id_investigador id_investigador
        from dual) m
        on (m.id_caso = t.id_caso)
        when not matched then
           insert (id_caso,id_investigador)
           values (m.id_caso,m.id_investigador);

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

    procedure prc_get_caso_emblematico(p_id_caso varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;    
    begin
        open p_resultado for
        select ca.id_caso, ca.nombre_caso, ca.lugar_afectacion, ca.actividades,
               inc.id_investigador,
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
        from caso_emblematico ca
        left join investigador_caso_emb inc
            on ca.id_caso = inc.id_caso
        left join investigador inves
            on inves.id_investigador = inc.id_investigador
        left join grado gr
            on gr.id_grado = inves.id_grado;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;

    end;

    procedure prc_merge_red_investigacion(p_id_red red_investigacion.id_red%type,
                                          p_nombre_red red_investigacion.nombre_red%type,
                                          p_entidad red_investigacion.entidad%type,
                                          p_ano_creacion red_investigacion.ano_creacion%type,
                                          p_sede_depto red_investigacion.sede_depto%type,
                                          p_sede_ciudad red_investigacion.sede_ciudad%type,
                                          p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;                                         
    begin

        if p_id_red = 0 then
            select nvl(max(id_red),0)+1
            into vn_max_id
            from red_investigacion;
        else
            vn_max_id := p_id_red;
        end if;

        merge into red_investigacion t
        using (select vn_max_id id_red,
                      p_nombre_red nombre_red,
                      p_entidad entidad,
                      p_ano_creacion ano_creacion,
                      p_sede_depto sede_depto,
                      p_sede_ciudad sede_ciudad
        from dual) m
        on (m.id_red = t.id_red)
        when not matched then
           insert (id_red,nombre_red,entidad,ano_creacion,sede_depto,sede_ciudad)
           values (m.id_red,m.nombre_red,m.entidad,m.ano_creacion,m.sede_depto,m.sede_ciudad)
        when matched then
           update set t.nombre_red = m.nombre_red,
                      t.entidad = m.entidad,
                      t.ano_creacion = m.ano_creacion,
                      t.sede_depto = m.sede_depto,
                      t.sede_ciudad = m.sede_ciudad;
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

    procedure prc_get_red_inv(p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from red_investigacion;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_merge_semillero(p_id_semillero semillero.id_semillero%type,
                                  p_nombre_semillero semillero.nombre_semillero%type,
                                  p_id_unidad semillero.id_unidad%type,
                                  p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
        vn_max_id number := 0;                                         
    begin

        if p_id_semillero = 0 then
            select nvl(max(id_semillero),0)+1
            into vn_max_id
            from semillero;
        else
            vn_max_id := p_id_semillero;
        end if;

        merge into semillero t
        using (select vn_max_id id_semillero,
               p_nombre_semillero nombre_semillero,
               p_id_unidad id_unidad
        from dual) m
        on (m.id_semillero = t.id_semillero)
        when not matched then
           insert (id_semillero,nombre_semillero,id_unidad)
           values (m.id_semillero,m.nombre_semillero,m.id_unidad)
        when matched then
           update set t.nombre_semillero = m.nombre_semillero,
                      t.id_unidad = m.id_unidad;
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

    procedure prc_merge_linea_semillero(p_id_semillero area_linea_semillero.id_semillero%type,
                                        p_id_area area_linea_semillero.id_area%type,
                                        p_id_linea area_linea_semillero.id_linea%type,
                                        p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;                                        
    begin

        merge into area_linea_semillero t
        using (select p_id_semillero id_semillero,
                      p_id_area id_area,
                      p_id_linea id_linea
        from dual) m
        on (m.id_semillero = t.id_semillero and m.id_area = t.id_area and m.id_linea = t.id_linea)
        when not matched then
           insert (id_semillero,id_area,id_linea)
           values (m.id_semillero,m.id_area,m.id_linea);
        commit;
    end;

    procedure prc_get_area_linea_sem(p_id_semillero varchar2, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select ali.id_semillero,
               ali.id_area,
               ar.nombre nombre_area,
               ali.id_linea,
               li.nombre nombre_linea
        from area_linea_semillero ali
        left join area ar
            on ar.id_area = ali.id_area
        left join linea li
            on li.id_linea = ali.id_linea
        where ali.id_semillero = p_id_semillero;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_merge_investigadores_sem(p_id_semillero investigadores_semillero.id_semillero%type,
                                           p_id_investigador investigadores_semillero.id_investigador%type,
                                           p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        merge into investigadores_semillero t
        using (select p_id_semillero id_semillero,
                      p_id_investigador id_investigador
        from dual) m
        on (m.id_semillero = t.id_semillero and m.id_investigador = t.id_investigador)
        when not matched then
            insert (id_semillero,id_investigador)
            values (m.id_semillero,m.id_investigador);
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

    procedure prc_get_investigadores_sem(p_id_semillero number, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin

        open p_resultado for
        select sem.id_semillero,
               sem.id_investigador,
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
        from investigadores_semillero sem
        left join investigador inves
            on inves.id_investigador = sem.id_investigador
        left join grado gr
            on gr.id_grado = inves.id_grado
        where sem.id_semillero = p_id_semillero;

    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_merge_eventos_sem(p_id_semillero eventos_semillero.id_semillero%type,
                                    p_tipo eventos_semillero.tipo%type,
                                    p_participacion eventos_semillero.participacion%type,
                                    p_fecha eventos_semillero.fecha%type,
                                    p_tipo_region eventos_semillero.tipo_region%type,
                                    p_desc_region eventos_semillero.desc_region%type,
                                    p_desc_subregion eventos_semillero.desc_subregion%type,
                                    p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_max_id number := 0;
    begin

        merge into eventos_semillero t
        using (select p_id_semillero id_semillero,
                      p_tipo tipo,
                      p_participacion participacion,
                      p_fecha fecha,
                      p_tipo_region tipo_region,
                      p_desc_region desc_region,
                      p_desc_subregion desc_subregion
        from dual) m
        on (m.id_semillero = t.id_semillero)
        when not matched then
           insert (id_semillero,tipo,participacion,fecha,tipo_region,desc_region,desc_subregion)
           values (m.id_semillero,m.tipo,m.participacion,m.fecha,m.tipo_region,m.desc_region,m.desc_subregion)
        when matched then
           update set t.tipo = m.tipo,
                      t.participacion = m.participacion,
                      t.fecha = m.fecha,
                      t.tipo_region = m.tipo_region,
                      t.desc_region = m.desc_region,
                      t.desc_subregion = m.desc_subregion;
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

    procedure prc_get_eventos_semillero(p_id_semillero number, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from eventos_semillero
        where id_semillero = p_id_semillero;
    exception
        when others then
            vv_error := sqlerrm;
            vn_error := sqlcode;
            open p_resultado for
            select 'Error: ('||vn_error||' - '||vv_error||')'
            from dual;
    end;

    procedure prc_merge_estimulos_sem(p_id_semillero estimulos_semillero.id_semillero%type,
                                      p_condecoraciones estimulos_semillero.condecoraciones%type,
                                      p_felicitaciones estimulos_semillero.felicitaciones%type,
                                      p_personaje_mes estimulos_semillero.personaje_mes%type,
                                      p_permiso estimulos_semillero.permiso%type,
                                      p_estatuillas estimulos_semillero.estatuillas%type,
                                      p_monedas estimulos_semillero.monedas%type,
                                      p_capacitaciones estimulos_semillero.capacitaciones%type,
                                      p_mensaje out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number;
        vn_error_id number; 
    begin

        merge into estimulos_semillero t
        using (select p_id_semillero id_semillero,
                      p_condecoraciones condecoraciones,
                      p_felicitaciones felicitaciones,
                      p_personaje_mes personaje_mes,
                      p_permiso permiso,
                      p_estatuillas estatuillas,
                      p_monedas monedas,
                      p_capacitaciones capacitaciones
        from dual) m
        on (m.id_semillero = t.id_semillero)
        when not matched then
           insert (id_semillero,condecoraciones,felicitaciones,personaje_mes,permiso,estatuillas,monedas,capacitaciones)
           values (m.id_semillero,m.condecoraciones,m.felicitaciones,m.personaje_mes,m.permiso,m.estatuillas,m.monedas,m.capacitaciones)
        when matched then
           update set t.condecoraciones = m.condecoraciones,
                      t.felicitaciones = m.felicitaciones,
                      t.personaje_mes = m.personaje_mes,
                      t.permiso = m.permiso,
                      t.estatuillas = m.estatuillas,
                      t.monedas = m.monedas,
                      t.capacitaciones = m.capacitaciones;
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

    procedure prc_get_estimulos_semillero(p_id_semillero number, p_resultado out sys_refcursor) is
        vv_error varchar2(2000);
        vn_error number := 0;
    begin
        open p_resultado for
        select *
        from estimulos_semillero
        where id_semillero = p_id_semillero;
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
