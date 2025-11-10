import 'package:flutter/material.dart';

/// Punto de entrada principal de la aplicación
/// Esta es la primera función que se ejecuta cuando inicia la app
void main() {
  runApp(const MyApp());
}

/// Enumeración que define los diferentes estados/pantallas de la aplicación
/// Usar un enum es una buena práctica para manejar estados finitos y evitar errores
enum AppState {
  principal, // Estado inicial con los 3 botones
  pantalla1, // Primer estado secundario
  pantalla2, // Segundo estado secundario
  pantalla3, // Tercer estado secundario
  pantalla4,
  pantalla5,
  pantalla6,
}

/// Widget raíz de la aplicación (sin estado - StatelessWidget)
/// Este widget configura el tema y la estructura base de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación (se muestra en el task manager del dispositivo)
      title: 'App Multi-Estado',

      // Configuración del tema visual de la aplicación
      theme: ThemeData(
        // Genera un esquema de colores basado en un color semilla
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Usa Material 3 para un diseño moderno
        useMaterial3: true,
      ),

      // Define la pantalla inicial de la aplicación
      home: const PaginaPrincipal(),
    );
  }
}

/// Widget principal con estado (StatefulWidget)
/// Este widget puede cambiar su estado interno y reconstruirse cuando sea necesario
class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

/// Clase State que maneja el estado mutable de PaginaPrincipal
/// Aquí es donde se guarda y gestiona el estado actual de la aplicación
/// Agregamos SingleTickerProviderStateMixin para manejar animaciones
class _PaginaPrincipalState extends State<PaginaPrincipal>
    with SingleTickerProviderStateMixin {
  // Variable que guarda el estado actual de la aplicación
  // Inicialmente está en el estado principal
  AppState _estadoActual = AppState.principal;

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _fadeAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Método para cambiar el estado de la aplicación
  /// Parámetro: nuevoEstado - El estado al que queremos cambiar
  void _cambiarEstado(AppState nuevoEstado) {
    setState(() {
      // setState() le indica a Flutter que el estado cambió
      // y que debe reconstruir el widget con los nuevos valores
      _estadoActual = nuevoEstado;
    });
  }

  /// Método para volver al estado principal desde cualquier otra pantalla
  void _volverAlInicio() {
    _cambiarEstado(AppState.principal);
  }

  @override
  Widget build(BuildContext context) {
    // Switch expression que retorna el widget apropiado según el estado actual
    // Es una forma elegante y clara de manejar múltiples estados
    return switch (_estadoActual) {
      AppState.principal => _buildPantallaPrincipal(),
      AppState.pantalla1 => _buildPantalla1(),
      AppState.pantalla2 => _buildPantalla2(),
      AppState.pantalla3 => _buildPantalla3(),
      AppState.pantalla4 => _buildPantalla4(),
      AppState.pantalla5 => _buildPantalla5(),
      AppState.pantalla6 => _buildPantalla6(),
    };
  }

  Widget _buildPantallaPrincipal() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Selecciona una opción',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 1',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla2),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 2',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla3),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 3',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla4),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 0, 242),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 4',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla5),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 179, 255, 0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 5',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla6),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 76, 99),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 6',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPantalla1() => _pantallaBase(
    titulo: 'Pantalla 1',
    color: Colors.blue,
    descripcion:
        'Esta es la primera pantalla de la aplicación. '
        'Aquí puedes mostrar información específica del estado 1. '
        'Los contenedores permiten agrupar widgets y aplicar estilos '
        'como bordes, sombras y colores de fondo.',
  );

  Widget _buildPantalla2() => _pantallaBase(
    titulo: 'Pantalla 2',
    color: Colors.green,
    descripcion:
        'Esta es la segunda pantalla de la aplicación. '
        'Cada pantalla mantiene su propio diseño y colores. '
        'El manejo de estados permite que la aplicación sea '
        'interactiva y responda a las acciones del usuario de '
        'manera eficiente y organizada.',
  );

  Widget _buildPantalla3() => _pantallaBase(
    titulo: 'Pantalla 3',
    color: Colors.orange,
    descripcion:
        'Esta es la tercera pantalla de la aplicación. '
        'El uso de setState() permite que Flutter redibuje solo '
        'las partes necesarias de la interfaz, haciendo que las '
        'aplicaciones sean rápidas y eficientes. Esta es una de '
        'las características principales de Flutter.',
  );

  Widget _buildPantalla4() => _pantallaAnimada(
    titulo: 'Pantalla 4',
    color: const Color.fromARGB(255, 255, 0, 251),
    colorTexto: const Color.fromARGB(255, 247, 0, 255),
    imageUrl: 'https://picsum.photos/400/200?random=4',
  );

  Widget _buildPantalla5() => _pantallaAnimada(
    titulo: 'Pantalla 5',
    color: const Color.fromARGB(255, 179, 255, 0),
    colorTexto: const Color.fromARGB(255, 179, 255, 0),
    imageUrl: 'https://picsum.photos/400/200?random=5',
  );

  Widget _buildPantalla6() => _pantallaAnimada(
    titulo: 'Pantalla 6',
    color: const Color.fromARGB(255, 0, 76, 99),
    colorTexto: const Color.fromARGB(255, 0, 76, 99),
    imageUrl: 'https://picsum.photos/400/200?random=6',
  );

  Widget _pantallaBase({
    required String titulo,
    required Color color,
    required String descripcion,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: color,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¡Bienvenido a $titulo!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(77),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha((0.3 * 255).round()),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      descripcion,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _volverAlInicio,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text(
                        'Volver al Inicio',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pantallaAnimada({
    required String titulo,
    required Color color,
    required Color colorTexto,
    required String imageUrl,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: color,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Imagen de red añadida
                      Image.network(imageUrl, height: 200, fit: BoxFit.cover),
                      const SizedBox(height: 20),
                      Text(
                        '¡Bienvenido a $titulo!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: colorTexto,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(77),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha((0.3 * 255).round()),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Pantalla con animación fade.',
                              style: TextStyle(fontSize: 16, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: _volverAlInicio,
                              icon: const Icon(Icons.arrow_back),
                              label: const Text(
                                'Volver al Inicio',
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
