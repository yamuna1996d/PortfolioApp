import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/widgets/utils/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'About Me', subtitle: 'Short intro'),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              const SizedBox(
                width: 780,
                child: Text(
                  "I'm a Flutter developer with 5+ years of experience crafting performant mobile apps. I love clean architecture, offline-first design, and delightful UI micro-interactions. Adept at creating responsive, scalable, and high-performance apps for both Android and iOS platforms. Experienced in integrating native iOS (Swift) andAndroid (Java) code using Flutter’s method channel for seamless platform-specific functionality. "
                      'Known for collaborating effectively with cross-functional teams to deliver robust and maintainable solutions. '
                      'Passionate about staying up-to-date with the latest Flutter and mobile development trends to ensure code quality and '
                      'user satisfaction. Committed to writing clean, efficient code and contributing to the overall success of the team.'
                  ,
                  style: TextStyle(height: 1.6),
                ),
              ),
              const _InfoTile(icon: Icons.place, title: 'Location', value: 'India'),
              const _InfoTile(icon: Icons.work_history, title: 'Experience', value: '5+ years'),
              const _InfoTile(icon: Icons.mail_outline, title: 'Email', value: 'yamunag19@gmail.com'),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const _InfoTile({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withOpacity(.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: cs.primary),
          const SizedBox(width: 10),
          Text('$title: ', style: TextStyle(color: cs.onSurfaceVariant)),
          Text(value, style: TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
