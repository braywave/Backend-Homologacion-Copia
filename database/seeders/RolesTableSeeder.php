<?php

namespace Database\Seeders;

use GuzzleHttp\Promise\Create;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Roles;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Inserta múltiples roles
        Roles::insert([
            ['nombre' => 'Aspirante'],
            ['nombre' => 'Coordinador'],
            ['nombre' => 'Decano'],
            ['nombre' => 'Vicerrector']
        ]);
    }
}
