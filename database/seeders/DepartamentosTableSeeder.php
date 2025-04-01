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
    public function run()
    {
        $departamentos = [
            ['nombre' => 'Antioquia', 'codigo' => 5, 'pais_id' => 52],
            ['nombre' => 'Atlántico', 'codigo' => 8, 'pais_id' => 52],
            ['nombre' => 'D. C. Santa Fe de Bogotá', 'codigo' => 11, 'pais_id' => 52],
            ['nombre' => 'Bolívar', 'codigo' => 13, 'pais_id' => 52],
            ['nombre' => 'Boyacá', 'codigo' => 15, 'pais_id' => 52],
            ['nombre' => 'Caldas', 'codigo' => 17, 'pais_id' => 52],
            ['nombre' => 'Caquetá', 'codigo' => 18, 'pais_id' => 52],
            ['nombre' => 'Cauca', 'codigo' => 19, 'pais_id' => 52],
            ['nombre' => 'Cesar', 'codigo' => 20, 'pais_id' => 52],
            ['nombre' => 'Córdoba', 'codigo' => 23, 'pais_id' => 52],
            ['nombre' => 'Cundinamarca', 'codigo' => 25, 'pais_id' => 52],
            ['nombre' => 'Chocó', 'codigo' => 27, 'pais_id' => 52],
            ['nombre' => 'Huila', 'codigo' => 41, 'pais_id' => 52],
            ['nombre' => 'La Guajira', 'codigo' => 44, 'pais_id' => 52],
            ['nombre' => 'Magdalena', 'codigo' => 47, 'pais_id' => 52],
            ['nombre' => 'Meta', 'codigo' => 50, 'pais_id' => 52],
            ['nombre' => 'Nariño', 'codigo' => 52, 'pais_id' => 52],
            ['nombre' => 'Norte de Santander', 'codigo' => 54, 'pais_id' => 52],
            ['nombre' => 'Quindío', 'codigo' => 63, 'pais_id' => 52],
            ['nombre' => 'Risaralda', 'codigo' => 66, 'pais_id' => 52],
            ['nombre' => 'Santander', 'codigo' => 68, 'pais_id' => 52],
            ['nombre' => 'Sucre', 'codigo' => 70, 'pais_id' => 52],
            ['nombre' => 'Tolima', 'codigo' => 73, 'pais_id' => 52],
            ['nombre' => 'Valle', 'codigo' => 76, 'pais_id' => 52],
            ['nombre' => 'Arauca', 'codigo' => 81, 'pais_id' => 52],
            ['nombre' => 'Casanare', 'codigo' => 85, 'pais_id' => 52],
            ['nombre' => 'Putumayo', 'codigo' => 86, 'pais_id' => 52],
            ['nombre' => 'San Andrés', 'codigo' => 88, 'pais_id' => 52],
            ['nombre' => 'Amazonas', 'codigo' => 91, 'pais_id' => 52],
            ['nombre' => 'Guainía', 'codigo' => 94, 'pais_id' => 52],
            ['nombre' => 'Guaviare', 'codigo' => 95, 'pais_id' => 52],
            ['nombre' => 'Vaupés', 'codigo' => 97, 'pais_id' => 52],
            ['nombre' => 'Vichada', 'codigo' => 99, 'pais_id' => 52],
        ];

        foreach ($departamentos as $departamento) {
            Departamento::create($departamento);
        }
    }

}
