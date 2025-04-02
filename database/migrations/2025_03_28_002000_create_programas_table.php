<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('programas', function (Blueprint $table) {
            $table->smallIncrements('id_programa');
            $table->unsignedSmallInteger('institucion_id');
            $table->unsignedSmallInteger('facultad_id')->nullable();
            $table->string('nombre', 255);
            $table->string('codigo_snies', 20)->unique()->nullable();
            $table->enum('tipo_formacion', ['Técnico', 'Tecnólogo', 'Profesional']);
            $table->enum('metodologia', ['Presencial', 'Virtual', 'Híbrido']);
            $table->timestamps();

            //Foráneas
            $table->foreign('institucion_id')->references('id_institucion')->on('instituciones');
            $table->foreign('facultad_id')->references('id_facultad')->on('facultades');

            });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('programas');
    }
};
