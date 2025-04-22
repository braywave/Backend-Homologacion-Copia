{{-- //VISTA PARA MOSTRAR LA INSERCION Y SIMULACION DEL SEGUNDO FORMULARIO

 --}}
<form method="POST" action="{{ route('completar.nombre', Auth::user()->id_usuario) }}">
    @csrf

    <!-- 1) Primer nombre -->
    <label>Primer nombre</label>
    <input name="primer_nombre"
           value="{{ old('primer_nombre', auth()->user()->primer_nombre) }}"
           required>

    <!-- 2) Tipo de identificación -->
    <label>Tipo de identificación</label>
    <select name="tipo_identificacion" required>
        <option value="Tarjeta de Identidad"
                {{ auth()->user()->tipo_identificacion == 'Tarjeta de Identidad' ? 'selected' : '' }}>
            Tarjeta de Identidad
        </option>
        <option value="Cédula de Ciudadanía"
                {{ auth()->user()->tipo_identificacion == 'Cédula de Ciudadanía' ? 'selected' : '' }}>
            Cédula de Ciudadanía
        </option>
        <option value="Cédula de Extranjería"
                {{ auth()->user()->tipo_identificacion == 'Cédula de Extranjería' ? 'selected' : '' }}>
            Cédula de Extranjería
        </option>
    </select>

    <!-- 3) Email (si no deseas actualizarlo, puedes pasarlo como hidden) -->
    <input type="hidden" name="email" value="{{ auth()->user()->email }}">

    <button type="submit">Guardar</button>
</form>
