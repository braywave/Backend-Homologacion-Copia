<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistorialHomologaciones extends Model
{
    use HasFactory;


    protected $table = 'historial_homologaciones';

    protected $primaryKey = 'id_historial';

    protected $fillable = [
        'usuario_id',
        'solicitud_id',
        'estado',
        'observaciones',
        'ruta_pdf_resolucion',
        'fecha',
    ];

    // Definir las relaciones
    public function solicitud()
    {
        return $this->belongsTo(Solicitudes::class, 'solicitud_id', 'id_solicitud');
    }

    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'usuario_id', 'id_usuario');
    }
}
