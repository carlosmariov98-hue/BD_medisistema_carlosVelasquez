# MediSistema

Base de datos para gestionar médicos, empleados y pacientes de un centro de salud.

## Contenido del repositorio
01_Query_create_Table.sql — creación de la base de datos y las tablas.

02_Query_Insert.sql — datos de prueba para probar las consultas.

03_Query_consultas.sql — consultas solicitadas.

04_relacion_entidades.png - relación de entidades

05_modelo_logico.png - modelo lógico 

## Estructura de la base de datos
medicos: datos del médico, tipo (titular, interino, sustituto) y estado activo.

empleados: personal no médico (ATS, auxiliar de enfermería, celador, administrativo).

pacientes: cada paciente tiene un médico asignado y un empleado que lo recibió.

horario_consulta: horarios semanales de cada médico.

sustitucion: registro de qué médico sustituye a cuál y en qué fechas.

vacaciones: días planificados y disfrutados, tanto de médicos como de empleados.

## Consultas
#1.Número de pacientes atendidos por cada médico.

#2.Total de días de vacaciones planificadas y disfrutadas por empleado.

#3.Médicos con más horas de consulta a la semana.

#4.Número de sustituciones por médico sustituto.

#5.Médicos actualmente en sustitución.

#6.Horas de consulta por médico y día de la semana.

#7.Médico con más pacientes asignados.
