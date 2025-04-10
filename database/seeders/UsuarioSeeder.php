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
        Usuario::create([
            'primer_nombre' => 'Sofía',
            'segundo_nombre' => 'Carolina',
            'primer_apellido' => 'Muñoz',
            'segundo_apellido' => 'Torres',
            'correo' => 'sofia.munoz@unicauca.edu.co',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '1098765432',
            'institucion_origen_id' => 3,
            'facultad_id' => 4,
            'telefono' => '3181234567',
            'direccion' => 'Cra 10 #20-50, Popayán',
            'pais_id' => 1,
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

        Usuario::create([
            'primer_nombre' => 'Julián',
            'segundo_nombre' => null,
            'primer_apellido' => 'Pérez',
            'segundo_apellido' => 'Ramírez',
            'correo' => 'julian.perez@unicomfacauca.edu.co',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '1012345678',
            'institucion_origen_id' => 6,
            'facultad_id' => 10, // Humanidades
            'telefono' => '3004567890',
            'direccion' => 'Av. Panamericana #12-34',
            'pais_id' => 1,
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

        Usuario::create([
            'primer_nombre' => 'Daniela',
            'segundo_nombre' => 'María',
            'primer_apellido' => 'Reyes',
            'segundo_apellido' => 'Ortiz',
            'correo' => 'daniela.reyes@unimayor.edu.co',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '1056789123',
            'institucion_origen_id' => 4,
            'facultad_id' => 6, // Arte y Diseño
            'telefono' => '3127894561',
            'direccion' => 'Calle 4 #6-78',
            'pais_id' => 1,
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

        Usuario::create([
            'primer_nombre' => 'Esteban',
            'segundo_nombre' => 'Alejandro',
            'primer_apellido' => 'López',
            'segundo_apellido' => null,
            'correo' => 'esteban.lopez@sena.edu.co',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '1234098765',
            'institucion_origen_id' => 2,
            'facultad_id' => null,
            'telefono' => '3134567890',
            'direccion' => 'Carrera 11 #25-18',
            'pais_id' => 1,
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

        Usuario::create([
            'primer_nombre' => 'Andrea',
            'segundo_nombre' => null,
            'primer_apellido' => 'Castaño',
            'segundo_apellido' => 'Rivas',
            'correo' => 'andrea.castano@fup.edu.co',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '1078945612',
            'institucion_origen_id' => 5,
            'facultad_id' => 9, // Ciencias Económicas
            'telefono' => '3145678912',
            'direccion' => 'Transversal 9 #15-30',
            'pais_id' => 1,
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

        Usuario::create([
            'primer_nombre' => 'Thiago',
            'segundo_nombre' => 'Luis',
            'primer_apellido' => 'Fernández',
            'segundo_apellido' => null,
            'correo' => 'thiago.fernandez@correo.com',
            'tipo_identificacion' => 'Cédula de Extranjería',
            'numero_identificacion' => 'EX9876543',
            'institucion_origen_id' => 5, // FUP
            'facultad_id' => 8, // Ciencias Sociales
            'telefono' => '3198765432',
            'direccion' => 'Carrera 8 #12-10',
            'pais_id' => 2, // Brasil
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

        Usuario::create([
            'primer_nombre' => 'Natalia',
            'segundo_nombre' => 'Paola',
            'primer_apellido' => 'Vargas',
            'segundo_apellido' => 'Jiménez',
            'correo' => 'natalia.vargas@autonomadelcauca.edu.co',
            'tipo_identificacion' => 'Tarjeta de Identidad',
            'numero_identificacion' => '1001122334',
            'institucion_origen_id' => 1,
            'facultad_id' => 5,
            'telefono' => '3161122334',
            'direccion' => 'Calle 11 #14-66',
            'pais_id' => 1,
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

        Usuario::create([
            'primer_nombre' => 'Felipe',
            'segundo_nombre' => null,
            'primer_apellido' => 'Suárez',
            'segundo_apellido' => 'Mendoza',
            'correo' => 'felipe.suarez@unicauca.edu.co',
            'tipo_identificacion' => 'Cédula de Ciudadanía',
            'numero_identificacion' => '1100112233',
            'institucion_origen_id' => 3,
            'facultad_id' => 2, // Ingeniería
            'telefono' => '3153344556',
            'direccion' => 'Av. Universitaria #7-12',
            'pais_id' => 1,
            'departamento_id' => 19,
            'municipio_id' => 703,
            'rol_id' => 2,
        ]);

    }
}
