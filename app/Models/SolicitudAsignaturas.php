<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SolicitudAsignaturas extends Model
{
    use HasFactory;

    protected $table = "solicitud_asignaturas";

    protected $primaryKey = "id_solicitud_asignatura";

    protected $fillable = ['asignatura_id', 'solicitud_id'];
}
