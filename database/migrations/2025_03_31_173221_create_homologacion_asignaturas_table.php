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
        Schema::create('homologacion_asignaturas', function (Blueprint $table) {
            $table->id('id_homologacion');
            $table->unsignedTinyInteger('solicitud_id');
            $table->unsignedTinyInteger('asignatura_origen_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('homolacion_asignaturas');
    }
};
