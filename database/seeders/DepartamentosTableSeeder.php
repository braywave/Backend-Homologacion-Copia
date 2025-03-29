<?php

namespace Database\Seeders;

use App\Models\Departamento;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DepartamentosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Departamento::create([
            'nombre' => 'Cauca',
            'pais_id' => 1
        ]);/* 
        Departamento::create([
            'nombre' => 'Valle del Cauca'
            'nombre' => 'Valle del Cauca'
        ]);
        Departamento::create([
            'nombre' => 'Bogota'
            'nombre' => 'Bogota'
        ]);
        Departamento::create([
            'nombre' => 'Medellin'
            'nombre' => 'Medellin'
        ]); */
    }

}
