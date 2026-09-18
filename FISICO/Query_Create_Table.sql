CREATE DATABASE IF NOT EXISTS medisistema;
USE medisistema;

CREATE TABLE medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    telefono VARCHAR(20),
    especialidad VARCHAR(50),
    tipo_medico ENUM('Titular', 'Interino', 'Sustituto'),
    activo BOOLEAN,
    numero_colegiado VARCHAR(20)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    telefono VARCHAR(20),
    puesto ENUM('ATS', 'Aux_enfermeria', 'Celador', 'Administrativo'),
    activo BOOLEAN
);

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    id_medico_asignado INT,
    id_empleado_recepcion INT,
    FOREIGN KEY (id_medico_asignado) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_empleado_recepcion) REFERENCES empleados(id_empleado)
);

CREATE TABLE horario_consulta (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT,
    dia_semana VARCHAR(15),
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE sustitucion (
    id_sustitucion INT AUTO_INCREMENT PRIMARY KEY,
    id_medico_sustituto INT,
    id_medico_sustituido INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_medico_sustituto) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_medico_sustituido) REFERENCES medicos(id_medico)
);

CREATE TABLE vacaciones (
    id_vacacion INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT,
    id_empleado INT,
    dias_planificados INT,
    dias_disfrutados INT,
    estado ENUM('Planificada', 'Disfrutada'),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);