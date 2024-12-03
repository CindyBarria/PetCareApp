import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos verticalmente
        children: [
          // Imagen pawsTop en la parte superior
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/pawsTop.png'),
          ),
  const SizedBox(height: 100),
          // Imagen logoPrincipal centrada en la pantalla
          Center(
            child: Image.asset('assets/images/logoPrincipal.png'),
          ),
// Botón de ingreso
          TextButton(
            onPressed: () {
              // Navegar a la pantalla principal
              Navigator.pushReplacementNamed(context, '/principal');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero, 
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Ingresar',
              style: TextStyle(
                color: Color(0xFF3C9093),
                fontSize: 16,
              ),
            ),
          ),
          // Espacio flexible para separar la imagen pawsButton de los elementos anteriores
          Expanded(child: Container()),
   
          // Imagen pawsButton en la parte inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/pawsButton.png'),
          ),

       
        ],
      ),
    );
  }
}
