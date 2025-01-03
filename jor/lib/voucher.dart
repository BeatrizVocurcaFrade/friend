import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  int _clickCount = 0; // Contador de cliques
  final TransformationController _transformationController =
      TransformationController();
  int num = 5;
  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  // Função para tratar o clique e mostrar a surpresa
  void _handleClick() {
    setState(() {
      _clickCount++;
      if (_clickCount == num) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Presente surpresa!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Visibility(
        visible: _clickCount < num,
        replacement: Stack(
          children: [
            GestureDetector(
              onDoubleTap: _resetZoom,
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.zero, // Limita a movimentação
                minScale: 1.0,
                maxScale: 5.0,
                clipBehavior: Clip.hardEdge,
                transformationController: _transformationController,
                child: Image.asset(
                  'assets/luigi.jpeg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Texto sobreposto no topo
            Positioned(
              top: 40.0,
              left: 16.0,
              right: 16.0,
              child: Text(
                'Fiz na impressora 3D...',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            // Texto sobreposto na parte inferior
            Positioned(
              bottom: 40.0,
              left: 16.0,
              right: 16.0,
              child: Text(
                'O sonho do Luigi sempre foi ter você de presente! 🎉',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                'Um pequeno mimo, feito de coração!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[850],
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 15),
              Visibility(
                visible: _clickCount < num,
                child: GestureDetector(
                  onTap: _handleClick, // Conta os cliques
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 300, // Tamanho grande para o GIF
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 15,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/svg/presente.gif', // Caminho do seu GIF
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w400, // Apenas o contador em negrito
                  ),
                  children: [
                    TextSpan(
                      text: 'Clique ',
                    ),
                    TextSpan(
                      text: '${num - _clickCount} vezes',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold, // Apenas o contador em negrito
                      ),
                    ),
                    TextSpan(
                      text: ' no presente para a surpresa! 😄',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.w400, // Apenas o contador em negrito
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
