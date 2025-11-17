import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/widgets/utils/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final cards = const [
      _Skill(icon: Icons.phone_android, title: 'Flutter Development', desc: 'Cross‑platform apps for Android & iOS using Dart.'),
      _Skill(icon: Icons.layers, title: 'State Management', desc: 'Riverpod, Provider, clean modular architecture.'),
      _Skill(icon: Icons.code, title: 'Native Integrations', desc: 'Method channels with Swift, Kotlin/Java.'),
      _Skill(icon: Icons.storage, title: 'Data & APIs', desc: 'SQFLite DB, Hive, SharedPreference, Firebase, REST.'),
      _Skill(icon: Icons.source, title: 'Version Control', desc: 'Git, GitHub/GitLab.'),
      _Skill(icon: Icons.speed, title: 'Performance', desc: 'WebSockets, background tasks.'),
      _Skill(icon: Icons.people, title: 'Soft Skills', desc: 'Problem-solving, teamwork, adaptability, communication, time management.'),
      _Skill(icon: Icons.build, title: 'Tools & IDEs', desc: 'Android Studio, Xcode, VS Code, Postman, Figma.'),

    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Skills & Expertise', subtitle: 'What I do best'),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: LayoutBuilder(
            builder: (context, c) {
              final w = c.maxWidth;
              int cross = 1;
              if (w > 1100) cross = 3;
              else if (w > 700) cross = 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cross,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemCount: cards.length,
                itemBuilder: (c, i) => _SkillCard(skill: cards[i]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Skill {
  final IconData icon;
  final String title;
  final String desc;
  const _Skill({required this.icon, required this.title, required this.desc});
}

class _SkillCard extends StatefulWidget {
  final _Skill skill;
  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hover ? cs.primary : cs.outlineVariant.withOpacity(.35),
            width: _hover ? 1.5 : 1,
          ),
          boxShadow: _hover
              ? [BoxShadow(color: cs.primary.withOpacity(.08), blurRadius: 24, offset: const Offset(0, 8))]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.skill.icon),
            ),
            const SizedBox(height: 12),
            Text(widget.skill.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 6),
            Text(widget.skill.desc, style: TextStyle(color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
