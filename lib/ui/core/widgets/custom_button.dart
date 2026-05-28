import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback submitProfile;

  const CustomButton({super.key, required this.submitProfile});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isButtonPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      isButtonPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      isButtonPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      isButtonPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.submitProfile,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(isButtonPressed ? 0.98 : 1.0),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isButtonPressed ? 0.18 : 0.25),
              blurRadius: isButtonPressed ? 10 : 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.arrow_forward, color: Colors.white),
            SizedBox(width: 12),
            Text(
              'Continue to Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
