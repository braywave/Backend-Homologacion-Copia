<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Mail\SendUserPassword;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'confirmed', 'unique:users,email'],
            'tipo_identificacion' => ['required'],
            'numero_identificacion' => ['required', 'string', 'max:20', 'unique:users,numero_identificacion'],
        ]);

        // Generar una contraseña aleatoria segura
        $generatedPassword = Str::random(10);

        // Crear el usuario
        $user = User::create([
            'email' => $request->email,
            'password' => Hash::make($generatedPassword),
            'tipo_identificacion' => $request->tipo_identificacion,
            'numero_identificacion' => $request->numero_identificacion,
        ]);

        // Disparar evento de registro (por si usas email verification u otros)
        event(new Registered($user));

        // Enviar la contraseña al correo del usuario
        Mail::to($user->email)->send(new SendUserPassword($user->email, $generatedPassword));

        // Redirigir al login
        return redirect()->route('login')->with('status', 'Registro exitoso. Revisa tu correo para ver tu contraseña.');
    }
}
