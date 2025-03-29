<?php

namespace Database\Seeders;

use App\Models\pais;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PaisesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        pais::create([
            'nombre' => 'Colombia'
        ]);
        pais::create([
            'nombre' => 'Brazil'
        ]);
        pais::create([
            'nombre' => 'Argentina'
        ]);
        pais::create([
            'nombre' => 'Uruaguay'
        ]);
    }
}
