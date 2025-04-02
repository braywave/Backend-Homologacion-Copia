<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContenidosProgramaticos extends Model
{
    use HasFactory;


    protected $table = 'contenidos_programaticos';


    protected $primaryKey = 'id_contenido';

    protected $fillable = [
        'asignatura_id',
        'tema',
        'resultados_aprendizaje',
        'descripcion',
    ];

    // Definir las relaciones
    public function asignatura()
    {
        return $this->belongsTo(Asignatura::class, 'asignatura_id', 'id_asignatura');
    }
}
