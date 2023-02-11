import 'package:flutter/material.dart';

class CreateCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final VoidCallback onPress;

  const CreateCard({
    required this.color,
    required this.child,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: child,
      ),
    );
  }
}
