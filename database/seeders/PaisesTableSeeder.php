<?php

namespace Database\Seeders;

use App\Models\pais;
use Illuminate\Database\Seeder;

class PaisesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $csvFile = fopen(base_path("database/data/paises.csv"), "r");

        $firstline = true;
        while (($data = fgetcsv($csvFile, 2000, ";")) !== FALSE) {
            if (!$firstline) {
                pais::create([
                    "id_pais" => "$data[0]",
                    "nombre" => "$data[1]"
                ]);
            }
            $firstline = false;
        }

        fclose($csvFile);
    }
}
