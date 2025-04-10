<?php

namespace Database\Seeders;

use App\Models\Rol;
use GuzzleHttp\Promise\Create;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Roles;

class RolSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Inserta múltiples roles
        Rol::insert([
            ['nombre' => 'Aspirante'],
            ['nombre' => 'Coordinador'],
            ['nombre' => 'Decano'],
            ['nombre' => 'Vicerrector']
        ]);
    }
}
