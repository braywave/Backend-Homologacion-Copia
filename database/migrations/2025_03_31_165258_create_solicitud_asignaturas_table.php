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
            $table->id('id_solicitud_asignatura');
            $table->unsignedTinyInteger('asignatura_id');
            $table->unsignedTinyInteger('solicitud_id');
            $table->timestamps();
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
