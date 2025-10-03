import 'package:flutter/material.dart';
import 'package:app_fitfeast/homepage.dart';
import 'package:app_fitfeast/src/features/workouts/views/workout_list_screen.dart';
import 'package:app_fitfeast/src/features/nutrition_recipes/views/recipes_screen.dart';
import 'package:app_fitfeast/src/features/user/views/user_configuration.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    PantallaInicio(),
    PantallaEjercicios(),
    PantallaRecetas(),
    PantallaUsuario(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Ejercicios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Recetas",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
