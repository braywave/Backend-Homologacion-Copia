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
        Schema::create('credenciales', function (Blueprint $table) {
            $table->tinyIncrements('id_credencial');
            $table->unsignedTinyInteger('usuario_id')->unique();
            $table->string('contraseña', 255);
            $table->timestamps();

           $table->foreign('usuario_id')->references('id_usuario')->on('usuarios');
        
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('credenciales');
    }
};
