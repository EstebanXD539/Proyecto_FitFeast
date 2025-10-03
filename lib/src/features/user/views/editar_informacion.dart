import 'package:flutter/material.dart';

class EditarInformacionPage extends StatefulWidget {
  const EditarInformacionPage({super.key});

  @override
  State<EditarInformacionPage> createState() => _EditarInformacionPageState();
}

class _EditarInformacionPageState extends State<EditarInformacionPage> {
  final TextEditingController nombreCtrl = TextEditingController(
    text: "Luis Suarez",
  );
  final TextEditingController edadCtrl = TextEditingController(text: "26");
  final TextEditingController alturaCtrl = TextEditingController(text: "170");
  final TextEditingController pesoCtrl = TextEditingController(text: "70");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Información")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextField(
              controller: nombreCtrl,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: edadCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Edad"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: alturaCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Altura (cm)"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: pesoCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Peso (kg)"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Aquí podrías guardar los datos en backend o local
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Información actualizada")),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Guardar cambios"),
            ),
          ],
        ),
      ),
    );
  }
}
