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
        Schema::create('historial_homologaciones', function (Blueprint $table) {
            $table->tinyIncrements('id_historial');
            $table->unsignedTinyInteger('solicitud_id');
            $table->unsignedTinyInteger('usuario_id');
            $table->enum('estado', ['Radicado', 'En revisión', 'Evaluado', 'Aprobado', 'Rechazado', 'Apelación']);
            $table->timestamp('fecha')->useCurrent();
            $table->text('observaciones')->nullable();
            $table->string('ruta_pdf_resolucion', 255)->nullable();

            $table->foreign('solicitud_id')->references('id_solicitud')->on('solicitudes');
            $table->foreign('usuario_id')->references('id_usuario')->on('usuarios');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('historial_homologaciones');
    }
};
