<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('usuarios', function (Blueprint $table) {

            $table->smallIncrements('id_usuario');
            $table->string('primer_nombre', 50);
            $table->string('segundo_nombre', 50)->nullable();
            $table->string('primer_apellido', 50);
            $table->string('segundo_apellido', 50)->nullable();
            $table->string('correo', 100)->unique();
            $table->enum('tipo_identificacion', ['Tarjeta de Identidad', 'Cédula de Ciudadanía', 'Cédula de Extranjería']);
            $table->string('numero_identificacion', 20)->unique();

            $table->unsignedSmallInteger('institucion_origen_id')->nullable();
            $table->unsignedSmallInteger('facultad_id')->nullable();

            $table->string('telefono', 20)->nullable();
            $table->string('direccion', 255)->nullable();

            $table->unsignedSmallInteger('pais_id')->nullable();
            $table->unsignedSmallInteger('departamento_id')->nullable();
            $table->unsignedSmallInteger('municipio_id')->nullable();
            $table->unsignedSmallInteger('rol_id');

            $table->foreign('pais_id')->references('id_pais')->on('paises');
            $table->foreign('departamento_id')->references('id_departamento')->on('departamentos');
            $table->foreign('municipio_id')->references('id_municipio')->on('municipios');
            $table->foreign('institucion_origen_id')->references('id_institucion')->on('instituciones');
            $table->foreign('rol_id')->references('id_rol')->on('roles');
            $table->foreign('facultad_id')->references('id_facultad')->on('facultades');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('usuarios');
    }
};
