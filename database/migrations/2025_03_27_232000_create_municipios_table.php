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
        Schema::create('municipios', function (Blueprint $table) {
            $table->tinyIncrements('id_municipio');
            $table->string('nombre', 255);
            $table->integer('codigo')->unique();
            $table->unsignedTinyInteger('departamento_id');
            $table->timestamps();

           $table->foreign('departamento_id')->references('id_departamento')->on('departamentos');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('municipios');
    }
};
