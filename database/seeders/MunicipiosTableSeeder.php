<?php

namespace Database\Seeders;

use App\Models\Municipio;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MunicipiosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Municipio::create([
            'nombre'=> 'Popayán'
        ]);
        Municipio::create([
            'nombre'=> 'Palmira'
        ]);
        Municipio::create([
            'nombre'=> 'Timbio'
        ]);
        Municipio::create([
            'nombre'=> 'Caldono'
        ]);
        Municipio::create([
            'nombre'=> 'Pescador'
        ]);
    }
}
