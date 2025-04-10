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
        Schema::create('asignaturas', function (Blueprint $table) {
            $table->smallIncrements('id_asignatura');
            $table->unsignedSmallInteger('programas_id');
            $table->string('nombre',255);
            $table->enum('tipo',['Materia','Competencia']);
            $table->string('codigo_asignatura', 30)->unique();
            $table->unsignedInteger('creditos')->nullable();
            $table->unsignedInteger('semestre')->nullable();
            $table->unsignedInteger('horas')->nullable();
            $table->unsignedInteger('tiempo_presencial')->nullable();
            $table->unsignedInteger('tiempo_independiente')->nullable();
            $table->unsignedInteger('horas_totales_semanales')->nullable();
            $table->enum('modalidad', ['Teórico', 'Práctico', 'Teórico-Práctico'])->nullable();
            $table->enum('metodologia', ['Presencial', 'Virtual', 'Híbrido']);
            $table->timestamps();


            //Foráneas
            $table->foreign('programas_id')->references('id_programa')->on('programas');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('asignaturas');
    }
};
