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
    public function run(): void
    {
        Credenciales::create([
            'correo'=> 'deibyalejandro12@gmail.com',
            'contraseña'=> '124125236',
        ]);

        Credenciales::create([
            'correo'=> 'Thcheiviz@gmail.com',
            'contraseña'=> '3463463453',
        ]);
        Credenciales::create([
            'correo'=> 'maicolAndres@gmail.com',
            'contraseña'=> '12362323',
        ]);
        Credenciales::create([
            'correo'=> 'andres_M@gmail.com',
            'contraseña'=> '346347454',
        ]);
        Credenciales::create([
            'correo'=> 'sofia@gmail.com',
            'contraseña'=> '56857457',
        ]);
    }
}
