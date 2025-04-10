<?php

namespace Database\Seeders;

use App\Models\Credencial;
use App\Models\Credenciales;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use PHPUnit\TextUI\XmlConfiguration\CodeCoverage\Report\Crap4j;

class CredencialSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Credencial::create([
            'usuario_id' => 1,
            'contraseña' => bcrypt('contraseña123'),
        ]);

        Credencial::create([
            'usuario_id' => 2,
            'contraseña' => bcrypt('contraseña456'),
        ]);

        Credencial::create([
            'usuario_id' => 3,
            'contraseña' => bcrypt('contraseña789'),
        ]);
    }
}
