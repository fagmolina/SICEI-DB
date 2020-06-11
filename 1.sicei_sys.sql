alter session set "_oracle_script"=true;

create user sicei identified by "sicei123";

grant connect, resource, dba to sicei;

grant execute on dbms_crypto to sicei;