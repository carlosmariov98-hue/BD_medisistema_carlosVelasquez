USE medisistema;

INSERT INTO medicos (nombre, apellidos, telefono, especialidad, tipo_medico, activo, numero_colegiado) VALUES
('Carlos', 'velasquez', '600111222', 'Medicina General', 'Titular', TRUE, 'COL001'),
('jhorman', 'peñaloza', '600222333', 'Pediatria', 'Titular', TRUE, 'COL002'),
('andres', 'jiemenez', '600333444', 'Medicina General', 'Interino', TRUE, 'COL003'),
('crisbely', 'graterol', '600444555', 'Medicina General', 'Sustituto', TRUE, 'COL004');


INSERT INTO empleados (nombre, apellidos, telefono, puesto, activo) VALUES
('jesus', 'salcedo', '600555666', 'Celador', TRUE),
('sofia', 'salazar', '600666777', 'Administrativo', TRUE),
('julio', 'jaramillo', '600777888', 'ATS', TRUE);


INSERT INTO pacientes (nombre, apellidos, id_medico_asignado, id_empleado_recepcion) VALUES
('daniel', 'vera', 1, 1),
('liam', 'angulo', 1, 2),
('narlis', 'moncada', 2, 1),
('Elena', 'sierra', 3, 2),
('David', 'gonzalez', 1, 1),
('Lucia', 'Vega', 2, 2);


INSERT INTO horario_consulta (id_medico, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'Lunes', '09:00', '13:00'),
(1, 'Miercoles', '09:00', '13:00'),
(2, 'Lunes', '10:00', '14:00'),
(2, 'Martes', '10:00', '14:00'),
(3, 'Jueves', '09:00', '12:00');


INSERT INTO sustitucion (id_medico_sustituto, id_medico_sustituido, fecha_inicio, fecha_fin) VALUES
(4, 1, '2026-09-01', '2026-09-10'),
(4, 2, '2026-10-01', NULL),
(3, 1, '2026-06-01', '2026-06-15');


INSERT INTO vacaciones (id_medico, id_empleado, dias_planificados, dias_disfrutados, estado) VALUES
(1, NULL, 20, 10, 'Planificada'),
(2, NULL, 15, 15, 'Disfrutada'),
(NULL, 1, 22, 5, 'Planificada'),
(NULL, 2, 22, 22, 'Disfrutada');