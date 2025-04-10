<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Facultad extends Model
{
    use HasFactory;


    protected $table = 'facultades';


    protected $primaryKey = 'id_facultad';

    protected $fillable = [
        'institucion_id',
        'nombre',
    ];

    // Definir las relaciones
    public function institucion()
    {
        return $this->belongsTo(Institucion::class, 'institucion_id', 'id_institucion');
    }
}
