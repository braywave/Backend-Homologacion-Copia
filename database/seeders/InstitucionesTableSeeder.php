<?php

namespace Database\Seeders;

use App\Models\Institucion;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InstitucionesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Institucion::create([
            'nombre' => 'Corporacion Universitaria Autonoma del Cauca',
            'codigo_snies' => '12345',
            'municipio_id' => 65,
            'tipo' => 'Universidad',
        ]);

        Institucion::create([
            'nombre' => 'Universidad del Cauca',
            'codigo_snies' => '6789',
            'municipio_id' => 79,
            'tipo' => 'Universidad',
        ]);
        Institucion::create([
            'nombre' => 'UniConfacauca',
            'codigo_snies' => '11456',
            'municipio_id' => 78,
            'tipo' => 'Universidad',
        ]);
    }
}
