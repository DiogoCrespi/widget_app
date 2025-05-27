import 'package:flutter/material.dart';
import 'pages/TextWidgetPage.dart';
import 'pages/ColumnWidgetPage.dart';
import 'pages/TextFieldPage.dart';
import 'pages/ElevatedButtonPage.dart';
import 'pages/NavigatorPage.dart';
import 'pages/AnimatedContainerPage.dart';
import 'pages/ThemePage.dart';
import 'pages/SemanticsPage.dart';
import 'pages/ImagePage.dart';
import 'pages/CupertinoButtonPage.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {'title': 'Text (Básico)', 'widget': TextWidgetPage()},
    {'title': 'Column (Layout)', 'widget': ColumnWidgetPage()},
    {'title': 'TextField (Entrada)', 'widget': TextFieldWidgetPage()},
    {'title': 'ElevatedButton (Botões)', 'widget': ElevatedButtonPage()},
    {'title': 'Navigator (Navegação)', 'widget': NavigatorWidgetPage()},
    {'title': 'AnimatedContainer (Animação)', 'widget': AnimatedContainerPage()},
    {'title': 'Theme (Estilo)', 'widget': ThemeDemoPage()},
    {'title': 'Semantics (Acessibilidade)', 'widget': SemanticsDemoPage()},
    {'title': 'Image (Assets/Imagens)', 'widget': ImageWidgetPage()},
    {'title': 'CupertinoButton (iOS)', 'widget': CupertinoButtonPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explorador de Widgets')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Categorias de Widgets', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ...menuItems.map((item) {
              return ListTile(
                title: Text(item['title']),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => item['widget'],
                  ));
                },
              );
            }).toList(),
          ],
        ),
      ),
      body: const Center(
        child: Text('Selecione um widget no menu lateral para começar.'),
      ),
    );
  }
}