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
                        Text('Configurações', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Divider(),

                    DropdownButton<MainAxisAlignment>(
                      value: _mainAxisAlignment,
                      onChanged: (value) => setState(() => _mainAxisAlignment = value!),
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
                      onChanged: (value) => setState(() => _crossAxisAlignment = value!),
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
                      onChanged: (value) => setState(() => _mainAxisSize = value!),
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
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: _mainAxisAlignment,
                  crossAxisAlignment: _crossAxisAlignment,
                  mainAxisSize: _mainAxisSize,
                  children: [
                    _colorBox('Container 1', Colors.red),
                    _colorBox('Container 2', Colors.green),
                    _colorBox('Container 3', Colors.blue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorBox(String label, Color color) {
    return Container(
      width: 120,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
