import 'package:flutter/material.dart';

class ThemeDemoPage extends StatefulWidget {
  const ThemeDemoPage({super.key});

  @override
  State<ThemeDemoPage> createState() => _ThemeDemoPageState();
}

class _ThemeDemoPageState extends State<ThemeDemoPage> {
  // Define os temas possíveis
  final List<ThemeData> _themes = [
    ThemeData.light(), // Claro
    ThemeData.dark(),  // Escuro
    ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade700, brightness: Brightness.light),
      useMaterial3: true,
    ), // Quente (vermelho)
    ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700, brightness: Brightness.light),
      useMaterial3: true,
    ), // Frio (azul)
  ];

  // Índice do tema atual
  int _currentThemeIndex = 0;

  void _toggleTheme() {
    setState(() {
      _currentThemeIndex = (_currentThemeIndex + 1) % _themes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = _themes[_currentThemeIndex];

    return Theme(
      data: themeData,
      child: Builder(
        builder: (context) {
          final colorScheme = Theme.of(context).colorScheme;
          final brightness = Theme.of(context).brightness;
          final primaryColor = colorScheme.primary;
          final secondaryColor = colorScheme.secondary;

          // Nome para exibir do tema atual:
          String themeName;
          switch (_currentThemeIndex) {
            case 0:
              themeName = "Claro";
              break;
            case 1:
              themeName = "Escuro";
              break;
            case 2:
              themeName = "Quente (vermelho)";
              break;
            case 3:
              themeName = "Frio (azul)";
              break;
            default:
              themeName = "Desconhecido";
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Demonstração: Theme Widget'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Widget Theme: gerenciamento de temas globais no app.',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tema atual: $themeName\n'
                        'Clique no botão flutuante para alternar os temas.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colorScheme.primary, width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Propriedades do Theme em uso:',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Brightness: ${brightness == Brightness.dark ? "Escuro" : "Claro"}'),
                        Text('Primary Color: ${_colorToHex(primaryColor)}'),
                        Text('Secondary Color: ${_colorToHex(secondaryColor)}'),
                        Text('Font Family: ${themeData.textTheme.bodyLarge?.fontFamily ?? "Padrão"}'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Card(
                    elevation: 6,
                    color: colorScheme.primary.withOpacity(0.2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Título do Card', style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: 8),
                          Text(
                            'Este card usa cores e estilos definidos pelo tema atual. '
                                'Veja como o texto, fundo e bordas se adaptam.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),

            floatingActionButton: FloatingActionButton.extended(
              onPressed: _toggleTheme,
              icon: const Icon(Icons.color_lens),
              label: const Text('Trocar Tema'),
              tooltip: 'Clique para alternar o tema',
            ),
          );
        },
      ),
    );
  }

  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
