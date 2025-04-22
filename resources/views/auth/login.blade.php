
    <!-- Añadimos el estilo del documento de referencia -->
    <style>
        /* Variables de color */
        :root {
            --azul-oscuro: #19407b;
            --azul-medio: #0075bf;
            --azul-claro: #08dcff;
            --blanco: #ffffff;
            --gris-claro: #f4f4f4;
            --borde: #dddddd;
            --sombra: rgba(0, 0, 0, 0.1);
            --rojo-error: #ff4d4d;
        }

        .btn-primary {
            background-color: var(--azul-medio);
            border-color: var(--azul-medio);
        }

        .btn-primary:hover {
            background-color: var(--azul-oscuro);
            border-color: var(--azul-oscuro);
        }

        /* Contenedor principal */
        .container {
            background-color: var(--blanco);
            width: 100%;
            max-width: 420px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 0;
            position: relative;
            z-index: 1;
            overflow: hidden;
            animation: fadeIn 0.8s ease;
            margin: 0 auto;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Encabezado del formulario */
        .header {
            background-color: var(--azul-oscuro);
            padding: 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(45deg);
            animation: shine 5s infinite linear;
        }

        @keyframes shine {
            0% {
                transform: translateX(-100%) rotate(45deg);
            }
            100% {
                transform: translateX(100%) rotate(45deg);
            }
        }

        .logo {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: var(--blanco);
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 5px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .logo img {
            width: 100%;
            height: auto;
            object-fit: contain;
            animation: pulse 3s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }

        /* Formulario */
        .form-container {
            padding: 30px;
        }

        .form-title {
            color: var(--azul-oscuro);
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            position: relative;
            font-weight: 600;
        }

        .form-title::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: -10px;
            transform: translateX(-50%);
            width: 70px;
            height: 3px;
            background: linear-gradient(to right, var(--azul-medio), var(--azul-claro));
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .input-group input, .input-group select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid var(--borde);
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: var(--blanco);
        }

        .input-group input:focus, .input-group select:focus {
            border-color: var(--azul-medio);
            box-shadow: 0 0 0 3px rgba(0, 117, 191, 0.2);
            outline: none;
        }

        /* Remember me checkbox */
        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-me input[type="checkbox"] {
            margin-right: 10px;
        }

        .remember-me label {
            color: #555;
            font-size: 14px;
        }

        /* Botón de login */
        .login-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(to right, var(--azul-medio), var(--azul-claro));
            color: var(--blanco);
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 117, 191, 0.4);
            position: relative;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(0, 117, 191, 0.5);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        /* Enlaces de ayuda */
        .help-links {
            text-align: center;
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .help-links a {
            color: var(--azul-medio);
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .help-links a:hover {
            color: var(--azul-oscuro);
            text-decoration: underline;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 15px;
            background-color: #f9f9f9;
            border-top: 1px solid var(--borde);
            font-size: 12px;
            color: #777;
        }

        /* Añadimos algunas burbujas animadas en el fondo */
        body {
            background: linear-gradient(135deg, var(--azul-medio), var(--azul-oscuro));
            position: relative;
            min-height: 100vh;
        }

        .bubbles {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
            top: 0;
            left: 0;
        }

        .bubble {
            position: absolute;
            bottom: -100px;
            width: 40px;
            height: 40px;
            background: var(--azul-claro);
            border-radius: 50%;
            opacity: 0.1;
            animation: rise 15s infinite ease-in;
        }

        .bubble:nth-child(1) {
            width: 40px;
            height: 40px;
            left: 10%;
            animation-duration: 8s;
        }

        .bubble:nth-child(2) {
            width: 20px;
            height: 20px;
            left: 20%;
            animation-duration: 5s;
            animation-delay: 1s;
        }

        .bubble:nth-child(3) {
            width: 50px;
            height: 50px;
            left: 35%;
            animation-duration: 10s;
            animation-delay: 2s;
        }

        .bubble:nth-child(4) {
            width: 80px;
            height: 80px;
            left: 50%;
            animation-duration: 7s;
            animation-delay: 0s;
        }

        .bubble:nth-child(5) {
            width: 35px;
            height: 35px;
            left: 65%;
            animation-duration: 6s;
            animation-delay: 1s;
        }

        .bubble:nth-child(6) {
            width: 45px;
            height: 45px;
            left: 80%;
            animation-duration: 8s;
            animation-delay: 3s;
        }

        .bubble:nth-child(7) {
            width: 25px;
            height: 25px;
            left: 90%;
            animation-duration: 7s;
            animation-delay: 2s;
        }

        @keyframes rise {
            0% {
                bottom: -100px;
                transform: translateX(0);
            }
            50% {
                transform: translateX(100px);
            }
            100% {
                bottom: 1080px;
                transform: translateX(-200px);
            }
        }

        /* Estilo para mensajes de error */
        .error-message {
            background-color: rgba(255, 77, 77, 0.1);
            border-left: 3px solid var(--rojo-error);
            color: var(--rojo-error);
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            font-size: 14px;
            animation: shake 0.5s ease;
        }

        @keyframes shake {
            0%, 100% {
                transform: translateX(0);
            }
            20%, 60% {
                transform: translateX(-5px);
            }
            40%, 80% {
                transform: translateX(5px);
            }
        }

        /* Status message */
        .status-message {
            background-color: rgba(0, 117, 191, 0.1);
            border-left: 3px solid var(--azul-medio);
            color: var(--azul-oscuro);
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            font-size: 14px;
        }
    </style>

    <!-- Burbujas animadas de fondo -->
    <div class="bubbles">
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
    </div>

    <div class="container">
        <div class="header">
            <div class="logo">
                <img src="{{ asset('images/quimerito.png') }}" alt="Universidad Autónoma del Cauca">
            </div>
        </div>

        <div class="form-container">
            <h2 class="form-title">Homologaciones Uniautónoma</h2>

            <!-- Session Status -->
            @if (session('status'))
                <div class="status-message">
                    {{ session('status') }}
                </div>
            @endif

            <form method="POST" action="{{ route('login') }}">
                @csrf

                <!-- Email Address -->
                <div class="input-group">
                    <label for="email">{{ __('Email') }}</label>
                    <input id="email" type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="username" placeholder="Ingrese su correo">
                    <x-input-error :messages="$errors->get('email')" class="error-message mt-2" />
                </div>

                <!-- Password -->
                <div class="input-group">
                    <label for="password">{{ __('Password') }}</label>
                    <input id="password" type="password" name="password" required autocomplete="current-password" placeholder="Ingrese su contraseña">
                    <x-input-error :messages="$errors->get('password')" class="error-message mt-2" />
                </div>

                <!-- Remember Me -->
                <div class="remember-me">
                    <input id="remember_me" type="checkbox" name="remember">
                    <label for="remember_me">{{ __('Remember me') }}</label>
                </div>

                <button type="submit" class="login-btn">
                    {{ __('Log in') }}
                </button>

                <div class="help-links">
                    @if (Route::has('password.request'))
                        <a href="{{ route('password.request') }}">
                            {{ __('Forgot your password?') }}
                        </a>
                    @endif

                    <a href="{{ route('register') }}">
                        {{ __('Registrate Aquí') }}
                    </a>
                </div>
            </form>
        </div>

        <div class="footer">
            Universidad Autónoma del Cauca © 2025 - Sistema de Homologaciones
        </div>
    </div>

