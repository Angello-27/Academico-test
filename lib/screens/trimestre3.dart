import 'package:flutter/material.dart';

class Trimestre3Screen extends StatelessWidget {
  const Trimestre3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calificaciones',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('No se han subido notas del 3er Trimestre'),
      ),
    );
  }
}
