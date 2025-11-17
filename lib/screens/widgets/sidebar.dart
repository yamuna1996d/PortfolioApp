import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/widgets/utils/socila_icons.dart';

import '../../models/social_link.dart';

class Sidebar extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  final int activeIndex;
  final List<String> sections;
  final List<SocialLink> socials;
  final ValueChanged<int> onTap;

  const Sidebar({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.activeIndex,
    required this.sections,
    required this.socials,
    required this.onTap,
  });

  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border(right: BorderSide(color: cs.outlineVariant.withOpacity(.5))),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            _AvatarCard(isDark: isDark),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Flutter Developer', style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Toggle theme',
                    onPressed: onToggleTheme,
                    icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemBuilder: (c, i) => _SidebarItem(
                  label: sections[i],
                  isActive: i == activeIndex,
                  onTap: () => onTap(i),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemCount: sections.length,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final s in socials)
                    SocialIconButton(
                      icon: s.icon,
                      tooltip: s.label,
                      url: s.url,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarCard extends StatelessWidget {
  final bool isDark;
  const _AvatarCard({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: cs.outlineVariant.withOpacity(.4)),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [cs.primary, cs.secondary]),
              ),
              child: const Center(
                child: Text('YG', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Yamuna G', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text('Software Engineer', style: TextStyle(color: cs.onSurfaceVariant)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SidebarItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  const _SidebarItem({required this.label, required this.isActive, required this.onTap});

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final active = widget.isActive;

    return InkWell(
      onTap: widget.onTap,
      onHover: (v) => setState(() => _hover = v),
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: active ? cs.primary.withOpacity(.10) : (_hover ? cs.surfaceContainerHighest : cs.surface),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: active ? cs.primary : cs.outlineVariant.withOpacity(.5), width: active ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Icon(Icons.chevron_right, size: 18, color: active ? cs.primary : cs.onSurfaceVariant),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: TextStyle(
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                color: active ? cs.primary : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
