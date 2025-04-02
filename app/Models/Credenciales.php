<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Credenciales extends Model
{
    use HasFactory;

    protected $table = 'credenciales';

    protected $primaryKey = 'id_credencial';

    protected $fillable = [
        'usuario_id',
        'contraseña',
    ];

    // Definir las relaciones
    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'usuario_id', 'id_usuario');
    }
}
