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
      _width = 150 + _random.nextInt(150).toDouble();  // 150 a 300
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AnimatedContainer permite animar mudanças automáticas de propriedades.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            AnimatedContainer(
              width: _width,
              height: _height,
              duration: _duration,
              curve: _curve,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: _color.withOpacity(0.6),
                    blurRadius: 12,
                    spreadRadius: 3,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              alignment: Alignment.center,
              child: const Text(
                'Card informativo',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            const SizedBox(height: 20),

            Text('Duração da animação: ${_duration.inMilliseconds} ms',
                style: const TextStyle(fontSize: 16)),
            Text('Curva da animação: ${_curveName(_curve)}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                onPressed: _randomize,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Animar Card'),
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Boas práticas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Use AnimatedContainer para animar mudanças visuais simples sem criar explicitamente um AnimationController.\n'
                  '• Prefira curvas suaves (easeInOut) para transições agradáveis.\n'
                  '• Ajuste duração para que a animação não seja muito rápida ou lenta.\n'
                  '• Combine animação de propriedades para efeito mais natural e responsivo.\n'
                  '• Evite animações muito longas para não frustrar o usuário.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
