import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/data/mock_repository.dart';
import 'package:portfolioapp/screens/widgets/about.dart';
import 'package:portfolioapp/screens/widgets/contact.dart';
import 'package:portfolioapp/screens/widgets/experience.dart';
import 'package:portfolioapp/screens/widgets/footer.dart';
import 'package:portfolioapp/screens/widgets/home.dart';
import 'package:portfolioapp/screens/widgets/projects.dart';
import 'package:portfolioapp/screens/widgets/sidebar.dart';
import 'package:portfolioapp/screens/widgets/skill.dart';
import 'package:portfolioapp/screens/widgets/utils/section_wrapper.dart';


class PortfolioPage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  const PortfolioPage({super.key,required this.isDark,required this.onToggleTheme});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scroll = ScrollController();
  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _expKey = GlobalKey();
  final _contactKey = GlobalKey();

  int _activeIndex = 0;
  final _sections = const ['Home', 'About', 'Skills', 'Projects', 'Experience', 'Contact'];

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    final map = {
      0: _homeKey,
      1: _aboutKey,
      2: _skillsKey,
      3: _projectsKey,
      4: _expKey,
      5: _contactKey,
    };
    int current = _activeIndex;

    // Check if we're at the bottom of the scroll
    final maxScroll = _scroll.position.maxScrollExtent;
    final currentScroll = _scroll.position.pixels;
    final isAtBottom = currentScroll >= maxScroll - 100;

    if (isAtBottom) {
      current = 5; // Contact section
    } else {
      for (final e in map.entries) {
        final ctx = e.value.currentContext;
        if (ctx != null) {
          final box = ctx.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset.zero);
          if (pos.dy <= 140 && pos.dy + box.size.height > 140) {
            current = e.key;
            break;
          }
        }
      }
    }

    if (current != _activeIndex) setState(() => _activeIndex = current);
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 1024;
    return Scaffold(
      body: Row(
        children: [
          if (isWide)
            SizedBox(
              width: 300,
              child: Sidebar(
                isDark: widget.isDark,
                onToggleTheme: widget.onToggleTheme,
                activeIndex: _activeIndex,
                sections: _sections,
                socials:MockPortfolioRepository.socials,
                onTap: (i) {
                  switch (i) {
                    case 0:
                      _scrollTo(_homeKey);
                      break;
                    case 1:
                      _scrollTo(_aboutKey);
                      break;
                    case 2:
                      _scrollTo(_skillsKey);
                      break;
                    case 3:
                      _scrollTo(_projectsKey);
                      break;
                    case 4:
                      _scrollTo(_expKey);
                      break;
                    case 5:
                      _scrollTo(_contactKey);
                      break;
                  }
                },
              ),
            ),
          Expanded(
            child: CustomScrollView(
              controller: _scroll,
              slivers: [
                if (!isWide)
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    title: const Text('Yamuna G'),
                    actions: [
                      IconButton(
                        tooltip: 'Toggle theme',
                        onPressed: widget.onToggleTheme,
                        icon: Icon(widget.isDark
                            ? Icons.light_mode
                            : Icons.dark_mode),
                      ),
                    ],
                  ),
                SliverToBoxAdapter(
                    child:
                    SectionWrapper(key: _homeKey, child: const HomeSection())),
                SliverToBoxAdapter(
                    child:
                    SectionWrapper(key: _aboutKey, child: const AboutSection())),
                SliverToBoxAdapter(
                    child: SectionWrapper(
                        key: _skillsKey, child: const SkillsSection())),
                SliverToBoxAdapter(
                    child: SectionWrapper(
                        key: _projectsKey,
                        child: const ProjectsSection()
                    )
                ),
                SliverToBoxAdapter(
                    child: SectionWrapper(
                        key: _expKey,
                        child: ExperienceSection(items: MockPortfolioRepository.experience))),
                SliverToBoxAdapter(
                    child: SectionWrapper(
                        key: _contactKey, child: const ContactSection())),
                const SliverToBoxAdapter(child: Footer()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}