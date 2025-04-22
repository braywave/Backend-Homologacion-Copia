<?php

namespace Database\Seeders;

use App\Models\Programa;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProgramaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        // UNICAUCA
        Programa::create([
            'institucion_id' => 5,
            'facultad_id' => 7, // Facultad de Derecho, Ciencias Políticas y Sociales
            'nombre' => 'Derecho',
            'codigo_snies' => '1110',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 5,
            'facultad_id' => 5, // Facultad de Ciencias Humanas y Sociales
            'nombre' => 'Antropología',
            'codigo_snies' => '1055',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 5,
            'facultad_id' => 1, // Facultad de Artes
            'nombre' => 'Artes Plásticas',
            'codigo_snies' => '1073',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 5,
            'facultad_id' => 6, // Facultad de Ciencias Naturales, Exactas y de la Educación
            'nombre' => 'Biología',
            'codigo_snies' => '2849',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 5,
            'facultad_id' => 9, // Facultad de Ingeniería Electrónica y Telecomunicaciones
            'nombre' => 'Ingeniería Electrónica y de Telecomunicaciones',
            'codigo_snies' => '3104',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // FUP
        Programa::create([
            'institucion_id' => 4,
            'facultad_id' => 10, // Facultad de Ingeniería y Arquitectura
            'nombre' => 'Ingeniería de Sistemas',
            'codigo_snies' => '2612',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 4,
            'facultad_id' => 10, // Facultad de Ingeniería y Arquitectura
            'nombre' => 'Ingeniería Industrial',
            'codigo_snies' => '2555',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 4,
            'facultad_id' => 10, // Facultad de Ingeniería y Arquitectura
            'nombre' => 'Arquitectura',
            'codigo_snies' => '3615',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 4,
            'facultad_id' => 12, // Facultad de Ciencias Económicas, Contables y Administrativas
            'nombre' => 'Contaduría Pública',
            'codigo_snies' => '54462',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 4,
            'facultad_id' => 12, // Facultad de Ciencias Económicas, Contables y Administrativas
            'nombre' => 'Administración de Empresas',
            'codigo_snies' => '105530',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // AUTONOMA
        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 16, // Facultad de Ciencias Sociales y Humanas
            'nombre' => 'Derecho',
            'codigo_snies' => '20434',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 15, // Facultad de Ingeniería
            'nombre' => 'Ingeniería de Software y Computación',
            'codigo_snies' => '110398',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 15, // Facultad de Ingeniería
            'nombre' => 'Ingeniería Electrónica',
            'codigo_snies' => '20415',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 14, // Facultad de Ciencias Administrativas y Contables
            'nombre' => 'Administración de Empresas',
            'codigo_snies' => '19828',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 14, // Facultad de Ciencias Administrativas y Contables
            'nombre' => 'Contaduría Pública',
            'codigo_snies' => '103461',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Colegio Mayor
        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 13, // Ciencias Empresariales
            'nombre' => 'Administración de Empresas',
            'codigo_snies' => '54560',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 13, // Ciencias Empresariales
            'nombre' => 'Contaduría Pública',
            'codigo_snies' => '109053',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 14, // Ingeniería
            'nombre' => 'Ingeniería en Sistemas',
            'codigo_snies' => '106716',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 14, // Ingeniería
            'nombre' => 'Ingeniería Electrónica',
            'codigo_snies' => '54559',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 15, // Ciencias Sociales y de la Educación
            'nombre' => 'Licenciatura en Educación Infantil',
            'codigo_snies' => '106715',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);


        // SENA
        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null, // No aplica para SENA
            'nombre' => 'Tecnólogo en Análisis y Desarrollo de Software',
            'codigo_snies' => null,
            'tipo_formacion' => 'Tecnólogo',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Técnico en Asistencia Administrativa',
            'codigo_snies' => null,
            'tipo_formacion' => 'Técnico',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Tecnólogo en Gestión Contable y Financiera',
            'codigo_snies' => null,
            'tipo_formacion' => 'Tecnólogo',
            'metodologia' => 'Presencial',
        ]);


    }
}
