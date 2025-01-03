import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  int _clickCount = 0; // Contador de cliques

  // Função para tratar o clique e mostrar a surpresa
  void _handleClick() {
    setState(() {
      _clickCount++;
      if (_clickCount == 3) {}
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
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Um pequeno mimo, feito de coração!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 15),
            Visibility(
              visible: _clickCount < 3,
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
                        color: Colors.black.withOpacity(0.15),
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
            const SizedBox(height: 20),
            if (_clickCount < 3)
              Text(
                'Clique 3 vezes no presente para a surpresa! 😄',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            else
              Column(
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/luigi.jpeg', // Caminho para a imagem de Luigi
                      height: 320,
                      width: 195,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Fiz na impressora 3D...',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'O sonho do Luigi sempre foi ter vcê de presente! 🎉',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
