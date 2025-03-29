<?php

namespace Database\Seeders;

use App\Models\Facultades;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FacultadesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Facultades::create([
            'nombre' => 'Facultad de Ciencias Administrativas Contables y Económicas'
        ]);

        Facultades::create([
            'nombre' => 'Facultad de Derecho, Ciencias Sociales y Politicas'
        ]);
        Facultades::create([
            'nombre' => 'Facultad de Ingeniería'
        ]);
        Facultades::create([
            'nombre' => 'Facultad de Educación'
        ]);
        Facultades::create([
            'nombre' => 'Facultad de Cienticas Ambientales y Desarrollo Sostenible'
        ]);
    }
}
