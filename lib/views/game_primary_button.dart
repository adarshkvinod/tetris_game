import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class GamePrimaryButton extends StatefulWidget {
  final String buttonText;
  final void Function()? onTap;

  const GamePrimaryButton({super.key, required this.buttonText, this.onTap});

  @override
  State<GamePrimaryButton> createState() => _GamePrimaryButtonState();
}

class _GamePrimaryButtonState extends State<GamePrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Transparent to show the gradient underneath
      borderRadius: BorderRadius.circular(24.dp), // Ensure ripple respects rounded corners
      child: InkWell(
        onTap: widget.onTap,
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(24.dp), // Ensures ripple follows the button's shape
        splashColor: Colors.white.withOpacity(0.3), // Customize the splash color
        highlightColor: Colors.white.withOpacity(0.1), // Customize the highlight color when pressed
        child: Container(
          height: 65.dp,
          width: 308.dp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.dp),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFBE40),
                Color(0xFFFFDF40),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
