import 'package:flutter/material.dart';

class ImageWidgetPage extends StatefulWidget {
  const ImageWidgetPage({super.key});

  @override
  State<ImageWidgetPage> createState() => _ImageWidgetPageState();
}

class _ImageWidgetPageState extends State<ImageWidgetPage> {
  // Controladores das propriedades
  String _selectedImageSource = 'Local';
  BoxFit _selectedFit = BoxFit.cover;
  double _width = 300;
  double _height = 200;

  // Imagens locais e da web para demo
  final Map<String, String> _localImages = {
    'Paisagem': 'assets/images/paisagem.jpg',
    'Cidade': 'assets/images/cidade.jpg',
  };

  final Map<String, String> _networkImages = {
    'Montanha': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'Praia': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
  };

  String _selectedLocalImageKey = 'Paisagem';
  String _selectedNetworkImageKey = 'Montanha';

  @override
  Widget build(BuildContext context) {
    String imageUrl;

    if (_selectedImageSource == 'Local') {
      imageUrl = _localImages[_selectedLocalImageKey]!;
    } else {
      imageUrl = _networkImages[_selectedNetworkImageKey]!;
    }

    // Widget imagem (local ou network)
    Widget imageWidget = _selectedImageSource == 'Local'
        ? Image.asset(
      imageUrl,
      fit: _selectedFit,
      width: _width,
      height: _height,
    )
        : Image.network(
      imageUrl,
      fit: _selectedFit,
      width: _width,
      height: _height,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Image Widget')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Controle as propriedades da imagem:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Fonte da imagem
            DropdownButton<String>(
              value: _selectedImageSource,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedImageSource = value;
                  });
                }
              },
              items: ['Local', 'Web'].map((e) {
                return DropdownMenuItem(value: e, child: Text('Fonte: $e'));
              }).toList(),
              isExpanded: true,
            ),

            const SizedBox(height: 12),

            // Seleção da imagem local ou web
            if (_selectedImageSource == 'Local')
              DropdownButton<String>(
                value: _selectedLocalImageKey,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedLocalImageKey = value;
                    });
                  }
                },
                items: _localImages.keys.map((key) {
                  return DropdownMenuItem(value: key, child: Text(key));
                }).toList(),
                isExpanded: true,
              )
            else
              DropdownButton<String>(
                value: _selectedNetworkImageKey,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedNetworkImageKey = value;
                    });
                  }
                },
                items: _networkImages.keys.map((key) {
                  return DropdownMenuItem(value: key, child: Text(key));
                }).toList(),
                isExpanded: true,
              ),

            const SizedBox(height: 12),

            // Fit
            DropdownButton<BoxFit>(
              value: _selectedFit,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedFit = value;
                  });
                }
              },
              items: BoxFit.values.map((fit) {
                return DropdownMenuItem(value: fit, child: Text('fit: ${fit.name}'));
              }).toList(),
              isExpanded: true,
            ),

            const SizedBox(height: 12),

            // Width slider
            Text('Largura: ${_width.toStringAsFixed(0)} px'),
            Slider(
              min: 50,
              max: 400,
              divisions: 35,
              value: _width,
              onChanged: (value) {
                setState(() {
                  _width = value;
                });
              },
            ),

            const SizedBox(height: 12),

            // Height slider
            Text('Altura: ${_height.toStringAsFixed(0)} px'),
            Slider(
              min: 50,
              max: 400,
              divisions: 35,
              value: _height,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Container destacado para imagem
            Center(
              child: Container(
                width: _width + 20,
                height: _height + 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 3),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade100,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: imageWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
