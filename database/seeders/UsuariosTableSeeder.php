<?php

namespace Database\Seeders;

use App\Models\Usuario;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UsuariosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Usuario::create([
            "nombre" => "Sofia",
            "apellido" => "Muñoz"
        ]);
        Usuario::create([
            "nombre" => "Andres",
            "apellido" => "Montenegro"
        ]);
        Usuario::create([
            "nombre" => "David",
            "apellido" => "Torrez"
        ]);
        Usuario::create([
            "nombre" => "Daniela",
            "apellido" => "Trujillo"
        ]);
    }
}
