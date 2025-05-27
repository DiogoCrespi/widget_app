import 'dart:math';

import 'package:flutter/material.dart';

class ElevatedButtonPage extends StatefulWidget {
  const ElevatedButtonPage({super.key});

  @override
  State<ElevatedButtonPage> createState() => _ElevatedButtonPageState();
}

class _ElevatedButtonPageState extends State<ElevatedButtonPage> {
  final Random _random = Random();

  Color _backgroundColor = Colors.blue;
  double _elevation = 2;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  EdgeInsetsGeometry _padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  Widget _child = const Text('Enviar');

  final List<String> _texts = [
    'Enviar',
    'Confirmar',
    'Salvar',
    'Comprar',
    'Enviar Agora',
    'Clique Aqui',
  ];

  final List<IconData> _icons = [
    Icons.send,
    Icons.check,
    Icons.save,
    Icons.shopping_cart,
    Icons.play_arrow,
    Icons.touch_app,
  ];

  void _randomizeStyle() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );

      _elevation = _random.nextDouble() * 10; // 0 a 10 de elevação

      _borderRadius = BorderRadius.circular(_random.nextInt(30).toDouble() + 4);

      _padding = EdgeInsets.symmetric(
        horizontal: 12.0 + _random.nextInt(20),
        vertical: 8.0 + _random.nextInt(20),
      );

      // Escolher texto e ícone aleatoriamente
      final text = _texts[_random.nextInt(_texts.length)];
      final icon = _icons[_random.nextInt(_icons.length)];

      // Alternar entre só texto, só ícone ou texto+ícone
      final choice = _random.nextInt(3);
      if (choice == 0) {
        _child = Text(text);
      } else if (choice == 1) {
        _child = Icon(icon, color: Colors.white);
      } else {
        _child = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(text),
          ],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: ElevatedButton')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Clique no botão para aleatorizar o estilo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _backgroundColor,
                elevation: _elevation,
                padding: _padding,
                shape: RoundedRectangleBorder(borderRadius: _borderRadius),
              ),
              onPressed: _randomizeStyle,
              child: _child,
            ),
            const SizedBox(height: 40),
            Text('Cor de fundo: ${_backgroundColor.toString()}'),
            Text('Elevação: ${_elevation.toStringAsFixed(2)}'),
            Text('Raio da borda: ${(_borderRadius as BorderRadius).topLeft.x.toStringAsFixed(2)}'),
            Text('Padding horizontal: ${(_padding as EdgeInsets).horizontal.toStringAsFixed(2)}'),
            Text('Padding vertical: ${(_padding as EdgeInsets).vertical.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
