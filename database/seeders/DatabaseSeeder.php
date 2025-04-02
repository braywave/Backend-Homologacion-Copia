<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;


use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);



        $this->call(PaisesTableSeeder::class);

        $this->call(DepartamentosTableSeeder::class);

        $this->call(MunicipiosTableSeeder::class);

        $this->call(InstitucionesTableSeeder::class);

        $this->call(FacultadesTableSeeder::class);

        $this->call(ProgramasTableSeeder::class);

        $this->call(RolesTableSeeder::class);

        $this->call(UsuariosTableSeeder::class);

        $this->call(CredencialesTableSeeder::class);

        $this->call(AsignaturasTableSeeder::class);

        $this->call(SolicitudesTableSeeder::class);

        $this->call(DocumentosTableSeeder::class);

        $this->call(ContenidosProgramaticosTableSeeder::class);

        $this->call(HistorialHomologacionesTableSeeder::class);

        $this->call(SolicitudAsignaturasTableSeeder::class);

        $this->call(HomologacionAsignaturasTableSeeder::class);
    }
}
