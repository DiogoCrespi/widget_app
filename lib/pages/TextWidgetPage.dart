import 'dart:math';
import 'package:flutter/material.dart';

class TextWidgetPage extends StatefulWidget {
  const TextWidgetPage({super.key});

  @override
  State<TextWidgetPage> createState() => _TextWidgetPageState();
}

class _TextWidgetPageState extends State<TextWidgetPage> {
  TextAlign _textAlign = TextAlign.start;
  TextOverflow _overflow = TextOverflow.clip;
  int _maxLines = 3;
  TextStyle _style = const TextStyle(fontSize: 16);

  final String _loremIpsum = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales turpis ac tristique laoreet. Curabitur tristique blandit lacus, eget porta mauris cursus a. Nulla facilisi. Praesent quis tincidunt enim. In ac pharetra sapien. Fusce nec tincidunt mi. Aenean varius urna sed felis efficitur, sit amet fringilla justo rutrum. 
Aliquam erat volutpat. Morbi porta, eros id ultrices laoreet, ex metus congue metus, vel tincidunt mauris nisi vitae urna. Sed nec orci urna. Duis scelerisque mi a tellus vehicula, a finibus erat tincidunt. Suspendisse rhoncus, magna in faucibus sollicitudin, leo tellus cursus risus, sed tincidunt lorem nisi eget nunc.
''';

  void _randomizeStyle() {
    final random = Random();
    setState(() {
      _style = TextStyle(
        fontSize: 14.0 + random.nextInt(18),
        color: Colors.primaries[random.nextInt(Colors.primaries.length)],
        fontWeight: FontWeight.values[random.nextInt(FontWeight.values.length)],
        fontStyle: random.nextBool() ? FontStyle.italic : FontStyle.normal,
        letterSpacing: random.nextBool() ? 1.5 : 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Text Widget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore as propriedades do widget Text:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.settings, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Configurações', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Divider(),

                    // Dropdowns
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton<TextAlign>(
                          value: _textAlign,
                          onChanged: (value) => setState(() => _textAlign = value!),
                          items: TextAlign.values.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text('Alinhamento: ${e.name}'),
                            );
                          }).toList(),
                        ),
                        DropdownButton<TextOverflow>(
                          value: _overflow,
                          onChanged: (value) => setState(() => _overflow = value!),
                          items: TextOverflow.values.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text('Overflow: ${e.name}'),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Slider
                    Row(
                      children: [
                        const Icon(Icons.line_weight),
                        const SizedBox(width: 8),
                        const Text("Linhas máximas: "),
                        Expanded(
                          child: Slider(
                            value: _maxLines.toDouble(),
                            min: 1,
                            max: 10,
                            divisions: 9,
                            label: '$_maxLines',
                            onChanged: (value) {
                              setState(() {
                                _maxLines = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    ElevatedButton.icon(
                      onPressed: _randomizeStyle,
                      icon: const Icon(Icons.shuffle),
                      label: const Text('Aleatorizar Estilo'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),
            const Text(
              'Resultado',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Divider(),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _loremIpsum,
                    textAlign: _textAlign,
                    overflow: _overflow,
                    maxLines: _maxLines,
                    style: _style,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
