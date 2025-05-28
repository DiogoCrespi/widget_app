import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 200;
  double _height = 120;
  Color _color = Colors.blue;
  Duration _duration = const Duration(milliseconds: 800);
  Curve _curve = Curves.easeInOut;

  final Random _random = Random();

  void _randomize() {
    setState(() {
      _width = 150 + _random.nextInt(150).toDouble(); // 150 a 300
      _height = 100 + _random.nextInt(150).toDouble(); // 100 a 250
      _color = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
      int durationMs = 400 + _random.nextInt(1200);
      _duration = Duration(milliseconds: durationMs);
      _curve = [
        Curves.easeIn,
        Curves.easeOut,
        Curves.easeInOut,
        Curves.bounceIn,
        Curves.bounceOut,
        Curves.elasticIn,
        Curves.elasticOut,
        Curves.decelerate,
      ][_random.nextInt(8)];
    });
  }

  String _curveName(Curve c) {
    switch (c) {
      case Curves.easeIn:
        return "easeIn";
      case Curves.easeOut:
        return "easeOut";
      case Curves.easeInOut:
        return "easeInOut";
      case Curves.bounceIn:
        return "bounceIn";
      case Curves.bounceOut:
        return "bounceOut";
      case Curves.elasticIn:
        return "elasticIn";
      case Curves.elasticOut:
        return "elasticOut";
      case Curves.decelerate:
        return "decelerate";
      default:
        return c.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: AnimatedContainer')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'AnimatedContainer permite animar mudanças automáticas de propriedades.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),

            // Linha com Duração, botão e Curva
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoBox('Duração', '${_duration.inMilliseconds} ms'),
                // Botão menor e mais compacto
                ElevatedButton.icon(
                  onPressed: _randomize,
                  icon: const Icon(Icons.play_arrow, size: 20),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Animar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 5,
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size(110, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
                _infoBox('Curva', _curveName(_curve)),
              ],
            ),

            const SizedBox(height: 36),

            // Card animado fica aqui embaixo
            Center(
              child: AnimatedContainer(
                width: _width,
                height: _height,
                duration: _duration,
                curve: _curve,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _color.withOpacity(0.6),
                      blurRadius: 16,
                      spreadRadius: 4,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Card informativo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black26,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(label,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87)),
        ],
      ),
    );
  }
}
