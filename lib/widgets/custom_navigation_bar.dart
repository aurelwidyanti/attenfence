import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onScreenChanged;

  const CustomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onScreenChanged,
  }) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  void _onItemTapped(int index) {
    widget.onScreenChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        height: 72, // Set your desired height here
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: widget.currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color.fromRGBO(255, 215, 0, 1),
          unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
                size: 30,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
