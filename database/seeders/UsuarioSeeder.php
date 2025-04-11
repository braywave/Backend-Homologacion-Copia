<?php

namespace Database\Seeders;

use App\Models\Usuario;
use Illuminate\Database\Seeder;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */

    public function run()
    {


        // Aspirante 1 - Colombiano - Autónoma del Cauca
        Usuario::create([
            'primer_nombre' => 'Laura',
            'segundo_nombre' => 'Isabel',
            'primer_apellido' => 'Martínez',
            'segundo_apellido' => 'Gómez',
            'correo' => 'laura.martinez@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '1122334455',
            'institucion_origen_id' => 1,
            'facultad_id' => 15, // Facultad de Ingeniería
            'telefono' => '3123456789',
            'direccion' => 'Calle 10 #5-45',
            'pais_id' => 1,
            'departamento_id' => 12,
            'municipio_id' => 703,
            'rol_id' => 1,
        ]);

        // Aspirante 2 - Colombiano - FUP
        Usuario::create([
            'primer_nombre' => 'Carlos',
            'segundo_nombre' => 'Eduardo',
            'primer_apellido' => 'López',
            'segundo_apellido' => 'Ruiz',
            'correo' => 'carlos.lopez@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '2233445566',
            'institucion_origen_id' => 4,
            'facultad_id' => 10, // Ingeniería y Arquitectura
            'telefono' => '3114567890',
            'direccion' => 'Carrera 15 #6-30',
            'pais_id' => 1,
            'departamento_id' => 12,
            'municipio_id' => 703,
            'rol_id' => 1,
        ]);

        // Aspirante 3 - Colombiano - Colegio Mayor del Cauca
        Usuario::create([
            'primer_nombre' => 'Andrea',
            'segundo_nombre' => null,
            'primer_apellido' => 'Sánchez',
            'segundo_apellido' => 'Valencia',
            'correo' => 'andrea.sanchez@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '3344556677',
            'institucion_origen_id' => 3,
            'facultad_id' => 13, // Ciencias Empresariales
            'telefono' => null,
            'direccion' => 'Av. Panamericana #12-34',
            'pais_id' => 1,
            'departamento_id' => 12,
            'municipio_id' => 703,
            'rol_id' => 1,
        ]);

        // Aspirante 4 - Colombiano - Unicauca
        Usuario::create([
            'primer_nombre' => 'Luis',
            'segundo_nombre' => 'Fernando',
            'primer_apellido' => 'Rodríguez',
            'segundo_apellido' => 'Mora',
            'correo' => 'luis.rodriguez@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '4455667788',
            'institucion_origen_id' => 5,
            'facultad_id' => 9, // Ingeniería Electrónica y Telecomunicaciones
            'telefono' => null,
            'direccion' => 'Cra 3 #20-60',
            'pais_id' => 1,
            'departamento_id' => 12,
            'municipio_id' => 703,
            'rol_id' => 1,
        ]);

        // Aspirante 5 - Extranjero - Universidad de Quito (ficticia, extranjero)
        Usuario::create([
            'primer_nombre' => 'Miguel',
            'segundo_nombre' => 'Andrés',
            'primer_apellido' => 'Herrera',
            'segundo_apellido' => 'Pérez',
            'correo' => 'miguel.herrera@example.com',
            'tipo_identificacion' => 'Cédula de Extranjería',
            'numero_identificacion' => 'EX12345678',
            'institucion_origen_id' => 2, // Consideramos aquí el ID genérico de extranjería
            'facultad_id' => null,
            'telefono' => '3007894561',
            'direccion' => 'Calle Internacional #99',
            'pais_id' => 2, // País extranjero
            'departamento_id' => null,
            'municipio_id' => null,
            'rol_id' => 1,
        ]);

        // Aspirante 6 - Del SENA (finalizó estudios)
        Usuario::create([
            'primer_nombre' => 'Juliana',
            'segundo_nombre' => null,
            'primer_apellido' => 'Patiño',
            'segundo_apellido' => 'Córdoba',
            'correo' => 'juliana.patino@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '5566778899',
            'institucion_origen_id' => 2, // SENA
            'facultad_id' => null,
            'telefono' => '3139876543',
            'direccion' => 'Mz H Casa 25',
            'pais_id' => 1,
            'departamento_id' => 12,
            'municipio_id' => 703,
            'rol_id' => 1,
        ]);

        // Coordinador - Autónoma del Cauca - Ingeniería de Software
        Usuario::create([
            'primer_nombre' => 'Sebastián',
            'segundo_nombre' => 'David',
            'primer_apellido' => 'Cano',
            'segundo_apellido' => 'Velasco',
            'correo' => 'sebastian.cano@example.com',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '6677889900',
            'institucion_origen_id' => 1,
            'facultad_id' => 15, // Facultad de Ingeniería
            'telefono' => '3101122334',
            'direccion' => 'Calle 21 #7-12',
            'pais_id' => 1,
            'departamento_id' => 12,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);



    }
}
