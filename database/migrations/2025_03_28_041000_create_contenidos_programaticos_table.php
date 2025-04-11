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
        Schema::create('contenidos_programaticos', function (Blueprint $table) {
            $table->smallIncrements('id_contenido');
            $table->unsignedSmallInteger('asignatura_id');
            $table->string('tema', 255);
            $table->text('resultados_aprendizaje');
            $table->text('descripcion');
            $table->timestamps();

            $table->foreign('asignatura_id')->references('id_asignatura')->on('asignaturas')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('contenidos_programaticos');
    }
};
