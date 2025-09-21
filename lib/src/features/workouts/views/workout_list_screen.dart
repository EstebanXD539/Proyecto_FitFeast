import 'package:flutter/material.dart';

class FitFeastApp extends StatelessWidget {
  const FitFeastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFeast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ExercisesPage(),
    );
  }
}

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'title': 'Flexiones de Pecho',
        'desc': 'Mejora tu fuerza y tronco central',
        'image':
            'https://via.placeholder.com/400x200', // reemplaza con tu asset o URL
      },
      {
        'title': 'Plancha',
        'desc': 'Mejora tu resistencia y fortalece los músculos del abdomen',
        'image': 'https://via.placeholder.com/400x200',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicios'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar ejercicios',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Filtros y resultados
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.category),
                  label: const Text('Categoría'),
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                  label: const Text('Favorito'),
                ),
                const Text('50 Resultados'),
              ],
            ),
            const SizedBox(height: 12),
            // Lista de ejercicios
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final ex = exercises[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          ex['image']!,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ex['title']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                ex['desc']!,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              FilledButton(
                                onPressed: () {},
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Barra de navegación inferior
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {},
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(
            icon: Icon(Icons.fitness_center),
            label: 'Ejercicios',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recetas',
          ),
          NavigationDestination(icon: Icon(Icons.flag), label: 'Retos'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
