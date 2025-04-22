
    <!-- Añadimos el estilo del primer documento -->
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

        /* Botón de registro */
        .registro-btn {
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
        }

        .registro-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }

        .registro-btn:hover::before {
            left: 100%;
        }

        .registro-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(0, 117, 191, 0.5);
        }

        .registro-btn:active {
            transform: translateY(0);
        }

        /* Enlaces de ayuda */
        .help-links {
            text-align: center;
            margin-top: 20px;
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
        .text-red-600 {
            color: var(--rojo-error);
        }

        /* Ajuste para mantener el look de los enlaces del formulario original */
        .login-link {
            color: var(--azul-medio);
            font-size: 14px;
            text-decoration: underline;
            transition: all 0.3s ease;
        }

        .login-link:hover {
            color: var(--azul-oscuro);
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
                <img src="{{ asset('imagenes/quimeritocuerpocompleto.png') }}" alt="Logo">
            </div>
        </div>

        <div class="form-container">
            <h2 class="form-title">Homologaciones Uniautonoma</h2>

            <form method="POST" action="{{ route('register') }}">
                @csrf

                <!-- Email -->
                <div class="input-group">
                    <label for="email">{{ __('Correo electrónico') }}</label>
                    <input id="email" type="email" name="email" value="{{ old('email') }}" required autocomplete="username">
                    <x-input-error :messages="$errors->get('email')" class="mt-2" />
                </div>

                <!-- Confirm Email -->
                <div class="input-group">
                    <label for="email_confirmation">{{ __('Confirmar correo electrónico') }}</label>
                    <input id="email_confirmation" type="email" name="email_confirmation" required autocomplete="username">
                    <x-input-error :messages="$errors->get('email_confirmation')" class="mt-2" />
                </div>

                <!-- Tipo Identificación -->
                <div class="input-group">
                    <label for="tipo_identificacion">{{ __('Tipo de identificación') }}</label>
                    <select id="tipo_identificacion" name="tipo_identificacion" required>
                        <option value="">Selecciona una opción</option>
                        <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                        <option value="Cédula de Ciudadanía">Cédula de Ciudadanía</option>
                        <option value="Cédula de Extranjería">Cédula de Extranjería</option>
                    </select>
                    <x-input-error :messages="$errors->get('tipo_identificacion')" class="mt-2" />
                </div>

                <!-- Número Identificación -->
                <div class="input-group">
                    <label for="numero_identificacion">{{ __('Número de identificación') }}</label>
                    <input id="numero_identificacion" type="text" name="numero_identificacion" value="{{ old('numero_identificacion') }}" required>
                    <x-input-error :messages="$errors->get('numero_identificacion')" class="mt-2" />
                </div>

                <!-- Botón -->
                <button type="submit" class="registro-btn">
                    <i class="fas fa-user-plus"></i> {{ __('Registrarse') }}
                </button>

                <div class="help-links">
                    <a class="login-link" href="{{ route('login') }}">
                        {{ __('¿Ya estás registrado?') }}
                    </a>
                </div>
            </form>
        </div>

        <div class="footer">
            © 2025 UNIAUTÓNOMA DEL CAUCA - Todos los derechos reservados
        </div>
    </div>

