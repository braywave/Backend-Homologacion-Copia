<?php

namespace Database\Seeders;

use App\Models\SolicitudAsignaturas;
use App\Models\Solicitudes;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SolicitudAsignaturasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {


        SolicitudAsignaturas::create([
            'solicitud_id' => 1,
            'asignatura_id' => 1,
            'nota_origen' => 4.5,
            'horas' => 3,
        ]);

        SolicitudAsignaturas::create([
            'solicitud_id' => 1,
            'asignatura_id' => 2,
            'nota_origen' => 3.8,
            'horas' => 4,
        ]);

        SolicitudAsignaturas::create([
            'solicitud_id' => 2,
            'asignatura_id' => 3, 
            'nota_origen' => 5.0,
            'horas' => 2,
        ]);

}
}
