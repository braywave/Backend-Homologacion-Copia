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
            $table->smallIncrements('id_facultad');
            $table->unsignedSmallInteger('institucion_id');
            $table->string('nombre', 255);
            $table->timestamps();

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
