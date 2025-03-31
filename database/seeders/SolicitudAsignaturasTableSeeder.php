<?php

namespace Database\Seeders;

use App\Models\SolicitudAsignaturas;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SolicitudAsignaturasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        SolicitudAsignaturas::create([
            'asignatura_id' => 2,
            'solicitud_id' => 1
        ]);

        SolicitudAsignaturas::create([
            'asignatura_id' => 5,
            'solicitud_id' => 1
        ]);

        SolicitudAsignaturas::create([
            'asignatura_id' => 1,
            'solicitud_id' => 1
        ]);

        SolicitudAsignaturas::create([
            'asignatura_id' => 7,
            'solicitud_id' => 2
        ]);
    }
}
