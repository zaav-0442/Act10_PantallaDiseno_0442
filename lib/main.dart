import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PizzaDetailScreen(), debugShowCheckedModeBanner: false));

class PizzaDetailScreen extends StatelessWidget {
  const PizzaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    // Definimos el margen constante para la flecha
    const double arrowMargin = 30.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FILA 1: Cabecera con Stack (Flecha + Imagen)
          SizedBox(
            height: screenHeight * 0.45,
            width: screenWidth,
            child: Stack(
              children: [
                // La Imagen: Ocupa casi todo el ancho pero se desplaza a la derecha
                Positioned(
                  left: 90, // Espacio reducido entre la flecha y la imagen
                  right: -(screenWidth * 0.25), // Recorta aprox 1/4 (muestra 3/4)
                  top: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                    child: Image.network(
                      'https://raw.githubusercontent.com/zaav-0442/Act10_PantallaDise-o_0442/refs/heads/main/e9e1e82cb873-pepperoni-pizza-abob-t-removebg-preview.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Botón de flecha: Margen superior igual al izquierdo
                const Positioned(
                  top: arrowMargin,
                  left: arrowMargin,
                  child: SafeArea(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 28,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ESPACIADOR 1 (Igual al Espaciador 2)
          const Spacer(flex: 1),

          // BLOQUE DE TEXTO (Filas 2, 3 y 4)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FILA 2: Usuario
                Text(
                  "@chef_master_pizza",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                // FILA 3: Nombre
                const Text(
                  "Pizza Pepperoni Supreme",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 15),
                // FILA 4: Ingredientes
                Text(
                  "Masa artesanal, salsa de tomate pomodoro, queso mozzarella, pepperoni premium y albahaca fresca.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          // ESPACIADOR 2 (Igual al Espaciador 1)
          const Spacer(flex: 1),

          // FILA 5: Iconos en columnas (1/4 de la altura)
          Container(
            height: screenHeight * 0.20,
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: _buildCircularIcon(Icons.favorite_outline_rounded, Colors.red),
                ),
                Expanded(
                  child: _buildCircularIcon(Icons.thumb_down_alt_outlined, Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los íconos circulares
  Widget _buildCircularIcon(IconData icon, Color color) {
    return LayoutBuilder(builder: (context, constraints) {
      // Calculamos el tamaño para que sea casi todo el cuadrante
      double diameter = constraints.maxHeight * 0.85;
      return Center(
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              )
            ],
          ),
          child: Icon(
            icon,
            size: diameter * 0.45, // Icono grande
            color: Colors.white,   // Color igual al fondo de la pantalla
          ),
        ),
      );
    });
  }
}