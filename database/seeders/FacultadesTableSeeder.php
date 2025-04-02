<?php

namespace Database\Seeders;

use App\Models\Facultades;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FacultadesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {

        Facultades::create([
            'institucion_id' => 3,
            'nombre' => 'Facultad de Ciencias de la Salud',
        ]);

        Facultades::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ingeniería',
        ]);

        Facultades::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ciencias Sociales',
        ]);

        Facultades::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Derecho',
        ]);

        Facultades::create([
            'institucion_id' => 1,
            'nombre' => 'Facultad de Ciencias Económicas',
        ]);
    }
}
