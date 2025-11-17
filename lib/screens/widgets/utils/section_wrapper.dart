import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  const SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: cs.outlineVariant.withOpacity(.4)),
          boxShadow: [
            BoxShadow(
              color: cs.shadow.withOpacity(.02),
              blurRadius: 32,
              offset: const Offset(0, 12),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
