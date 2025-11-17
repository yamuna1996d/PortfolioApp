import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final String url;
  const SocialIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.url,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
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

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Tooltip(
        message: widget.tooltip,
        child: InkWell(
          onTap: _launch,
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _hover ? cs.primary.withOpacity(.12) : cs.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cs.outlineVariant.withOpacity(.35)),
            ),
            child: Icon(widget.icon, size: 18),
          ),
        ),
      ),
    );
  }
}
