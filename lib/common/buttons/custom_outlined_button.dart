import 'package:flutter/material.dart';
import 'package:tripadvisor/constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.color,
    this.normalHeight,
  });
  final Widget? icon;
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final bool? normalHeight;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2, color: color ?? Colors.black),
        padding: const EdgeInsets.all(kDefaultPadding),
        minimumSize: normalHeight == false ? const Size.fromHeight(70) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon != null
              ? SizedBox(height: 20, width: 20, child: icon)
              : const SizedBox(),
          Spacer(flex: icon != null ? 2 : 3),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold, color: color ?? Colors.black),
          ),
          const Spacer(flex: 3)
        ],
      ),
    );
  }
}
