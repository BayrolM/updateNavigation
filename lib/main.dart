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

  /// ============================================================================
  /// SCAFFOLD PRINCIPAL
  /// Pantalla inicial que muestra los 6 botones para navegar a otros estados
  /// ============================================================================
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

  /// ============================================================================
  /// SCAFFOLD ESTADO 1
  /// Primera pantalla secundaria con título, contenedor y botón de regreso
  /// ============================================================================
  Widget _buildPantalla1() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¡Bienvenido a la Pantalla 1!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Esta es la primera pantalla de la aplicación. '
                      'Aquí puedes mostrar información específica del estado 1. '
                      'Los contenedores permiten agrupar widgets y aplicar estilos '
                      'como bordes, sombras y colores de fondo.',
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
                        backgroundColor: Colors.blue,
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

  /// ============================================================================
  /// SCAFFOLD ESTADO 2
  /// Segunda pantalla secundaria con título, contenedor y botón de regreso
  /// ============================================================================
  Widget _buildPantalla2() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¡Bienvenido a la Pantalla 2!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Esta es la segunda pantalla de la aplicación. '
                      'Cada pantalla mantiene su propio diseño y colores. '
                      'El manejo de estados permite que la aplicación sea '
                      'interactiva y responda a las acciones del usuario de '
                      'manera eficiente y organizada.',
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
                        backgroundColor: Colors.green,
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

  /// ============================================================================
  /// SCAFFOLD ESTADO 3
  /// Tercera pantalla secundaria con título, contenedor y botón de regreso
  /// ============================================================================
  Widget _buildPantalla3() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 3'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¡Bienvenido a la Pantalla 3!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Esta es la tercera pantalla de la aplicación. '
                      'El uso de setState() permite que Flutter redibuje solo '
                      'las partes necesarias de la interfaz, haciendo que las '
                      'aplicaciones sean rápidas y eficientes. Esta es una de '
                      'las características principales de Flutter.',
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
                        backgroundColor: Colors.orange,
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

  Widget _buildPantalla4() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 4'),
        backgroundColor: const Color.fromARGB(255, 255, 0, 251),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFadeTransition(
            opacity: _fadeAnimation,
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¡Bienvenido a la Pantalla 4!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 247, 0, 255),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Esta pantalla tiene animación de fade. '
                              'El contenido aparece y desaparece suavemente. '
                              'SliverFadeTransition es ideal para listas deslizables.',
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
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  255,
                                  0,
                                  217,
                                ),
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

  Widget _buildPantalla5() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 5'),
        backgroundColor: const Color.fromARGB(255, 179, 255, 0),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFadeTransition(
            opacity: _fadeAnimation,
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¡Bienvenido a la Pantalla 5!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 179, 255, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade50,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Animación aplicada aquí también. '
                              'El fade cíclico hace la pantalla más viva.',
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
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  179,
                                  255,
                                  0,
                                ),
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

  Widget _buildPantalla6() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 6'),
        backgroundColor: const Color.fromARGB(255, 0, 76, 99),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFadeTransition(
            opacity: _fadeAnimation,
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¡Bienvenido a la Pantalla 6!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 76, 99),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Última pantalla con fade. '
                              'Experimenta con curvas para personalizar.',
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
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  76,
                                  99,
                                ),
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

// Aquí termina la primera mitad. La segunda mitad viene a continuación.
