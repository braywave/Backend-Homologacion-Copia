<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SolicitudAsignaturas extends Model
{
    use HasFactory;

    protected $table = 'solicitud_asignaturas';

    protected $primaryKey = 'id_solicitud_asignatura';

    protected $fillable = [
        'solicitud_id',
        'asignatura_id',
        'nota_origen',
        'horas',
    ];

    // Definir las relaciones
    public function solicitud()
    {
        return $this->belongsTo(Solicitudes::class, 'solicitud_id', 'id_solicitud');
    }

    public function asignatura()
    {
        return $this->belongsTo(Asignatura::class, 'asignatura_id', 'id_asignatura');
    }
}
