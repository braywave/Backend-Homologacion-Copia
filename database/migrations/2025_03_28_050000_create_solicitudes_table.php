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
        Schema::create('solicitudes', function (Blueprint $table) {
            $table->tinyIncrements('id_solicitud');
           $table->unsignedTinyInteger('usuario_id');
            $table->unsignedTinyInteger('programa_destino_id'); 
            $table->enum('finalizo_estudios', ['Si', 'No'])->default('No'); 
            $table->date('fecha_finalizacion_estudios')->nullable(); 
            $table->date('fecha_ultimo_semestre_cursado')->nullable(); 
            $table->enum('estado', ['Radicado', 'En revisión', 'Aprobado', 'Rechazado', 'Cerrado'])->default('Radicado'); 
            $table->string('numero_radicado', 50)->unique();
            $table->timestamp('fecha_solicitud')->useCurrent();
            $table->string('ruta_pdf_resolucion', 255)->nullable(); 

            // llaves foráneas
            $table->foreign('usuario_id')->references('id_usuario')->on('usuarios');
            $table->foreign('programa_destino_id')->references('id_programa')->on('programas');

            $table->timestamps(); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('solicitudes');
    }
};
