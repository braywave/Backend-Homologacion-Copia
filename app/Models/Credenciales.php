<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Credenciales extends Model
{
    use HasFactory;

    protected $table = "credenciales";

    protected $primaryKey = "id_credencial";

    protected $fillable = ['correo', 'contraseña'];
}
