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
            $table->smallIncrements('id_municipio');
            $table->unsignedSmallInteger('departamento_id');
            $table->string('nombre', 255);
            $table->timestamps();

            //Foraneas
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
