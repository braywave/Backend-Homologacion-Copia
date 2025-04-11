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
        /* Facultad de universidad del cauca */

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Artes',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ciencias Agrarias',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ciencias de la Salud',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ciencias Contables, Económicas y Administrativas',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ciencias Humanas y Sociales',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ciencias Naturales, Exactas y de la Educación',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Derecho, Ciencias Políticas y Sociales',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ingeniería Civil',
        ]);

        Facultad::create([
            'institucion_id' => 5,
            'nombre' => 'Facultad de Ingeniería Electrónica y Telecomunicaciones',
        ]);

        /* Facultades de la FUP */
        Facultad::create([
            'institucion_id' => 4,
            'nombre' => 'Facultad de Ingeniería y Arquitectura',
        ]);

        Facultad::create([
            'institucion_id' => 4,
            'nombre' => 'Facultad de Educación',
        ]);

        Facultad::create([
            'institucion_id' => 4,
            'nombre' => 'Facultad de Ciencias Sociales y Humanas',
        ]);

        Facultad::create([
            'institucion_id' => 4,
            'nombre' => 'Facultad de Ciencias Económicas, Contables y Administrativas',
        ]);

        /* Colegio mayor */

        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ciencias Empresariales',
        ]);

        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ingeniería',
        ]);

        Facultad::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ciencias Sociales y de la Educación',
        ]);

        /* Uniautonoma */
        Facultad::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ciencias Administrativas y Contables',
        ]);

        Facultad::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ciencias Sociales y Humanas',
        ]);

        Facultad::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ingeniería',
        ]);

        Facultad::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ciencias de la Salud',
        ]);


    }
}
