<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Programa extends Model
{
    use HasFactory;

    protected $table = 'programas';

    protected $primaryKey = 'id_programa';

    protected $fillable = [
        'nombre',
        'codigo_snies',
        'institucion_id',
        'facultad_id',
        'tipo_formacion',
        'metodologia',
    ];

    // Definir las relaciones
    public function institucion()
    {
        return $this->belongsTo(Institucion::class, 'institucion_id', 'id_institucion');
    }

    public function facultad()
    {
        return $this->belongsTo(Facultades::class, 'facultad_id', 'id_facultad');
    }
}
