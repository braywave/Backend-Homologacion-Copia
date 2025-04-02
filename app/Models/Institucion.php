<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Institucion extends Model
{
    use HasFactory;

    protected $table = 'instituciones';

    protected $primaryKey = 'id_institucion';

    protected $fillable = [
        'nombre',
        'codigo_ies',
        'municipio_id',
        'tipo',
    ];

    // Definir las relaciones
    public function municipio()
    {
        return $this->belongsTo(Municipio::class, 'municipio_id', 'id_municipio');
    }
}
