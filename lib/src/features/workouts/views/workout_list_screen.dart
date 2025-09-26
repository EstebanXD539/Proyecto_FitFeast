import 'package:flutter/material.dart';

class PantallaEjercicios extends StatelessWidget {
  const PantallaEjercicios({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'title': 'Plancha',
        'desc': 'Ejercicio de core y abdomen',
        'image':
            'https://tse4.mm.bing.net/th/id/OIP.zBQG9c8RZLeQpiR1uhf5cAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
      {
        'title': 'Burpees',
        'desc': 'Ejercicio de cuerpo completo',
        'image':
            'https://tse1.explicit.bing.net/th/id/OIP.l3MaRHzuXayMYPLsSOGffAHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',
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
    );
  }
}
