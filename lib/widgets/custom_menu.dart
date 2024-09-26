import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  final List<MenuItem> menuItems;

  const CustomMenu({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromRGBO(191, 191, 191, 1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          for (int i = 0; i < menuItems.length; i += 3)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuItem(menuItems[i]),
                  if (i + 1 < menuItems.length)
                    _buildMenuItem(menuItems[i + 1]),
                  if (i + 2 < menuItems.length)
                    _buildMenuItem(menuItems[i + 2]),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: item.color, // Use the color from the MenuItem
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            item.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color; // Add a color property

  MenuItem(
      {required this.icon,
      required this.label,
      required this.onTap,
      required this.color});
}
