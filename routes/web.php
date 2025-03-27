<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Mail;
use App\Mail\SoporteMailable;
use App\Mail\CoordinacionMailable;
use App\Mail\ControlSeguimientoMailable;
use App\Mail\HomologacionesMailable;
use App\Mail\SecretariaMailable;

Route::get('/', function () {
    return view('welcome');
});

Route::get('soporte', function () {
    Mail::to('brayner.trochez.o@uniautonoma.edu.co')->send(new SoporteMailable());
    return 'Correo de soporte enviado';
})->name('soporte');


Route::get('coordinacion', function () {
    Mail::to('brayner.trochez.o@uniautonoma.edu.co')->send(new CoordinacionMailable());
    return 'Correo de coordinación enviado';
});

Route::get('control', function () {
    Mail::to('brayner.trochez.o@uniautonoma.edu.co')->send(new ControlSeguimientoMailable());
    return 'Correo de control y seguimiento enviado';
});

Route::get('homologaciones', function () {
    Mail::to('brayner.trochez.o@uniautonoma.edu.co')->send(new HomologacionesMailable());
    return 'Correo de homologaciones enviado';
});

Route::get('secretaria', function () {
    Mail::to('brayner.trochez.o@uniautonoma.edu.co')->send(new SecretariaMailable());
    return 'Correo de secretaría enviado';
});
