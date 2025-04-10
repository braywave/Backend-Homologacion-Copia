<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Documento extends Model
{
    use HasFactory;

    protected $table = 'documentos';


    protected $primaryKey = 'id_documento';

    protected $fillable = [
        'solicitud_id',
        'usuario_id',
        'tipo',
        'ruta',
        'fecha_subida',
    ];

    // Definir las relaciones
    public function solicitud()
    {
        return $this->belongsTo(Solicitud::class, 'solicitud_id', 'id_solicitud');
    }

    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'usuario_id', 'id_usuario');
    }
}
