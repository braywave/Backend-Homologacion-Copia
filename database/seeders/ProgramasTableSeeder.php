<?php

namespace Database\Seeders;

use App\Models\Programa;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProgramasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Programa::create([
            'nombre' => 'Ingeniera de Software y Computacion'
        ]);
        Programa::create([
            'nombre' => 'Ingeniera Civil'
        ]);
        Programa::create([
            'nombre' => 'Ingeniera de Electronica'
        ]);
        Programa::create([
            'nombre' => 'Ingeniera de Ambiental'
        ]);
        Programa::create([
            'nombre' => 'Contaduria'
        ]);
        Programa::create([
            'nombre' => 'Derecho'
        ]);
    }
}
