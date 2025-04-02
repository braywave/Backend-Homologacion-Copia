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
        Schema::create('instituciones', function (Blueprint $table) {
            $table->smallIncrements('id_institucion');
            $table->unsignedSmallInteger('municipio_id')->nullable();
            $table->string('nombre', 255);
            $table->string('codigo_ies', 20)->unique()->nullable();
            $table->enum('tipo', ['Universidad', 'SENA']);
            $table->timestamps();

           $table->foreign('municipio_id')->references('id_municipio')->on('municipios');

        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('instituciones');
    }
};
