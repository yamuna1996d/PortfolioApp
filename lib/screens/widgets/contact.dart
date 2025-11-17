import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/widgets/utils/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: "Let's Connect",
          subtitle: 'Open to new opportunities & collabs',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth > 900;
              return Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(fit: FlexFit.loose, child: _ContactCard()),
                  SizedBox(width: isWide ? 28 : 0, height: isWide ? 0 : 28),
                  Flexible(fit: FlexFit.loose, child: _OnlineCard()),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cs.outlineVariant.withOpacity(.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _ContactItem(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'yamunag19@gmail.com',
            url: 'mailto:yamunag19@gmail.com',
          ),
          SizedBox(height: 14),
          _ContactItem(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: '+91 8129756354',
            url: 'tel:+918129756354',
          ),
        ],
      ),
    );
  }
}

class _OnlineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cs.outlineVariant.withOpacity(.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _FindMe(
            icon: Icons.business_center,
            label: 'LinkedIn Profile',
            url: 'https://www.linkedin.com/in/yamuna-g-978088180/',
          ),
          SizedBox(height: 14),
          _FindMe(
            icon: Icons.code,
            label: 'GitHub Profile',
            url: "https://github.com/yamuna1996d",
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String url;
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    bool _hover = false;

    Future<void> _launch() async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
    return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cs.primary.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
      const SizedBox(width: 12),
      Expanded( // ✅ makes space for right alignment
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(color: cs.onSurfaceVariant, fontSize: 12),
                  ),
                  Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: _launch,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _hover
                      ? cs.primary.withOpacity(.12)
                      : cs.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: cs.outlineVariant.withOpacity(.35),
                  ),
                ),
                child: Icon(
                  Icons.open_in_new,
                  size: 18,
                  color: cs.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
    );

  }
}

class _FindMe extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  const _FindMe({required this.icon, required this.label, required this.url});

  @override
  State<_FindMe> createState() => _FindMeState();
}

class _FindMeState extends State<_FindMe> {
  bool _hover = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cs.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(widget.icon),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),

        InkWell(
          onTap: () {
            _launch();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _hover
                  ? cs.primary.withOpacity(.12)
                  : cs.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cs.outlineVariant.withOpacity(.35)),
            ),
            child: Icon(Icons.open_in_new, size: 18,color: cs.onSurfaceVariant,),
          ),
        ),
        // child: Icon(Icons.open_in_new, size: 18, color: cs.onSurfaceVariant)),
      ],
    );
  }
}
