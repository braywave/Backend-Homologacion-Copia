<?php

namespace Database\Seeders;

use App\Models\ContenidoProgramatico;
use App\Models\ContenidosProgramaticos;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ContenidoProgramaticoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        //FUP
        // Lógica de Programación
        ContenidoProgramatico::create([
            'asignatura_id' => 1, // ID correspondiente a "Lógica de Programación"
            'tema' => 'Fundamentos de la lógica y algoritmos',
            'resultados_aprendizaje' => 'Identifica estructuras lógicas y aplica algoritmos básicos en la solución de problemas.',
            'descripcion' => 'Se estudian los conceptos fundamentales de lógica computacional, operadores, estructuras condicionales y ciclos. El estudiante aprenderá a plantear algoritmos utilizando diagramas de flujo y pseudocódigo.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 1,
            'tema' => 'Estructuras de control',
            'resultados_aprendizaje' => 'Implementa estructuras de decisión y repetición en algoritmos para resolver problemas.',
            'descripcion' => 'Se profundiza en el uso de decisiones (if, switch) y ciclos (for, while) en pseudocódigo y su traducción a lenguajes de programación.',
        ]);

        // Fundamentos de Bases de Datos
        ContenidoProgramatico::create([
            'asignatura_id' => 2, // ID correspondiente a "Fundamentos de Bases de Datos"
            'tema' => 'Conceptos básicos de bases de datos',
            'resultados_aprendizaje' => 'Comprende el modelo relacional y su aplicación en sistemas de bases de datos.',
            'descripcion' => 'Se introduce al estudiante en el concepto de bases de datos, ventajas, modelos de datos y arquitectura general de un SGBD.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 2,
            'tema' => 'Modelo entidad-relación',
            'resultados_aprendizaje' => 'Diseña esquemas de base de datos utilizando modelos entidad-relación.',
            'descripcion' => 'El estudiante aprende a representar información mediante diagramas E-R y a convertir estos modelos en estructuras de base de datos relacional.',
        ]);

        // COLEGIO MAYOR

        // Matemáticas Básicas
        ContenidoProgramatico::create([
            'asignatura_id' => 3, // ID correspondiente a "Matemáticas Básicas" del Colegio Mayor
            'tema' => 'Aritmética y Álgebra elemental',
            'resultados_aprendizaje' => 'Aplica operaciones básicas y principios algebraicos en la resolución de problemas cotidianos.',
            'descripcion' => 'Incluye operaciones con números reales, fracciones, potencias, raíces y factorización de expresiones algebraicas simples.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 3,
            'tema' => 'Ecuaciones e inecuaciones',
            'resultados_aprendizaje' => 'Resuelve ecuaciones e inecuaciones de primer grado y problemas asociados.',
            'descripcion' => 'El estudiante aprenderá a interpretar y resolver ecuaciones lineales con una incógnita, así como inecuaciones básicas.',
        ]);

        // Contabilidad General
        ContenidoProgramatico::create([
            'asignatura_id' => 4, // ID correspondiente a "Contabilidad General" del Colegio Mayor
            'tema' => 'Principios de contabilidad',
            'resultados_aprendizaje' => 'Identifica los principios contables y su aplicación en registros financieros básicos.',
            'descripcion' => 'Introducción al concepto de contabilidad, principios básicos, ecuación contable y el ciclo contable.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 4,
            'tema' => 'Registros contables y estados financieros',
            'resultados_aprendizaje' => 'Registra operaciones contables básicas y elabora estados financieros simples.',
            'descripcion' => 'Se enseña la elaboración de libros contables, registro de transacciones y presentación de estados como el balance general y el estado de resultados.',
        ]);

        //SENA

        // Desarrollar software de acuerdo con los requerimientos
        ContenidoProgramatico::create([
            'asignatura_id' => 7, // ID correspondiente a esta asignatura del SENA
            'tema' => 'Análisis de requerimientos',
            'resultados_aprendizaje' => 'Analiza requerimientos funcionales y no funcionales para el desarrollo de aplicaciones.',
            'descripcion' => 'Se estudian técnicas para levantamiento, documentación y validación de requerimientos, incluyendo historias de usuario y diagramas UML.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 7,
            'tema' => 'Diseño e implementación de software',
            'resultados_aprendizaje' => 'Implementa soluciones de software que cumplen con los requerimientos definidos.',
            'descripcion' => 'Incluye diseño estructurado, selección de tecnologías adecuadas, codificación y pruebas básicas del producto.',
        ]);

        // Aplicar buenas prácticas de desarrollo
        ContenidoProgramatico::create([
            'asignatura_id' => 8, // ID correspondiente a esta asignatura del SENA
            'tema' => 'Control de versiones y documentación',
            'resultados_aprendizaje' => 'Utiliza herramientas de control de versiones y documenta adecuadamente el código.',
            'descripcion' => 'Se enseña el uso de Git, convenciones de escritura de código, documentación técnica y comentarios eficientes.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 8,
            'tema' => 'Buenas prácticas de codificación',
            'resultados_aprendizaje' => 'Aplica principios como modularidad, reutilización y limpieza en el código fuente.',
            'descripcion' => 'Estándares de codificación, principios SOLID, revisión de código y mantenimiento.',
        ]);

        // CAUCA

        ContenidoProgramatico::create([
            'asignatura_id' => 5, // ID correspondiente a Matemáticas I
            'tema' => 'Funciones y límites',
            'resultados_aprendizaje' => 'Interpreta y representa funciones, y analiza su comportamiento mediante el concepto de límite.',
            'descripcion' => 'Se abordan tipos de funciones, dominio, codominio, límites laterales, continuidad y teoremas básicos de límites.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 5,
            'tema' => 'Derivadas y aplicaciones',
            'resultados_aprendizaje' => 'Aplica derivadas en problemas de optimización, tasas de cambio y análisis de gráficas.',
            'descripcion' => 'Incluye reglas de derivación, derivadas de funciones trigonométricas, exponenciales y logarítmicas, así como sus aplicaciones prácticas.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 6, // ID correspondiente a Física I
            'tema' => 'Electricidad básica',
            'resultados_aprendizaje' => 'Comprende y aplica los conceptos fundamentales de corriente, voltaje y resistencia.',
            'descripcion' => 'Estudio de cargas eléctricas, Ley de Ohm, circuitos resistivos simples y análisis de mallas.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 6,
            'tema' => 'Circuitos en corriente continua',
            'resultados_aprendizaje' => 'Analiza el comportamiento de circuitos eléctricos simples con resistencias y fuentes.',
            'descripcion' => 'Uso de las leyes de Kirchhoff, divisores de voltaje y corriente, y principios de diseño de circuitos básicos.',
        ]);

        //AUTONOMA SOLO PRIMER SEMESTRE:

        $contenidos = [
            'Matemáticas I' => [
                'tema' => 'Cálculo diferencial',
                'resultados' => 'Comprende y aplica los conceptos fundamentales de límites, derivadas y sus aplicaciones en problemas de ingeniería.',
                'descripcion' => 'Estudio del comportamiento de funciones, derivación y sus usos prácticos como tasas de cambio, optimización y modelamiento.'
            ],
            'Física I' => [
                'tema' => 'Cinemática y dinámica',
                'resultados' => 'Aplica leyes del movimiento y la fuerza en sistemas físicos básicos utilizando herramientas matemáticas.',
                'descripcion' => 'Exploración del movimiento rectilíneo y curvilíneo, leyes de Newton, trabajo, energía y conservación.'
            ],
            'Programación I' => [
                'tema' => 'Fundamentos de programación',
                'resultados' => 'Desarrolla algoritmos básicos aplicando estructuras de control y tipos de datos en un lenguaje de programación.',
                'descripcion' => 'Introducción a la lógica de programación, variables, condicionales, bucles, arreglos y funciones.'
            ],
            'Comunicación Oral y Escrita' => [
                'tema' => 'Expresión académica y profesional',
                'resultados' => 'Redacta e interpreta textos académicos y realiza exposiciones orales de manera clara y estructurada.',
                'descripcion' => 'Técnicas de lectura crítica, escritura académica, argumentación, presentación de ideas y oratoria.'
            ],
            'Fundamentos de Ingeniería de Software' => [
                'tema' => 'Introducción al ciclo de vida del software',
                'resultados' => 'Identifica fases, modelos y roles en el desarrollo de software, reconociendo buenas prácticas y estándares.',
                'descripcion' => 'Panorama general de la ingeniería de software, enfoques tradicionales y ágiles, calidad y gestión de proyectos.'
            ]
        ];

        foreach ($contenidos as $nombre => $data) {
            $asignatura = \App\Models\Asignatura::where('nombre', $nombre)
                ->where('programa_id', 12)
                ->first();

            if ($asignatura) {
                ContenidoProgramatico::create([
                    'asignatura_id' => $asignatura->id_asignatura,
                    'tema' => $data['tema'],
                    'resultados_aprendizaje' => $data['resultados'],
                    'descripcion' => $data['descripcion'],
                ]);
            }
        }


    }
}
