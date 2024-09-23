import 'package:flutter/material.dart';

class CoinTag extends StatelessWidget {
  final String tag;

  const CoinTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(100.0), // Rounded corners
      ),
      padding: const EdgeInsets.all(10.0), // Padding around the text
      child: Center(
        child: Text(
          tag,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}