import 'package:flutter/material.dart';
class CustomButtons extends StatelessWidget {
  final void Function()? onButtonTap;
  final String label;
  final IconData? buttonIcon;
  const CustomButtons({super.key, this.onButtonTap, required this.label, this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap,
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: buttonIcon == null //if button icon is empty then center the text
            ?Center(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        )
        :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(buttonIcon, color: Colors.white, size: 25),
            Text(label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
