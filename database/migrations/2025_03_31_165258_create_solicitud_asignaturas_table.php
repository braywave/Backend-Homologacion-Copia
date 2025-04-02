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
        Schema::create('solicitud_asignaturas', function (Blueprint $table) {
            $table->smallIncrements('id_solicitud_asignatura');
            $table->unsignedSmallInteger('solicitud_id');
            $table->unsignedSmallInteger('asignatura_id');
            $table->decimal('nota_origen', 3, 1)->nullable();
            $table->integer('horas')->nullable();

            $table->foreign('solicitud_id')->references('id_solicitud')->on('solicitudes');
            $table->foreign('asignatura_id')->references('id_asignatura')->on('asignaturas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('solicitud_asignaturas');
    }
};
