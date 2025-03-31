<?php

namespace Database\Seeders;

use App\Models\HomologacionAsignaturas;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class HomologacionAsignaturasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        HomologacionAsignaturas::create([
            'solicitud_id' => 3,
            'asignatura_origen_id' => 4
        ]);

        HomologacionAsignaturas::create([
            'solicitud_id' => 2,
            'asignatura_origen_id' => 1
        ]);

        HomologacionAsignaturas::create([
            'solicitud_id' => 3,
            'asignatura_origen_id' => 2
        ]);
    }
}
