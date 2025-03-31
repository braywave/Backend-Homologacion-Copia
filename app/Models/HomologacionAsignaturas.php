<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomologacionAsignaturas extends Model
{
    use HasFactory;

    protected $table = 'homologacion_asignaturas';

    protected $primaryKey = 'id_homologacion';

    protected $fillable = ['solicitud_id','asignatura_origen_id'];
}
