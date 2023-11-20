CREATE DATABASE odontologo;
USE odontologo;

/* Aquí se mantiene la tabla dia_agenda como estaba */
CREATE TABLE dia_agenda(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_dia VARCHAR(20) NOT NULL,
     creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Se mantiene la tabla area_personal como estaba */
CREATE TABLE area_personal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL,
     creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Se mantiene la tabla especialidad_personal como estaba */
CREATE TABLE especialidad_personal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    area_id INT,
    nombre_especialidad VARCHAR(250) NOT NULL,
    estado ENUM('activo','inactivo') DEFAULT 'activo',
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (area_id) REFERENCES area_personal(id)
);

/* Aquí se reemplaza la tabla personal y usuario por la tabla personal de sistemainicial */
CREATE TABLE personal (
    CI INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100) NOT NULL,
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Aquí se reemplaza la tabla usuario por la tabla usuario de sistemainicial */
CREATE TABLE usuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CI INT,
    Nombre_Usuario VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    FOREIGN KEY (CI) REFERENCES personal(CI),
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Aquí se reemplaza la tabla roles por la tabla roles de sistemainicial */
CREATE TABLE roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL,
    RoleDescription VARCHAR(255),
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Se mantiene la tabla usuario_roles de sistemainicial */
CREATE TABLE usuario_roles (
    UsuarioRoleID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    RoleID INT,
    FOREIGN KEY (UsuarioID) REFERENCES usuario(ID),
    FOREIGN KEY (RoleID) REFERENCES roles(RoleID),
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* ... Se mantiene el resto de las tablas sin cambios ... */


  CREATE TABLE ciudad (
  	id INT AUTO_INCREMENT PRIMARY KEY,
		usuario_id INT,
		nombre_ciudad VARCHAR(255) NOT NULL,
				 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		FOREIGN KEY (usuario_id) REFERENCES personal(CI)
  );
         
         CREATE TABLE tipo_cita (
		id INT AUTO_INCREMENT PRIMARY KEY,
		usuario_id INT,
		nombre_cita VARCHAR(255) NOT NULL,
				 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		FOREIGN KEY (usuario_id) REFERENCES personal(CI)
		);
              
      
  
    

	CREATE TABLE sala (
    id int auto_increment primary key,
    usuario_id int,
    nombre_sala varchar(250)  NOT NULL,
    numero_sala int,
 		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (usuario_id) REFERENCES personal(CI)
    );
      
         CREATE TABLE procedimiento (
			id INT AUTO_INCREMENT PRIMARY KEY,
			usuario_id int,
			descripcion VARCHAR(255) NOT NULL,
			precio decimal,
          		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			FOREIGN KEY (usuario_id) REFERENCES personal(CI)
		);
    
    
    
    	CREATE TABLE mensaje_predeterminado (
			id INT AUTO_INCREMENT PRIMARY KEY,
			usuario_id int,
           	contenido TEXT NOT NULL,
					 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			FOREIGN KEY (usuario_id) REFERENCES personal(CI)
        );
        
        
        /*Ficha de Agenda para libreta*/
                
        
	CREATE TABLE libreta_agenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personal_id INT,
    sala_id INT,
	dia_id INT,
    hora_desde time,
    hora_hasta time,
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY (personal_id) REFERENCES personal(CI),
    FOREIGN KEY (dia_id) REFERENCES dia_agenda(id),
    FOREIGN KEY (sala_id) REFERENCES sala(id)
);

         CREATE TABLE paciente(
		ci int primary key,
        personal_id INT, 
        nombre varchar(250) not null,
        apellido varchar(250) not null,
        telefono varchar(20) not null,
        id_ciudad int,
       		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		FOREIGN KEY (personal_id) REFERENCES personal(CI),
        FOREIGN KEY (id_ciudad) REFERENCES ciudad(id)
		);
            
        
        CREATE TABLE cita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_ci INT,
    libreta_agenda_id INT,
    tipo_cita_id INT,
    fecha_cita DATE,
    hora_cita time,
    estado_cita ENUM('pendiente', 'confirmada', 'cancelada') DEFAULT 'pendiente',
		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_ci) REFERENCES paciente(ci),
    FOREIGN KEY (libreta_agenda_id) REFERENCES libreta_agenda(id),
    FOREIGN KEY (tipo_cita_id) REFERENCES tipo_cita(id),
    UNIQUE (fecha_cita, hora_cita)
);
         
 
      CREATE TABLE tipo_comunicacion (
			id INT AUTO_INCREMENT PRIMARY KEY,
			usuario_id int,
			tipo_comunicacion varchar(250) NOT NULL,
					 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			FOREIGN KEY (usuario_id) REFERENCES personal(CI)
        );
    
    
   CREATE TABLE recordatorios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id int,
    tipo_id INT,
    cita_id INT,
    mensaje_predeterminado_id INT,
			 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cita_id) REFERENCES cita(id),
    FOREIGN KEY (mensaje_predeterminado_id) REFERENCES mensaje_predeterminado(id),
     FOREIGN KEY (tipo_id) REFERENCES tipo_comunicacion(id),
    FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);

CREATE TABLE historial_recordatorios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recordatorio_id INT,
    usuario_id INT,
    tipo_comunicacion_id INT,
    contenido_o_detalle TEXT,
    tipo ENUM('enviado', 'recibido', 'llamada_realizada', 'llamada_recibida'),
    estado ENUM('exitoso', 'fallido', 'pendiente'),
    respuesta_recibida TEXT,
    fecha_comunicacion DATETIME,
 		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (recordatorio_id) REFERENCES recordatorios(id),
    FOREIGN KEY (tipo_comunicacion_id) REFERENCES tipo_comunicacion(id),
    FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);



CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id int,
    cita_id INT,
    tipo_documento VARCHAR(255),
    archivo BLOB,  -- o la ruta del archivo
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cita_id) REFERENCES cita(id),
    FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);

	 /* Inicio con la creacion tablas para el modulo consulta*/
     CREATE TABLE alergia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nombre_alergia VARCHAR(255) NOT NULL,
    descripcion TEXT,
 		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id)
        REFERENCES personal (CI)
);
     
    CREATE TABLE ficha_medica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    paciente_ci INT UNIQUE,  
    fecha_creacion DATE NOT NULL,
    antecedentes TEXT,
    observaciones TEXT,
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_ci) REFERENCES paciente(ci),
    FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);

CREATE TABLE ficha_medica_alergia (
    ficha_medica_id INT,
    alergia_id INT,
    		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (ficha_medica_id, alergia_id),
    FOREIGN KEY (ficha_medica_id) REFERENCES ficha_medica(id),
    FOREIGN KEY (alergia_id) REFERENCES alergia(id)
);

CREATE TABLE odontograma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ficha_medica_id INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    fecha_modificacion DATE,
    usuario_id INT,
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      FOREIGN KEY (ficha_medica_id) REFERENCES ficha_medica(id),
        FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);

 CREATE TABLE cuadrante (
		id INT AUTO_INCREMENT PRIMARY KEY,
		usuario_id INT,
		nombre_cuadrante VARCHAR(255) NOT NULL,
				 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		FOREIGN KEY (usuario_id) REFERENCES personal(CI)
		);

  CREATE TABLE diente (
		id INT AUTO_INCREMENT PRIMARY KEY,
		usuario_id INT,
        cuadrante_ind INT,
		nombre_diente VARCHAR(255) NOT NULL,
		posicion_diente INT NOT NULL,
			 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		FOREIGN KEY (usuario_id) REFERENCES personal(CI),
        FOREIGN KEY (cuadrante_ind) REFERENCES cuadrante(id)
		);

CREATE TABLE estado_diente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    descripcion VARCHAR(255) NOT NULL,
    		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);

CREATE TABLE diente_estado (
    diente_id INT,
    estado_diente_id INT,
    fecha_registro DATE NOT NULL,
    usuario_id INT,
    		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (diente_id, estado_diente_id, fecha_registro),
    FOREIGN KEY (diente_id) REFERENCES diente(id),
    FOREIGN KEY (estado_diente_id) REFERENCES estado_diente(id),
    FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);



CREATE TABLE tratamiento_diente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL,
    descripcion TEXT,
    		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);


CREATE TABLE diagnostico_diente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    odontograma_id INT NOT NULL,
    diente_id INT NOT NULL,
    estado_diente_id INT,
    tratamiento_id INT,
    observacion TEXT,
    fecha_diagnostico DATE NOT NULL,
  		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (odontograma_id) REFERENCES odontograma(id),
    FOREIGN KEY (diente_id) REFERENCES diente(id),
    FOREIGN KEY (estado_diente_id) REFERENCES estado_diente(id),
    FOREIGN KEY (tratamiento_id) REFERENCES tratamiento_diente(id)
);

CREATE TABLE presupuesto (
id int AUTO_INCREMENT PRIMARY KEY,
usuario_id int,
diag_id int,
total_presupuesto decimal,
		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key (diag_id) references diagnostico_diente(id),
FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);

CREATE TABLE descuento_promo(
id int Auto_increment primary key,
usuario_id int,
nombre_desc varchar(250) not null,
porcentaje_desc int,
		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);
   
   CREATE TABLE detalle_desc_pres(
     presupuesto_id INT,
    descuento_id INT,
    		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     PRIMARY KEY (presupuesto_id, descuento_id),
    FOREIGN KEY (presupuesto_id) REFERENCES presupuesto(id),
    FOREIGN KEY (descuento_id) REFERENCES descuento_promo(id)
   );
   
   CREATE TABLE historial_consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT NOT NULL,
    odontograma_id INT,
    observaciones TEXT,
    fecha_consulta DATE NOT NULL,
    fecha_auditoria DATETIME NOT NULL,
    FOREIGN KEY (cita_id) REFERENCES cita(id),
    FOREIGN KEY (odontograma_id) REFERENCES odontograma(id)
);


CREATE TABLE tipo_estudio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nombre_estudio VARCHAR(255) NOT NULL,
    descripcion TEXT,
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES personal(CI)
);

CREATE TABLE orden_estudio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    paciente_ci INT,
    tipo_estudio_id INT,
    fecha_solicitud DATE NOT NULL,
    fecha_programada DATE,
    observaciones TEXT,
    estado_orden_estudio ENUM('solicitado', 'programado', 'realizado', 'cancelado') DEFAULT 'solicitado',
  		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_ci) REFERENCES paciente(ci),
    FOREIGN KEY (usuario_id) REFERENCES personal(CI),
    FOREIGN KEY (tipo_estudio_id) REFERENCES tipo_estudio(id)
);


CREATE TABLE resultados_estudio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_estudio_id INT,
    archivo_resultado BLOB, 
    comentarios TEXT,
    		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (orden_estudio_id) REFERENCES orden_estudio(id)
);

CREATE TABLE analisis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resultados_estudio_id INT,
    descripcion TEXT,
    fecha_analisis DATE NOT NULL,
    recomendaciones TEXT,
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (resultados_estudio_id) REFERENCES resultados_estudio(id)
);
 CREATE TABLE droga (
    id int auto_increment primary key,
    usuario_id int,
    nombre_droga varchar(250)  NOT NULL,
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (usuario_id) REFERENCES personal(CI)
    );
    CREATE TABLE marca (
    id INT auto_increment primary key,
    usuario_id int,
    nombre_marca varchar(250) not null,
   		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (usuario_id) REFERENCES personal(CI)
    );
  
	
      CREATE TABLE medicamento (
		id int auto_increment primary key,
		usuario_id int,
		droga_id int,
        marca_id int,
		nombre_medicamento varchar(250)  NOT NULL,
				 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		FOREIGN KEY (usuario_id) REFERENCES personal(CI),
		foreign key (droga_id) references droga(id),
        foreign key (marca_id) references marca(id)
    );
    
CREATE TABLE recetario_indicaciones(
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT,
paciente_id INT,
medicamento_id INT,
indicacione TEXT NOT NULL,
		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (usuario_id) REFERENCES personal(CI),
FOREIGN KEY (paciente_id) REFERENCES paciente(ci),
FOREIGN KEY (medicamento_id) REFERENCES medicamento(id)
);

  CREATE TABLE justificativo_medico (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paciente_id INT,
  usuario_id INT,
  fecha_justificativo INT,
  justificativo TEXT,
  		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES personal(CI),
  FOREIGN KEY (paciente_id) REFERENCES paciente(ci)
  );
  
  CREATE TABLE insumos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT,
  nombre_insumo VARCHAR(250) NOT NULL,
  cantidad_insumo INT,
  		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY (usuario_id) REFERENCES personal(CI)
  );
  
  CREATE TABLE uso_insumos_procedimiento(
   procedimiento_id INT,
    insumo_id INT,
    usados INT,
    		 creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     PRIMARY KEY (procedimiento_id, insumo_id),
    FOREIGN KEY (procedimiento_id) REFERENCES procedimiento(id),
    FOREIGN KEY (insumo_id) REFERENCES insumos(id)
);