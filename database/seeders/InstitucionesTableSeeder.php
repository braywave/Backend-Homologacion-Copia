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
            'nombre' => 'Corporacion Universitaria Autonoma del Cauca'
        ]);
        Institucion::create([
            'nombre' => 'Universidad del Cauca'
        ]);
        Institucion::create([
            'nombre' => 'UniConfacauca'
        ]);
        Institucion::create([
            'nombre' => 'Institución Educativa Colegio Mayor'
        ]);
        Institucion::create([
            'nombre' => 'Fundación Universitaria de Popayán'
        ]);
        Institucion::create([
            'nombre' => 'Centro Aprendizaje Sena'
        ]);
        
    }
}
