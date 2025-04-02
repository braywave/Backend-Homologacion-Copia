<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    use HasFactory;

    protected $table = 'usuarios';

    protected $primaryKey = 'id_usuario';

    public $incrementing = false;
    protected $keyType = 'smallint';

    protected $fillable = [
        'primer_nombre',
        'segundo_nombre',
        'primer_apellido',
        'segundo_apellido',
        'correo',
        'tipo_identificacion',
        'numero_identificacion',
        'institucion_origen_id',
        'facultad_id',
        'telefono',
        'direccion',
        'pais_id',
        'departamento_id',
        'municipio_id',
        'rol_id'
    ];

    public function pais()
    {
        return $this->belongsTo(Pais::class, 'pais_id', 'id_pais');
    }

    public function departamento()
    {
        return $this->belongsTo(Departamento::class, 'departamento_id', 'id_departamento');
    }

    public function municipio()
    {
        return $this->belongsTo(Municipio::class, 'municipio_id', 'id_municipio');
    }

    public function institucionOrigen()
    {
        return $this->belongsTo(Institucion::class, 'institucion_origen_id', 'id_institucion');
    }

    public function facultad()
    {
        return $this->belongsTo(Facultad::class, 'facultad_id', 'id_facultad');
    }

    public function rol()
    {
        return $this->belongsTo(Rol::class, 'rol_id', 'id_rol');
    }
}
