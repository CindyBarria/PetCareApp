import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/pawsTop.png'),
          ),
          const SizedBox(height: 100),
          Center(
            child: Image.asset('assets/images/logoPrincipal.png'),
          ),
          TextButton(
            onPressed: () {
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
          Expanded(child: Container()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/pawsButton.png'),
          ),
        ],
      ),
    );
  }
}
