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
        Schema::create('facultades', function (Blueprint $table) {
            $table->tinyIncrements('id_facultad');
            $table->unsignedTinyInteger('institucion_id');
            $table->string('nombre', 255);

            $table->foreign('institucion_id')->references('id_institucion')->on('instituciones');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('facultades');
    }
};
