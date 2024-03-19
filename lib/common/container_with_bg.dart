import 'package:flutter/material.dart';
import 'package:tripadvisor/constants.dart';

class ContainerWithBgImage extends StatelessWidget {
  const ContainerWithBgImage({
    super.key,
    required this.path,
    required this.text1,
    required this.text2,
    required this.onPressed,
    required this.buttonText,
  });
  final String path;
  final String text1, text2;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      height: 500,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image: AssetImage(path))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              minimumSize: const Size(100, 50),
            ),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
