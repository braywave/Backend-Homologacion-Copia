<?php

namespace Database\Seeders;

use App\Models\Asignatura;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class AsignaturaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // FUP
        Asignatura::create([
            'programa_id' => 5,
            'nombre' => 'Lógica de Programación',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'FUP001',
            'creditos' => 3,
            'semestre' => 1,
            'tiempo_presencial' => 2,
            'tiempo_independiente' => 4,
            'horas_totales_semanales' => 6,
            'modalidad' => 'Teórico-Práctico',
            'metodologia' => 'Presencial',
        ]);

        Asignatura::create([
            'programa_id' => 5,
            'nombre' => 'Fundamentos de Bases de Datos',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'FUP002',
            'creditos' => 3,
            'semestre' => 2,
            'tiempo_presencial' => 2,
            'tiempo_independiente' => 4,
            'horas_totales_semanales' => 6,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);


        // COLEGIO MAYOR
        Asignatura::create([
            'programa_id' => 6,
            'nombre' => 'Matemáticas Básicas',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'CM001',
            'creditos' => 2,
            'semestre' => 1,
            'tiempo_presencial' => 2,
            'tiempo_independiente' => 2,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        Asignatura::create([
            'programa_id' => 6,
            'nombre' => 'Contabilidad General',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'CM002',
            'creditos' => 3,
            'semestre' => 2,
            'tiempo_presencial' => 3,
            'tiempo_independiente' => 3,
            'horas_totales_semanales' => 6,
            'modalidad' => 'Teórico-Práctico',
            'metodologia' => 'Presencial',
        ]);

        // CAUCA


        Asignatura::create([
            'programa_id' => 4,
            'nombre' => 'Cálculo Diferencial',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'UC001',
            'creditos' => 4,
            'semestre' => 1,
            'tiempo_presencial' => 4,
            'tiempo_independiente' => 4,
            'horas_totales_semanales' => 8,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        Asignatura::create([
            'programa_id' => 4,
            'nombre' => 'Introducción a la Electrónica',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'UC002',
            'creditos' => 3,
            'semestre' => 2,
            'tiempo_presencial' => 3,
            'tiempo_independiente' => 3,
            'horas_totales_semanales' => 6,
            'modalidad' => 'Teórico-Práctico',
            'metodologia' => 'Presencial',
        ]);



        // SENA
        Asignatura::create([
            'programa_id' => 3,
            'nombre' => 'Desarrollar software de acuerdo con los requerimientos',
            'tipo' => 'Competencia',
            'codigo_asignatura' => 'SENA001',
            'horas_sena' => 240,
            'semestre' => 1,
            'tiempo_presencial' => 12,
            'tiempo_independiente' => 8,
            'horas_totales_semanales' => 20,
            'modalidad' => 'Teórico-Práctico',
            'metodologia' => 'Presencial',
        ]);

        Asignatura::create([
            'programa_id' => 3,
            'nombre' => 'Aplicar buenas prácticas de desarrollo',
            'tipo' => 'Competencia',
            'codigo_asignatura' => 'SENA002',
            'horas_sena' => 180,
            'semestre' => 2,
            'tiempo_presencial' => 10,
            'tiempo_independiente' => 5,
            'horas_totales_semanales' => 15,
            'modalidad' => 'Práctico',
            'metodologia' => 'Presencial',
        ]);


        // AUTÓNOMA DEL CAUCA - Ingeniería de Software
        $programaId = 12; // ID del programa de Ingeniería de Software en la Autónoma

        $codigoBase = 'IS'; // Prefijo base para Ingeniería de Software

        $pensum = [
            1 => ['Matemáticas I', 'Física I', 'Programación I', 'Comunicación Oral y Escrita', 'Fundamentos de Ingeniería de Software'],
            2 => ['Matemáticas II', 'Física II', 'Programación II', 'Lógica y Matemática Discreta', 'Arquitectura de Computadores'],
            3 => ['Estructuras de Datos', 'Bases de Datos I', 'Ingeniería de Requisitos', 'Probabilidad y Estadística', 'Sistemas Operativos'],
            4 => ['Bases de Datos II', 'Diseño de Software', 'Ingeniería de Software I', 'Análisis y Diseño de Algoritmos', 'Redes de Computadores'],
            5 => ['Lenguajes de Programación', 'Seguridad Informática', 'Gestión de Proyectos de Software', 'Desarrollo Web', 'Electiva Profesional I'],
            6 => ['Ingeniería de Software II', 'Desarrollo de Aplicaciones Móviles', 'Computación en la Nube', 'Interacción Humano-Computador', 'Electiva Profesional II'],
            7 => ['Inteligencia Artificial', 'Arquitectura de Software', 'Auditoría y Normatividad en Software', 'Electiva Profesional III', 'Práctica Empresarial I'],
            8 => ['Minería de Datos', 'DevOps y Automatización', 'Ética Profesional', 'Electiva Profesional IV', 'Práctica Empresarial II'],
            9 => ['Trabajo de Grado', 'Emprendimiento y Nuevas Tecnologías'],
        ];

        foreach ($pensum as $semestre => $asignaturas) {
            foreach ($asignaturas as $index => $nombre) {
                Asignatura::create([
                    'programa_id' => $programaId,
                    'nombre' => $nombre,
                    'tipo' => 'Materia',
                    'codigo_asignatura' => $codigoBase . '_S' . $semestre . '_M' . ($index + 1),
                    'creditos' => 3,
                    'semestre' => $semestre,
                    'horas_sena' => null,
                    'tiempo_presencial' => 2,
                    'tiempo_independiente' => 4,
                    'horas_totales_semanales' => 6,
                    'modalidad' => 'Teórico-Práctico',
                    'metodologia' => 'Presencial',
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
