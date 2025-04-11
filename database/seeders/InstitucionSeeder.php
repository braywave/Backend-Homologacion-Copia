<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Institucion;

class InstitucionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {


        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Corporación Universitaria Autónoma del Cauca',
            'codigo_ies' => '2849',
            'tipo' => 'Universitaria',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Servicio Nacional de Aprendizaje - SENA',
            'codigo_ies' => null,
            'tipo' => 'SENA',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Colegio Mayor del Cauca',
            'codigo_ies' => '3104',
            'tipo' => 'Mixta',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Fundación Universitaria de Popayán - FUP',
            'codigo_ies' => '1055',
            'tipo' => 'Mixta',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Universidad del Cauca',
            'codigo_ies' => '1110',
            'tipo' => 'Universitaria',
        ]);


    }
}
