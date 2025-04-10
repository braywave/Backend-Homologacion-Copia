<?php

namespace Database\Seeders;

use App\Models\Asignatura;
use Illuminate\Database\Seeder;

class AsignaturaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Medicina
        Asignatura::create([
            'programas_id' => 1,
            'nombre' => 'Anatomía Humana',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'MED101',
            'creditos' => 5,
            'semestre' => 1,
            'horas' => 80,
            'tiempo_presencial' => 56,
            'tiempo_independiente' => 24,
            'horas_totales_semanales' => 6,
            'modalidad' => 'Teórico-Práctico',
            'metodologia' => 'Presencial',
        ]);

        Asignatura::create([
            'programas_id' => 1,
            'nombre' => 'Fisiología',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'MED102',
            'creditos' => 4,
            'semestre' => 2,
            'horas' => 64,
            'tiempo_presencial' => 40,
            'tiempo_independiente' => 24,
            'horas_totales_semanales' => 5,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        // Enfermería
        Asignatura::create([
            'programas_id' => 2,
            'nombre' => 'Fundamentos de Enfermería',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'ENF101',
            'creditos' => 3,
            'semestre' => 1,
            'horas' => 48,
            'tiempo_presencial' => 32,
            'tiempo_independiente' => 16,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Práctico',
            'metodologia' => 'Presencial',
        ]);

        // Derecho
        Asignatura::create([
            'programas_id' => 4,
            'nombre' => 'Derecho Constitucional',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'DER101',
            'creditos' => 4,
            'semestre' => 1,
            'horas' => 64,
            'tiempo_presencial' => 40,
            'tiempo_independiente' => 24,
            'horas_totales_semanales' => 5,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        // Psicología
        Asignatura::create([
            'programas_id' => 9,
            'nombre' => 'Psicología del Desarrollo',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'PSI101',
            'creditos' => 3,
            'semestre' => 1,
            'horas' => 48,
            'tiempo_presencial' => 32,
            'tiempo_independiente' => 16,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        // Contaduría Pública
        Asignatura::create([
            'programas_id' => 5,
            'nombre' => 'Contabilidad Básica',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'CON101',
            'creditos' => 3,
            'semestre' => 1,
            'horas' => 48,
            'tiempo_presencial' => 32,
            'tiempo_independiente' => 16,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Teórico-Práctico',
            'metodologia' => 'Presencial',
        ]);

        // Comunicación Social y Periodismo
        Asignatura::create([
            'programas_id' => 11,
            'nombre' => 'Teoría de la Comunicación',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'COM101',
            'creditos' => 4,
            'semestre' => 1,
            'horas' => 64,
            'tiempo_presencial' => 40,
            'tiempo_independiente' => 24,
            'horas_totales_semanales' => 5,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        // Administración de Empresas (Autónoma)
        Asignatura::create([
            'programas_id' => 6,
            'nombre' => 'Introducción a la Administración',
            'tipo' => 'Materia',
            'codigo_asignatura' => 'ADM101',
            'creditos' => 3,
            'semestre' => 1,
            'horas' => 48,
            'tiempo_presencial' => 32,
            'tiempo_independiente' => 16,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        // Producción Agropecuaria (SENA)
        Asignatura::create([
            'programas_id' => 18,
            'nombre' => 'Manejo de Cultivos',
            'tipo' => 'Competencia',
            'codigo_asignatura' => 'AGRO101',
            'creditos' => 2,
            'semestre' => null,
            'horas' => 40,
            'tiempo_presencial' => 28,
            'tiempo_independiente' => 12,
            'horas_totales_semanales' => 3,
            'modalidad' => 'Práctico',
            'metodologia' => 'Presencial',
        ]);

    }
}
