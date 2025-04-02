<?php

namespace Database\Seeders;

use App\Models\Usuario;
use Illuminate\Database\Seeder;

class UsuariosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */

    public function run()
    {
        Usuario::create([
            'primer_nombre' => 'Juan',
            'segundo_nombre' => 'Pablo',
            'primer_apellido' => 'García',
            'segundo_apellido' => 'López',
            'correo' => 'juan.garcia@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '123456789',
            'institucion_origen_id' => 1,
            'facultad_id' => 1,
            'telefono' => '3001234567',
            'direccion' => 'Calle 123 #45-67',
            'pais_id' => 1,
            'departamento_id' => 1,
            'municipio_id' => 1,
            'rol_id' => 1,
        ]);

        Usuario::create([
            'primer_nombre' => 'María',
            'segundo_nombre' => 'Fernanda',
            'primer_apellido' => 'Martínez',
            'segundo_apellido' => 'Sánchez',
            'correo' => 'maria.martinez@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '987654321',
            'institucion_origen_id' => 1,
            'facultad_id' => 2,
            'telefono' => '3109876543',
            'direccion' => 'Avenida 456 #78-90',
            'pais_id' => 1,
            'departamento_id' => 1,
            'municipio_id' => 1,
            'rol_id' => 1,
        ]);

        Usuario::create([
            'primer_nombre' => 'Carlos',
            'segundo_nombre' => 'Andrés',
            'primer_apellido' => 'Ramírez',
            'segundo_apellido' => 'Torres',
            'correo' => 'carlos.ramirez@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '456789123',
            'institucion_origen_id' => 1,
            'facultad_id' => 1,
            'telefono' => '3204567890',
            'direccion' => 'Carrera 10 #20-30',
            'pais_id' => 1,
            'departamento_id' => 1,
            'municipio_id' => 1,
            'rol_id' => 2,
        ]);
    }
}
