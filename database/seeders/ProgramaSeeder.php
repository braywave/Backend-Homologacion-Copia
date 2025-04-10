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
        // Universidad del Cauca - Facultad de Ciencias de la Salud
        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 1,
            'nombre' => 'Medicina',
            'codigo_snies' => '12345',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 1,
            'nombre' => 'Enfermería',
            'codigo_snies' => '12346',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Universidad del Cauca - Facultad de Ingeniería Civil
        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 2,
            'nombre' => 'Ingeniería Civil',
            'codigo_snies' => '12347',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Universidad del Cauca - Facultad de Derecho, Ciencias Políticas y Sociales
        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 3,
            'nombre' => 'Derecho',
            'codigo_snies' => '12348',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Universidad del Cauca - Facultad de Ciencias Contables, Económicas y Administrativas
        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 4,
            'nombre' => 'Contaduría Pública',
            'codigo_snies' => '12349',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Corporación Universitaria Autónoma del Cauca - Facultad de Ciencias Administrativas, Contables y Económicas
        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 5,
            'nombre' => 'Administración de Empresas',
            'codigo_snies' => '12350',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Institución Universitaria Colegio Mayor del Cauca - Facultad de Arte y Diseño
        Programa::create([
            'institucion_id' => 4,
            'facultad_id' => 6,
            'nombre' => 'Diseño Visual',
            'codigo_snies' => '12351',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Institución Universitaria Colegio Mayor del Cauca - Facultad de Ingeniería
        Programa::create([
            'institucion_id' => 4,
            'facultad_id' => 7,
            'nombre' => 'Ingeniería de Software',
            'codigo_snies' => '12352',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Fundación Universitaria de Popayán - Facultad de Ciencias Sociales y Humanas
        Programa::create([
            'institucion_id' => 5,
            'facultad_id' => 8,
            'nombre' => 'Psicología',
            'codigo_snies' => '3087',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Fundación Universitaria de Popayán - Facultad de Ciencias Económicas, Contables y Administrativas
        Programa::create([
            'institucion_id' => 5,
            'facultad_id' => 9,
            'nombre' => 'Administración de Empresas',
            'codigo_snies' => '12353',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // Corporación Universitaria Comfacauca - UNICOMFACAUCA - Facultad de Humanidades, Artes, Ciencias Sociales y de Educación
        Programa::create([
            'institucion_id' => 6,
            'facultad_id' => 10,
            'nombre' => 'Comunicación Social y Periodismo',
            'codigo_snies' => '101439',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 6,
            'facultad_id' => 10,
            'nombre' => 'Trabajo Social',
            'codigo_snies' => '110464',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        // SENA - Centro de Teleinformática y Producción Industrial
        Programa::create([
            'institucion_id' => 2, // ID correspondiente al SENA en tu base de datos
            'facultad_id' => null, // El SENA no maneja facultades como las universidades
            'nombre' => 'Análisis y Desarrollo de Sistemas de Información',
            'codigo_snies' => null, // El SENA no utiliza códigos SNIES
            'tipo_formacion' => 'Tecnólogo',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Gestión de Redes de Datos',
            'codigo_snies' => null,
            'tipo_formacion' => 'Tecnólogo',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Mantenimiento de Equipos de Cómputo',
            'codigo_snies' => null,
            'tipo_formacion' => 'Técnico',
            'metodologia' => 'Presencial',
        ]);

        // SENA - Centro de Comercio y Servicios
        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Gestión Empresarial',
            'codigo_snies' => null,
            'tipo_formacion' => 'Tecnólogo',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Contabilización de Operaciones Comerciales y Financieras',
            'codigo_snies' => null,
            'tipo_formacion' => 'Técnico',
            'metodologia' => 'Presencial',
        ]);

        // SENA - Centro Agropecuario
        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Producción Agropecuaria',
            'codigo_snies' => null,
            'tipo_formacion' => 'Técnico',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 2,
            'facultad_id' => null,
            'nombre' => 'Agricultura de Precisión',
            'codigo_snies' => null,
            'tipo_formacion' => 'Tecnólogo',
            'metodologia' => 'Presencial',
        ]);

    }
}
