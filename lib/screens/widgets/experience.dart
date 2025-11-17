import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/widgets/utils/section_title.dart';

import '../../models/experience_item.dart';


class ExperienceSection extends StatelessWidget {
  final List<ExperienceItem> items;
  const ExperienceSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Professional Journey', subtitle: 'Timeline & achievements'),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: _Timeline(items: items),
        ),
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  final List<ExperienceItem> items;
  const _Timeline({required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final isWide = c.maxWidth > 900;
      return Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _TimelineRow(item: items[i], isLeft: isWide ? i.isEven : true, isWide: isWide),
            const SizedBox(height: 28),
          ]
        ],
      );
    });
  }
}

class _TimelineRow extends StatelessWidget {
  final ExperienceItem item;
  final bool isLeft;
  final bool isWide;
  const _TimelineRow({required this.item, required this.isLeft, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final dot = Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(.3), blurRadius: 12)
        ],
      ),
    );

    final line = Container(
      width: 2,
      height: 180,
      color: Theme.of(context).colorScheme.outlineVariant.withOpacity(.6),
    );

    final card = _ExperienceCard(item: item);

    if (!isWide) {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [dot, const SizedBox(width: 12), Expanded(child: card)]);
    }

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isLeft) Expanded(child: card) else const Expanded(child: SizedBox()),
      const SizedBox(width: 16),
      Column(children: [dot, line]),
      const SizedBox(width: 16),
      if (!isLeft) Expanded(child: card) else const Expanded(child: SizedBox()),
    ]);
  }
}

class _ExperienceCard extends StatelessWidget {
  final ExperienceItem item;
  const _ExperienceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cs.outlineVariant.withOpacity(.35)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(item.company, style: TextStyle(color: cs.primary, fontWeight: FontWeight.w900, fontSize: 18))),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: cs.primary.withOpacity(.12), borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.business, size: 18),
          ),
        ]),
        const SizedBox(height: 8),
        Text(item.role, style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(item.period, style: TextStyle(color: cs.onSurfaceVariant)),
        const SizedBox(height: 12),
        for (final p in item.points)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(width: 4),
              Container(width: 6, height: 6, margin: const EdgeInsets.only(top: 8, right: 12), decoration: BoxDecoration(color: cs.primary, shape: BoxShape.circle)),
              Expanded(child: Text(p, style: const TextStyle(height: 1.5))),
            ]),
          ),
      ]),
    );
  }
}
