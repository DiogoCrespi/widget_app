import 'package:flutter/material.dart';

class ColumnWidgetPage extends StatefulWidget {
  const ColumnWidgetPage({super.key});

  @override
  State<ColumnWidgetPage> createState() => _ColumnWidgetPageState();
}

class _ColumnWidgetPageState extends State<ColumnWidgetPage> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Column Widget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore o comportamento do widget Column:',
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
                        Icon(Icons.settings, color: Colors.deepPurple),
                        SizedBox(width: 8),
                        Text(
                          'Configurações',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    DropdownButton<MainAxisAlignment>(
                      value: _mainAxisAlignment,
                      onChanged: (value) =>
                          setState(() => _mainAxisAlignment = value!),
                      isExpanded: true,
                      items: MainAxisAlignment.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text('mainAxisAlignment: ${e.name}'),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<CrossAxisAlignment>(
                      value: _crossAxisAlignment,
                      onChanged: (value) =>
                          setState(() => _crossAxisAlignment = value!),
                      isExpanded: true,
                      items: CrossAxisAlignment.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text('crossAxisAlignment: ${e.name}'),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<MainAxisSize>(
                      value: _mainAxisSize,
                      onChanged: (value) =>
                          setState(() => _mainAxisSize = value!),
                      isExpanded: true,
                      items: MainAxisSize.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text('mainAxisSize: ${e.name}'),
                        );
                      }).toList(),
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
              child: Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: _mainAxisSize == MainAxisSize.min
                          ? Colors.red
                          : Colors.green,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: _mainAxisAlignment,
                    crossAxisAlignment: _crossAxisAlignment,
                    mainAxisSize: _mainAxisSize,
                    textBaseline:
                    _crossAxisAlignment == CrossAxisAlignment.baseline
                        ? TextBaseline.alphabetic
                        : null,
                    children: [
                      _textBox('Texto pequeno', 14, Colors.red),
                      _textBox('Texto médio', 20, Colors.green),
                      _textBox('Texto grande', 28, Colors.blue),
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

  Widget _textBox(String text, double fontSize, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
