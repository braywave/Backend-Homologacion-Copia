<?php

namespace Database\Seeders;

use App\Models\HistorialHomologaciones;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class HistorialHomologacionesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        HistorialHomologaciones::create([
            'usuario_id' => 1,
            'solicitud_id'=> 2,
        ]);

        HistorialHomologaciones::create([
            'usuario_id' => 3,
            'solicitud_id'=> 3,
        ]);

        HistorialHomologaciones::create([
            'usuario_id' => 1,
            'solicitud_id'=> 1,
        ]);

        HistorialHomologaciones::create([
            'usuario_id' => 4,
            'solicitud_id'=> 5,
        ]);
    }
}
