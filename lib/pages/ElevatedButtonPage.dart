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

      final text = _texts[_random.nextInt(_texts.length)];
      final icon = _icons[_random.nextInt(_icons.length)];

      final choice = _random.nextInt(3);
      if (choice == 0) {
        _child = Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
        );
      } else if (choice == 1) {
        _child = Icon(icon, color: Colors.white, size: 24);
      } else {
        _child = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
            ),
          ],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: ElevatedButton')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Clique no botão para aleatorizar o estilo:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _backgroundColor,
                  elevation: _elevation,
                  padding: _padding,
                  shape: RoundedRectangleBorder(borderRadius: _borderRadius),
                ),
                onPressed: _randomizeStyle,
                child: _child,
              ),
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow('Cor de fundo:', _colorToHex(_backgroundColor)),
                    const SizedBox(height: 12),
                    _infoRow('Elevação:', _elevation.toStringAsFixed(2)),
                    const SizedBox(height: 12),
                    _infoRow('Raio da borda:', (_borderRadius as BorderRadius).topLeft.x.toStringAsFixed(2)),
                    const SizedBox(height: 12),
                    _infoRow('Padding horizontal:', (_padding as EdgeInsets).horizontal.toStringAsFixed(2)),
                    const SizedBox(height: 12),
                    _infoRow('Padding vertical:', (_padding as EdgeInsets).vertical.toStringAsFixed(2)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ),
      ],
    );
  }

  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
