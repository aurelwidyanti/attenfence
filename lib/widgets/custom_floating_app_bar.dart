import 'package:flutter/material.dart';

class CustomFloatingAppBar extends StatelessWidget {
  final Function(String) onButtonTapped;
  final String currentScreen;

  CustomFloatingAppBar({
    required this.onButtonTapped,
    required this.currentScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 4,
            ),
            width: 317,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: currentScreen == 'Geo Presence'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(60, 75, 206, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onButtonTapped('Geo Presence');
                      },
                      child: Container(
                        width: 150,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Geo Presence',
                          style: TextStyle(
                            color: currentScreen == 'Geo Presence'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onButtonTapped('E-Presence');
                      },
                      child: Container(
                        width: 150,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'E-Presence',
                          style: TextStyle(
                            color: currentScreen == 'E-Presence'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
