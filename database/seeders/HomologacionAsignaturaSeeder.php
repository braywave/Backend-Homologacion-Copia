<?php

namespace Database\Seeders;

use App\Models\HomologacionAsignatura;
use Illuminate\Database\Seeder;

class HomologacionAsignaturaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        // Solicitud 1 (usuario_id = 1)
        //
        HomologacionAsignatura::create([
            'solicitud_id'           => 1,
            'asignatura_origen_id'   => 1,    // Circuitos Eléctricos (Unicauca)
            'asignatura_destino_id'  => 165,  // IS_S1_M1: Matemáticas I (Autónoma)
            'nota_destino'           => 4.1,
            'comentarios'            => 'Temario coincidente en un 90%.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 1,
            'asignatura_origen_id'   => 2,    // Electrónica Analógica
            'asignatura_destino_id'  => 166,  // IS_S1_M2: Física I (Autónoma)
            'nota_destino'           => 3.9,
            'comentarios'            => 'Faltan prácticas de laboratorio.',
        ]);

        //
        // Solicitud 2 (usuario_id = 2)
        //
        HomologacionAsignatura::create([
            'solicitud_id'           => 2,
            'asignatura_origen_id'   => 46,   // Programación I (FUP)
            'asignatura_destino_id'  => 167,  // IS_S1_M3: Programación I
            'nota_destino'           => 4.7,
            'comentarios'            => 'Nivel y profundidad adecuados.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 2,
            'asignatura_origen_id'   => 47,   // Estructuras de Datos (FUP)
            'asignatura_destino_id'  => 168,  // IS_S1_M4: Comunicación Oral y Escrita
            'nota_destino'           => null,
            'comentarios'            => 'Pendiente plan de clases detallado.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 2,
            'asignatura_origen_id'   => 48,   // Arquitectura de Computadores
            'asignatura_destino_id'  => 169,  // IS_S1_M5: Fundamentos de Ingeniería de Software
            'nota_destino'           => 4.3,
            'comentarios'            => 'Buen ajuste de competencias.',
        ]);

        //
        // Solicitud 3 (usuario_id = 3)
        //
        HomologacionAsignatura::create([
            'solicitud_id'           => 3,
            'asignatura_origen_id'   => 101,  // Analizar Requerimientos (SENA)
            'asignatura_destino_id'  => 170,  // IS_S2_M1: Matemáticas II
            'nota_destino'           => null,
            'comentarios'            => 'Requiere validar conceptos avanzados.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 3,
            'asignatura_origen_id'   => 102,  // Diseñar Soluciones Software
            'asignatura_destino_id'  => 171,  // IS_S2_M2: Física II
            'nota_destino'           => 4.0,
            'comentarios'            => 'Contenido teórico cubierto.',
        ]);

        //
        // Solicitud 4 (usuario_id = 4)
        //
        HomologacionAsignatura::create([
            'solicitud_id'           => 4,
            'asignatura_origen_id'   => 73,   // Fundamentos de Programación (Colegio Mayor)
            'asignatura_destino_id'  => 172,  // IS_S2_M3: Programación II
            'nota_destino'           => 4.2,
            'comentarios'            => 'Ejercicios prácticos suficientes.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 4,
            'asignatura_origen_id'   => 74,   // Estructuras de Datos
            'asignatura_destino_id'  => 173,  // IS_S2_M4: Lógica y Matemática Discreta
            'nota_destino'           => null,
            'comentarios'            => 'Falta evidencia de proyecto.',
        ]);

        //
        // Solicitud 5 (usuario_id = 5)
        //
        HomologacionAsignatura::create([
            'solicitud_id'           => 5,
            'asignatura_origen_id'   => 3,    // Electrónica Digital (Unicauca)
            'asignatura_destino_id'  => 174,  // IS_S2_M5: Arquitectura de Computadores
            'nota_destino'           => 4.5,
            'comentarios'            => 'Coincidencia de laboratorio alta.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 5,
            'asignatura_origen_id'   => 4,    // Comunicación Digital
            'asignatura_destino_id'  => 175,  // IS_S3_M1: Estructuras de Datos
            'nota_destino'           => null,
            'comentarios'            => 'Syllabus incompleto.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 5,
            'asignatura_origen_id'   => 5,    // Microcontroladores
            'asignatura_destino_id'  => 176,  // IS_S3_M2: Bases de Datos I
            'nota_destino'           => 4.1,
            'comentarios'            => 'Buenas prácticas incluidas.',
        ]);

        //
        // Solicitud 6 (usuario_id = 6)
        //
        HomologacionAsignatura::create([
            'solicitud_id'           => 6,
            'asignatura_origen_id'   => 103,  // Desarrollar Aplicaciones (SENA)
            'asignatura_destino_id'  => 177,  // IS_S3_M3: Ingeniería de Requisitos
            'nota_destino'           => 3.8,
            'comentarios'            => 'Evaluación práctica pendiente.',
        ]);
        HomologacionAsignatura::create([
            'solicitud_id'           => 6,
            'asignatura_origen_id'   => 104,  // Realizar Pruebas de Software
            'asignatura_destino_id'  => 178,  // IS_S3_M4: Probabilidad y Estadística
            'nota_destino'           => null,
            'comentarios'            => 'Falta plan de análisis de datos.',
        ]);
    }
}
