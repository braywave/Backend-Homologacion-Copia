<?php

namespace Database\Seeders;

use App\Models\ContenidosProgramaticos;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ContenidosProgramaticosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ContenidosProgramaticos::create([
            
            'contenido' => 'Esta aignatura tiene una instensidad horaria de 4 horas a la semana  y ademas...'
        ]);

        ContenidosProgramaticos::create([
            
            'contenido' => 'Esta aignatura tiene una instensidad horaria de 3 horas a la semana  y ademas...'
        ]);

        ContenidosProgramaticos::create([
            
            'contenido' => 'Esta aignatura tiene una instensidad horaria de 1 horas a la semana  y ademas...'
        ]);
    }
}
