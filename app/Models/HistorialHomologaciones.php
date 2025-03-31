<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistorialHomologaciones extends Model
{
    use HasFactory;

    protected $table = "historial_homologaciones";

    protected $primaryKey = "id_historial";

    protected $fillable = ['usuario_id', 'solicitud_id'];
}
