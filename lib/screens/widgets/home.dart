import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/widgets/utils/background.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});
  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;

  final _words = [
    'Flutter Developer',
    'Software Engineer',
    'Plugin Builder',
  ];
  int _index = 0;
  bool _stop = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
    _startAnimation();
  }
  void _startAnimation() {
    Future.microtask(_animateCycle);
  }

  void _animateCycle() async {
    while (mounted && !_stop) {
      await _ctrl.forward();
      if (!mounted || _stop) return;

      await Future.delayed(const Duration(milliseconds: 900));
      if (!mounted || _stop) return;

      await _ctrl.reverse();
      if (!mounted || _stop) return;

      setState(() {
        _index = (_index + 1) % _words.length;
      });
    }
  }
  @override
  void dispose() {
    _stop = true;
    _ctrl.stop();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          const Positioned.fill(child: SoftOrbsBackground()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(children: [Chip(label: Text('SOFTWARE ENGINEER', style: TextStyle(letterSpacing: 1.2)))]),
                const SizedBox(height: 16),
                Text('Yamuna G', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 6),
                FadeTransition(
                  opacity: _opacity,
                  child: Text(_words[_index], style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: cs.primary, fontWeight: FontWeight.w800)),
                ),
                // ConstrainedBox(
                //   constraints: const BoxConstraints(maxWidth: 820),
                //   child: Text(
                //     'Building high-performance cross-platform mobile apps. Specialized in Flutter, native integrations, WebSockets, and delightful UX.',
                //     style: TextStyle(color: cs.onSurfaceVariant),
                //   ),
                // ),
                // const SizedBox(height: 22),
                // Wrap(
                //   spacing: 12,
                //   runSpacing: 12,
                //   children: [
                //     FilledButton.icon(
                //       onPressed: () {},
                //       icon: const Icon(Icons.mail_outline),
                //       label: const Text('Get In Touch'),
                //     ),
                //     OutlinedButton(
                //       onPressed: () {},
                //       child: const Text('View Experience'),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
