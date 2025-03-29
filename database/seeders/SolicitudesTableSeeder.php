<?php

namespace Database\Seeders;

use App\Models\Solicitudes;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SolicitudesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Solicitudes::create([
            "codigo"=> "HOM-2025-1242",
        ]);

        Solicitudes::create([
            "codigo"=> "HOM-2025-4632",
        ]);
        Solicitudes::create([
            "codigo"=> "HOM-2025-4745",
        ]);
        Solicitudes::create([
            "codigo"=> "HOM-2025-3646",
        ]);
        Solicitudes::create([
            "codigo"=> "HOM-2025-9875",
        ]);
    }
}
