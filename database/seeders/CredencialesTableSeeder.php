<?php

namespace Database\Seeders;

use App\Models\Credenciales;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use PHPUnit\TextUI\XmlConfiguration\CodeCoverage\Report\Crap4j;

class CredencialesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Credenciales::create([
            'usuario_id' => 1,
            'contraseña' => bcrypt('contraseña123'),
        ]);

        Credenciales::create([
            'usuario_id' => 2,
            'contraseña' => bcrypt('contraseña456'),
        ]);

        Credenciales::create([
            'usuario_id' => 3,
            'contraseña' => bcrypt('contraseña789'),
        ]);
    }
}
