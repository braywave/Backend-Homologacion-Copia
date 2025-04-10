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
            'nombre' => 'Servicio Nacional de Aprendizaje (SENA) - Regional Cauca',
            'codigo_ies' => null,
            'tipo' => 'SENA',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Universidad del Cauca',
            'codigo_ies' => '1110',
            'tipo' => 'Universitaria',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Institución Universitaria Colegio Mayor del Cauca',
            'codigo_ies' => '2217',
            'tipo' => 'Mixta',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Fundación Universitaria de Popayán',
            'codigo_ies' => '2715',
            'tipo' => 'Universitaria',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Corporación Universitaria Comfacauca - UNICOMFACAUCA',
            'codigo_ies' => '2847',
            'tipo' => 'Universitaria',
        ]);

    }
}
