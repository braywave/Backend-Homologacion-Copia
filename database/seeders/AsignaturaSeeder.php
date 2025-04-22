<?php

namespace Database\Seeders;

use App\Models\Asignatura;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class AsignaturaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Desactivar restricciones de clave foránea para truncar
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        // Truncar la tabla
        Asignatura::truncate();

        // Reactivar restricciones
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        // Máximo largo para el código de asignatura
        $maxLength = 20;

        // Listado de asignaturas por programa_id
        $pensum = [
            // Universidad del Cauca
            1 => [ // Ing. Electrónica y Telecomunicaciones
                'Circuitos Eléctricos', 'Electrónica Analógica', 'Electrónica Digital',
                'Comunicación Digital', 'Microcontroladores', 'Procesamiento de Señales',
                'Control Automático', 'Redes de Computadoras', 'Proyecto Electrónico I'
            ],
            2 => [ // Ing. Civil
                'Matemáticas I', 'Topografía', 'Mecánica de Materiales',
                'Hidráulica', 'Estructuras I', 'Materiales de Construcción',
                'Geotecnia', 'Transporte y Vías', 'Gestión de Proyectos'
            ],
            3 => [ // Ing. de Sistemas
                'Fundamentos de Programación', 'Estructuras de Datos', 'Sistemas Operativos',
                'Redes de Computadores', 'Bases de Datos', 'Ingeniería de Software',
                'Análisis de Algoritmos', 'Desarrollo Web', 'Sistemas Distribuidos'
            ],
            4 => [ // Ing. en Automática Industrial
                'Control de Procesos', 'Instrumentación Industrial', 'Sistemas SCADA',
                'Robótica Industrial', 'Electrónica de Potencia', 'PLC y Modulación',
                'Redes Industriales', 'Mantenimiento Industrial', 'Metrología'
            ],
            5 => [ // Ing. Física
                'Matemáticas I', 'Física I', 'Física II',
                'Termodinámica', 'Mecánica Cuántica', 'Ondas y Óptica',
                'Física Computacional', 'Electrónica para Físicos', 'Láseres y Fotónica'
            ],

            // FUP
            6 => [ // Ing. de Sistemas
                'Programación I', 'Estructuras de Datos', 'Arquitectura de Computadores',
                'Bases de Datos', 'Ingeniería de Software', 'Redes y Comunicaciones',
                'Sistemas Operativos', 'Seguridad Informática', 'Gestión de Proyectos'
            ],
            7 => [ // Ing. Industrial
                'Investigación de Operaciones', 'Estadística Aplicada', 'Gestión de Calidad',
                'Procesos de Manufactura', 'Ingeniería de Métodos', 'Logística',
                'Gestión de la Producción', 'Seguridad Industrial', 'Ergonomía'
            ],
            8 => [ // Arquitectura
                'Diseño Arquitectónico', 'Historia de la Arquitectura', 'Construcción I',
                'Dibujo Arquitectónico', 'Urbanismo', 'Tecnología de la Construcción',
                'Paisajismo', 'BIM', 'Diseño Urbano'
            ],

            // Colegio Mayor del Cauca
            9  => [ // Ing. Informática
                'Fundamentos de Programación', 'Estructuras de Datos', 'Sistemas Operativos',
                'Bases de Datos', 'Redes de Computadores', 'Desarrollo Web',
                'Programación Móvil', 'Inteligencia Artificial', 'Seguridad Informática'
            ],
            10 => [ // Ing. Electrónica
                'Circuitos Eléctricos', 'Electrónica Analógica', 'Electrónica Digital',
                'Microcontroladores', 'Señales y Sistemas', 'Electrónica de Potencia',
                'Control Automático', 'Redes de Comunicaciones', 'Proyecto Electrónico I'
            ],
            11 => [ // Tecnología en Desarrollo de Software
                'Análisis de Requisitos', 'Diseño de Software', 'Programación Orientada a Objetos',
                'Bases de Datos', 'Desarrollo Web', 'Pruebas de Software',
                'Metodologías Ágiles', 'DevOps Básico', 'Cloud Computing', 'Proyecto Integrador'
            ],

            // SENA Regional Cauca (IDs 16–23)
            16 => [ // Tecnólogo en Análisis y Desarrollo de Software
                'Analizar Requerimientos', 'Diseñar Soluciones Software', 'Desarrollar Aplicaciones',
                'Realizar Pruebas de Software', 'Implementar Front‑end', 'Desplegar en Servidor',
                'Mantener Software', 'Documentar Proyectos'
            ],
            17 => [ // Técnico en Sistemas
                'Instalar Software', 'Configurar Hardware', 'Administrar Sistemas Operativos',
                'Montar Redes Locales', 'Mantenimiento Preventivo', 'Administrar Cuentas de Usuario',
                'Instalación de Periféricos', 'Monitoreo de Sistemas'
            ],
            18 => [ // Tecnólogo en Gestión de Redes de Datos
                'Diseñar Topologías de Red', 'Configurar Routers y Switches', 'Implementar VLAN',
                'Asegurar Redes', 'Monitorizar Tráfico', 'Administrar VPN',
                'Optimizar Rendimiento', 'Gestionar Proyectos de Redes'
            ],
            19 => [ // Tecnólogo en Producción Multimedia
                'Diseñar Gráficos', 'Edición de Video', 'Creación de Animaciones',
                'Producción de Audio', 'Maquetación Web', 'Modelado 3D',
                'UX/UI Básico', 'Publicación Multimedia'
            ],
            20 => [ // Técnico en Programación de Software
                'Codificar Módulos', 'Depurar Código', 'Gestionar Repositorios',
                'Documentar Código', 'Ejecutar Compilaciones', 'Pruebas Unitarias',
                'Asistir en Análisis', 'Soporte a Usuario'
            ],
            21 => [ // Tecnólogo en Implementación de Infraestructura TIC
                'Instalar Servidores', 'Configurar Redes', 'Desplegar Servicios',
                'Virtualización', 'Administrar Almacenamiento', 'Asegurar Infraestructura',
                'Automatizar Despliegues', 'Monitorizar Servicios'
            ],
            22 => [ // Tecnólogo en Gestión de Seguridad y Salud en el Trabajo
                'Identificar Riesgos', 'Implementar Medidas Preventivas', 'Elaborar Planes SST',
                'Capacitar Personal', 'Realizar Auditorías', 'Gestionar Incidentes',
                'Reportar Accidentes', 'Actualizar Normatividad'
            ],
            23 => [ // Tecnólogo en Gestión de Proyectos de Desarrollo de Software
                'Definir Alcance', 'Elaborar Cronogramas', 'Administrar Recursos',
                'Gestionar Riesgos', 'Liderar Equipos', 'Controlar Calidad',
                'Comunicar Stakeholders', 'Entregar Entregables'
            ],
        ];

        foreach ($pensum as $programaId => $asigs) {
            $esSena = $programaId >= 16 && $programaId <= 23;
            foreach ($asigs as $index => $nombre) {
                // Generar un código único combinando programa_id y un hash corto del nombre
                $slug = Str::slug($nombre, '_');
                // Limitar la longitud del slug para asegurar que el código no exceda $maxLength
                $codigoLength = strlen($programaId . '_') + 10; // 10 es un tamaño seguro para la parte del slug
                $codigo = $programaId . '_' . strtoupper(substr($slug, 0, min(strlen($slug), $maxLength - $codigoLength)));

                // Asegurar que el código no exceda $maxLength
                if (strlen($codigo) > $maxLength) {
                    $codigo = substr($codigo, 0, $maxLength);
                }

                Asignatura::updateOrCreate(
                    ['codigo_asignatura' => $codigo],
                    [
                        'programa_id'             => $programaId,
                        'nombre'                  => $nombre,
                        'tipo'                    => $esSena ? 'Competencia' : 'Materia',
                        // Los demás campos quedan igual
                        'creditos'                => $esSena ? null : 3,
                        'horas_sena'              => $esSena ? 160 : null,
                        'semestre'                => $esSena
                            ? ($index < 4 ? 1 : 2)
                            : floor($index / 5) + 1,
                        'tiempo_presencial'       => $esSena ? 4 : 2,
                        'tiempo_independiente'    => $esSena ? 4 : 4,
                        'horas_totales_semanales' => $esSena ? 8 : 6,
                        'modalidad'               => $esSena ? 'Práctico' : 'Teórico-Práctico',
                        'metodologia'             => 'Presencial',
                        'created_at'              => now(),
                        'updated_at'              => now(),
                    ]
                );
            }
        }

        // AUTÓNOMA DEL CAUCA - Ingeniería de Software
        $programaId = 12; // ID del programa de Ingeniería de Software en la Autónoma

        $codigoBase = 'IS'; // Prefijo base para Ingeniería de Software

        $pensum = [
            1 => ['Matemáticas I', 'Física I', 'Programación I', 'Comunicación Oral y Escrita', 'Fundamentos de Ingeniería de Software'],
            2 => ['Matemáticas II', 'Física II', 'Programación II', 'Lógica y Matemática Discreta', 'Arquitectura de Computadores'],
            3 => ['Estructuras de Datos', 'Bases de Datos I', 'Ingeniería de Requisitos', 'Probabilidad y Estadística', 'Sistemas Operativos'],
            4 => ['Bases de Datos II', 'Diseño de Software', 'Ingeniería de Software I', 'Análisis y Diseño de Algoritmos', 'Redes de Computadores'],
            5 => ['Lenguajes de Programación', 'Seguridad Informática', 'Gestión de Proyectos de Software', 'Desarrollo Web', 'Electiva Profesional I'],
            6 => ['Ingeniería de Software II', 'Desarrollo de Aplicaciones Móviles', 'Computación en la Nube', 'Interacción Humano-Computador', 'Electiva Profesional II'],
            7 => ['Inteligencia Artificial', 'Arquitectura de Software', 'Auditoría y Normatividad en Software', 'Electiva Profesional III', 'Práctica Empresarial I'],
            8 => ['Minería de Datos', 'DevOps y Automatización', 'Ética Profesional', 'Electiva Profesional IV', 'Práctica Empresarial II'],
            9 => ['Trabajo de Grado', 'Emprendimiento y Nuevas Tecnologías'],
        ];

        foreach ($pensum as $semestre => $asignaturas) {
            foreach ($asignaturas as $index => $nombre) {
                // Generar código único para evitar duplicados, asegurando que no exceda $maxLength
                $codigo = $codigoBase . '_S' . $semestre . '_M' . ($index + 1);

                // Asegurar que el código no exceda $maxLength
                if (strlen($codigo) > $maxLength) {
                    $codigo = substr($codigo, 0, $maxLength);
                }

                Asignatura::updateOrCreate(
                    ['codigo_asignatura' => $codigo],
                    [
                        'programa_id' => $programaId,
                        'nombre' => $nombre,
                        'tipo' => 'Materia',
                        'creditos' => 3,
                        'semestre' => $semestre,
                        'horas_sena' => null,
                        'tiempo_presencial' => 2,
                        'tiempo_independiente' => 4,
                        'horas_totales_semanales' => 6,
                        'modalidad' => 'Teórico-Práctico',
                        'metodologia' => 'Presencial',
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]
                );
            }
        }
    }
}
