<?php

namespace Database\Seeders;

use App\Models\Asignatura;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AsignaturasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Asignatura::create([
            'programas_id' => 3,
            'nombre' => 'Diseño Gráfico Digital',
            'tipo' => 'Competencia',
            'codigo_asignatura' => 'SENA102',
            'creditos' => 3,
            'semestre' => 1,
            'horas' => 48,
            'tiempo_presencial' => 32,
            'tiempo_independiente' => 16,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Teórico',
            'metodologia' => 'Virtual',
        ]);

        Asignatura::create([
            'programas_id' => 2,
            'nombre' => 'Mantenimiento de Equipos de Cómputo',
            'tipo' => 'Materias',
            'codigo_asignatura' => 'SENA103',
            'creditos' => 3,
            'semestre' => 2,
            'horas' => 48,
            'tiempo_presencial' => 32,
            'tiempo_independiente' => 16,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Práctico',
            'metodologia' => 'Presencial',
        ]);

        Asignatura::create([
            'programas_id' => 3,
            'nombre' => 'Estructuras de Datos',
            'tipo' => 'Materias',
            'codigo_asignatura' => 'UNI101',
            'creditos' => 4,
            'semestre' => 2,
            'horas' => 64,
            'tiempo_presencial' => 40,
            'tiempo_independiente' => 24,
            'horas_totales_semanales' => 5,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);

        Asignatura::create([
            'programas_id' => 2,
            'nombre' => 'Bases de Datos',
            'tipo' => 'Materias',
            'codigo_asignatura' => 'UNI102',
            'creditos' => 4,
            'semestre' => 2,
            'horas' => 64,
            'tiempo_presencial' => 40,
            'tiempo_independiente' => 24,
            'horas_totales_semanales' => 5,
            'modalidad' => 'Teórico-Práctico',
            'metodologia' => 'Virtual',
        ]);

        Asignatura::create([
            'programas_id' => 3,
            'nombre' => 'Redes de Computadoras',
            'tipo' => 'Materias',
            'codigo_asignatura' => 'UNI103',
            'creditos' => 3,
            'semestre' => 3,
            'horas' => 48,
            'tiempo_presencial' => 32,
            'tiempo_independiente' => 16,
            'horas_totales_semanales' => 4,
            'modalidad' => 'Teórico',
            'metodologia' => 'Presencial',
        ]);
    }
}
