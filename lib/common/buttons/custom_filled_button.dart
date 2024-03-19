import 'package:flutter/material.dart';
import 'package:tripadvisor/constants.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(kDefaultPadding),
            minimumSize: const Size.fromHeight(60)),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.onSurface),
            const Spacer(flex: 2),
            Text(
              text,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const Spacer(flex: 3)
          ],
        ),
      ),
    );
  }
}
