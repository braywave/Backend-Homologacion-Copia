<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Solicitud extends Model
{
    use HasFactory;

    protected $table = "solicitudes";

    protected $primaryKey = 'id_solicitud';

    protected $fillable = [
        'usuario_id',
        'programa_destino_id',
        'finalizo_estudios',
        'fecha_finalizacion_estudios',
        'fecha_ultimo_semestre_cursado',
        'estado',
        'numero_radicado',
        'fecha_solicitud',
        'ruta_pdf_resolucion'
    ];

    /**
     * Relación con el usuario que realizó la solicitud.
     */
    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'usuario_id', 'id_usuario');
    }

    /**
     * Relación con el programa de destino.
     */
    public function programaDestino()
    {
        return $this->belongsTo(Programa::class, 'programa_destino_id', 'id_programa');
    }
}
