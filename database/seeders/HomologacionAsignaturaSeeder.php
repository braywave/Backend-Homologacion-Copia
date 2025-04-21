<?php

namespace Database\Seeders;

use App\Models\HomologacionAsignatura;
use Illuminate\Database\Seeder;

class HomologacionAsignaturaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        HomologacionAsignatura::create([
            'solicitud_id' => 1,
            'asignatura_origen_id' => 1,
            'asignatura_destino_id' => 2,
            'nota_destino' => 4.0,
            'comentarios' => 'Homologación aprobada.',
        ]);

        HomologacionAsignatura::create([
            'solicitud_id' => 2,
            'asignatura_origen_id' => 3,
            'asignatura_destino_id' => 4,
            'nota_destino' => null,
            'comentarios' => 'Pendiente de evaluación.',
        ]);

        HomologacionAsignatura::create([
            'solicitud_id' => 3,
            'asignatura_origen_id' => 2,
            'asignatura_destino_id' => 3,
            'nota_destino' => 4.8,
            'comentarios' => 'Homologación completada.',
        ]);
    }
}
