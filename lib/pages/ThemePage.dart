import 'package:flutter/material.dart';

class ThemeDemoPage extends StatefulWidget {
  const ThemeDemoPage({super.key});

  @override
  State<ThemeDemoPage> createState() => _ThemeDemoPageState();
}

class _ThemeDemoPageState extends State<ThemeDemoPage> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    final themeData = _isDarkTheme ? ThemeData.dark() : ThemeData.light();

    return Theme(
      data: themeData,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Demonstração: Theme Widget'),
            actions: [
              IconButton(
                icon: Icon(_isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round),
                tooltip: _isDarkTheme ? 'Ativar tema claro' : 'Ativar tema escuro',
                onPressed: () {
                  setState(() => _isDarkTheme = !_isDarkTheme);
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Widget Theme: gerenciamento de temas globais no app.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Clique no ícone no topo para alternar entre tema claro e escuro.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),

                Card(
                  elevation: 4,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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

                Text(
                  'Boas práticas:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '• Mantenha consistência visual em todo o app.\n'
                      '• Utilize cores acessíveis e contraste suficiente.\n'
                      '• Forneça suporte a temas claro e escuro.\n'
                      '• Use ThemeData para personalizar fontes, cores e estilos.\n'
                      '• Evite sobrescrever estilos manualmente para garantir coerência.\n',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
