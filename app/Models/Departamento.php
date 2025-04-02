<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Departamento extends Model
{
    use HasFactory;

    protected $table = 'departamentos';

    protected $primaryKey = 'id_departamento';

    protected $fillable = [
        'pais_id',
        'nombre',
    ];

    // Definir las relaciones
    public function pais()
    {
        return $this->belongsTo(Pais::class, 'pais_id', 'id_pais');
    }
}
