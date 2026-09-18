USE medisistema;

-- 1. **Número de pacientes atendidos por cada médico**
SELECT m.id_medico, m.nombre, m.apellidos, COUNT(p.id_paciente) AS num_pacientes
FROM medicos m
LEFT JOIN pacientes p ON p.id_medico_asignado = m.id_medico
GROUP BY m.id_medico, m.nombre, m.apellidos;

-- 2. **Total de días de vacaciones planificadas y disfrutadas por cada empleado**
SELECT e.id_empleado, e.nombre, e.apellidos,
       SUM(v.dias_planificados) AS total_planificados,
       SUM(v.dias_disfrutados) AS total_disfrutados
FROM empleados e
LEFT JOIN vacaciones v ON v.id_empleado = e.id_empleado
GROUP BY e.id_empleado, e.nombre, e.apellidos;

-- 3. **Médicos con mayor cantidad de horas de consulta en la semana**
SELECT m.id_medico, m.nombre, m.apellidos,
       SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas_semanales
FROM medicos m
JOIN horario_consulta h ON h.id_medico = m.id_medico
GROUP BY m.id_medico, m.nombre, m.apellidos
ORDER BY horas_semanales DESC;

-- 4.  **Número de sustituciones realizadas por cada médico sustituto**
SELECT m.id_medico, m.nombre, m.apellidos, COUNT(s.id_sustitucion) AS num_sustituciones
FROM medicos m
JOIN sustitucion s ON s.id_medico_sustituto = m.id_medico
GROUP BY m.id_medico, m.nombre, m.apellidos;

-- 5.  **Número de médicos que están actualmente en sustitución**
SELECT COUNT(DISTINCT id_medico_sustituido) AS medicos_en_sustitucion
FROM sustitucion
WHERE fecha_fin IS NULL OR CURDATE() BETWEEN fecha_inicio AND fecha_fin;

-- 6. **Horas totales de consulta por médico por día de la semana**
SELECT m.id_medico, m.nombre, m.apellidos, h.dia_semana,
       SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas
FROM medicos m
JOIN horario_consulta h ON h.id_medico = m.id_medico
GROUP BY m.id_medico, m.nombre, m.apellidos, h.dia_semana
ORDER BY m.id_medico, h.dia_semana;

-- 7.  **Médico con mayor cantidad de pacientes asignados**
SELECT m.id_medico, m.nombre, m.apellidos, COUNT(p.id_paciente) AS num_pacientes
FROM medicos m
JOIN pacientes p ON p.id_medico_asignado = m.id_medico
GROUP BY m.id_medico, m.nombre, m.apellidos
ORDER BY num_pacientes DESC
LIMIT 1;