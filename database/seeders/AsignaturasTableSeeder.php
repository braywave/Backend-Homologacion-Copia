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
            'nombre' => 'Calculo III'
        ]);

        Asignatura::create([
            'nombre' => 'Fisica II'
        ]);
        Asignatura::create([
            'nombre' => 'Programacion'
        ]);
        Asignatura::create([
            'nombre' => 'Ingles II'
        ]);
        Asignatura::create([
            'nombre' => 'Complejidad algoritmica'
        ]);
    }
}
