import 'package:flutter/material.dart';
import 'package:widget_app/DemoPage.dart';

void main() {
  runApp(const NavigatorWidgetPage());
}

class NavigatorWidgetPage extends StatelessWidget {
  const NavigatorWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Navigator',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const RecipeListPage(),
          );
        } else if (settings.name == '/details') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            settings: const RouteSettings(name: '/details'),
            builder: (_) => RecipeDetailPage(
              title: args['title'],
              description: args['description'],
            ),
          );
        } else if (settings.name == '/about') {
          return MaterialPageRoute(
            settings: const RouteSettings(name: '/about'),
            builder: (_) => const RecipeAboutPage(),
          );
        }
        return null;
      },
    );
  }
}

// Tela de lista de receitas
class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  final List<Map<String, String>> recipes = const [
    {
      'title': 'Bolo de Chocolate',
      'description': 'Receita deliciosa de bolo de chocolate fofinho.',
    },
    {
      'title': 'Salada Caesar',
      'description': 'Salada com alface, frango e molho Caesar.',
    },
    {
      'title': 'Macarrão ao Alho e Óleo',
      'description': 'Macarrão simples e rápido com alho e azeite.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Receitas')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(recipe['title']!),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: {
                    'title': recipe['title']!,
                    'description': recipe['description']!,
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.home),
        label: const Text('Início'),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DemoPage()),
            (route) => false,
          );
        },
      ),
    );
  }
}

// Tela de detalhes da receita
class RecipeDetailPage extends StatelessWidget {
  final String? title;
  final String? description;

  const RecipeDetailPage({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Detalhes'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ?? 'Sem título', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text(description ?? 'Sem descrição.', style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Voltar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.list),
                  label: const Text('Voltar p/ Início'),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Tela extra para demonstrar push e pop
class RecipeAboutPage extends StatelessWidget {
  const RecipeAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Este é um app demonstrativo de navegação em Flutter.',
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.receipt_long),
              label: const Text('Ir para Detalhes de Receita'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: {
                    'title': 'Receita Demonstração',
                    'description': 'Criada apenas para testar navegação.',
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
