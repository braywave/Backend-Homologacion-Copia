<?php

namespace Database\Seeders;

use App\Models\Facultad;
use App\Models\Facultades;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FacultadSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ciencias de la Salud',
        ]);

        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ingeniería Civil',
        ]);

        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Derecho, Ciencias Políticas y Sociales',
        ]);

        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ciencias Contables, Económicas y Administrativas',
        ]);

        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ciencias Naturales, Exactas y de la Educación',
        ]);

        Facultad::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ciencias Administrativas, Contables y Económicas',
        ]);

        Facultad::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Derecho, Ciencias Sociales y Políticas',
        ]);

        Facultad::create([
            'institucion_id' => 4,
            'nombre' => 'Facultad de Arte y Diseño',
        ]);

        Facultad::create([
            'institucion_id' => 4,
            'nombre' => 'Facultad de Ciencias Sociales y de la Administración',
        ]);

        Facultad::create([
            'institucion_id' => 4,
            'nombre' => 'Facultad de Ingeniería',
        ]);

        // FUP
        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ingeniería y Arquitectura',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Educación',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ciencias Sociales y Humanas',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ciencias Económicas, Contables y Administrativas',
        ]);

        Facultad::create([
            'institucion_id' => 6,
            'nombre' => 'Facultad de Humanidades, Artes, Ciencias Sociales y de Educación',
        ]);

    }
}
