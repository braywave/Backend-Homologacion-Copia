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
        Schema::create('departamentos', function (Blueprint $table) {
            $table->tinyIncrements('id_departamento');
            $table->string('nombre', 255);
            $table->unsignedTinyInteger('pais_id');
            $table->integer('codigo')->default(0);  // Establece un valor predeterminado

            $table->timestamps();

            // Foraneas
            $table->foreign('pais_id')-> references('id_pais')->on('paises');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('departamentos');
    }
};
