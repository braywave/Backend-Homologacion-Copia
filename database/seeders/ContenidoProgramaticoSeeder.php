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
        // Asegúrate de que las asignaturas con id_asignatura 1, 2, 3, 4, 5 y 6 existan
        ContenidoProgramatico::create([
            'asignatura_id' => 1, // ID de la asignatura
            'tema' => 'Introducción a las Matemáticas',
            'resultados_aprendizaje' => 'Comprender los conceptos básicos de matemáticas.',
            'descripcion' => 'Este tema cubre los fundamentos de las matemáticas, incluyendo operaciones básicas y propiedades de los números.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 1,
            'tema' => 'Álgebra Básica',
            'resultados_aprendizaje' => 'Resolver ecuaciones simples y entender variables.',
            'descripcion' => 'Se introducen las variables y se enseña a resolver ecuaciones lineales simples.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 2, // ID de la asignatura
            'tema' => 'Cinemática',
            'resultados_aprendizaje' => 'Analizar el movimiento de los cuerpos.',
            'descripcion' => 'Este tema aborda el estudio del movimiento de los cuerpos sin considerar las causas que lo producen.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 2,
            'tema' => 'Dinámica',
            'resultados_aprendizaje' => 'Comprender las fuerzas y su efecto en el movimiento.',
            'descripcion' => 'Se estudian las fuerzas que actúan sobre los cuerpos y cómo afectan su movimiento.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 3, // ID de la asignatura
            'tema' => 'Fundamentos de Programación',
            'resultados_aprendizaje' => 'Desarrollar algoritmos y entender la lógica de programación.',
            'descripcion' => 'Este tema cubre los conceptos básicos de programación, incluyendo variables, estructuras de control y funciones.',
        ]);

        ContenidoProgramatico::create([
            'asignatura_id' => 3,
            'tema' => 'Estructuras de Datos',
            'resultados_aprendizaje' => 'Conocer las estructuras de datos más comunes y su uso.',
            'descripcion' => 'Se estudian las estructuras de datos como arreglos, listas y árboles, y cómo se utilizan en la programación.',
        ]);
    }
}
