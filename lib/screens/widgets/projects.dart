import 'package:flutter/material.dart';
import 'package:portfolioapp/screens/widgets/utils/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Featured Projects', subtitle: 'Some of my recent work'),
            const SizedBox(height: 48),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 768;
                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    ProjectCard(
                      buttonLink: 'https://play.google.com/store/apps/details?id=com.scblitewallet.com.scb_lite_wallet&hl=en_IN',
                      image: 'assets/scbs.png',
                      title: 'Banking App',
                      description:
                     'Developed a banking app module featuring double encryption and integrated the UI for the account screen.',
                      tags: const ['Flutter', "Encryption", 'Razorpay'],
                      width: isWide ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth,
                    ),
                    ProjectCard(
                      buttonLink: "https://www.bookitindia.com/",
                      image: 'assets/banner_mob.png',
                      title: 'Book it E-commerce Mobile App',
                      description:
                      'Developed three complete e-commerce applications (vendor, customer, and delivery) for the Bookit platform, featuring payment integration, real-time inventory management, location mapping, FCM notifications, and a seamless user experience.',
                      tags: const ['Firebase FCM Notification', 'Firebase Authentication', 'Razorpay Integration', 'Geolocation tracking and mapping','Hive'],
                      width: isWide ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth,
                    ),
                    ProjectCard(
                      buttonLink: '',
                      image: 'assets/heeds.png',
                      title: 'Healthcare Management System',
                      description:
                      'Developed a healthcare app with appointment scheduling, patient records, and telemedicine features.',
                      tags: const ['Flutter', 'Riverpod', 'REST API','Location Service', 'Fetching Contacts using Method channel', 'SQFLite DB for Local DB'],
                      width: isWide ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth,
                    ),
                    ProjectCard(
                      image: 'assets/pranas.png',
                      buttonLink: 'https://pranainsight.in/',
                      title: 'Prana-Insight App',
                      description:
                      "Prana Insight as times and lifestyles are changing, we need to give special attention to the education of our children. Their future should be empowered with the help of parents, teachers and society as a whole."
                          "Digitalization is bringing a positive difference in the educational sector, globally. The classic tuition system is now being taken over by effective learning applications. This gives a personalized, visually rich learning experience to the students.",
                      tags: const ['Flutter', 'Video Streaming','Api Integration', 'UI Integration', 'Provider'],
                      width: isWide ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth,
                    ),
                    ProjectCard(
                      image: 'assets/notesandkeys.png',
                      buttonLink: 'https://play.google.com/store/apps/details?id=com.calpine.notesandkeys',
                      title: 'Offline Data Storing',
                      description:
                      'Notes and Keys(Notes & Keys) is a secure and reliable password manager designed to safely store and manage your account details. Save usernames, passwords, categories, notes, and image references—all encrypted and stored only on your device. Your images remain safely in your phone’s pictures area, with only references stored locally for added privacy. With advanced encryption, multi-factor authentication, and biometric security (facial recognition and fingerprint lock on supported devices), your credentials stay protected from unauthorized access.',
                      tags: const ['Flutter', 'SQLite', 'Clean Architecture'],
                      width: isWide ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth,
                    ),
                    ProjectCard(
                      buttonLink: 'https://pineglance.com/',
                      image: 'assets/pine.png',
                      title: 'Live Photo Transferring App',
                      description:
                      'Developed custom native plugins for iOS (Swift) and Android (Kotlin) enabling seamless image transfer from the device camera app to the Flutter app, along with real-time, simultaneous image upload to the server.',
                      tags: const ['Flutter', 'Method channel - Swift, Kotlin' 'Clean Architecture'],
                      width: isWide ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final List<String> tags;
  final String buttonLink;
  final double width;

  const ProjectCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.tags,
    required this.buttonLink,
    required this.width,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;

  // Pastel background colors
  final List<Color> _bgColors = const [
    Color(0xFFFFF1F2), // pink
    Color(0xFFF0F9FF), // blue
    Color(0xFFEFF6FF), // indigo
    Color(0xFFFDF2FA), // rose
    Color(0xFFFFFBEB), // yellow
    Color(0xFFEFFCF1), // green
  ];

  late final Color bgColor;

  @override
  void initState() {
    super.initState();

    // Pick a stable random color per card
    bgColor = _bgColors[
    (DateTime.now().millisecondsSinceEpoch + widget.title.length) %
        _bgColors.length
    ];
  }

  Future<void> _launch() async {
    final uri = Uri.parse(widget.buttonLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: widget.width,
        margin: const EdgeInsets.only(bottom: 32),

        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(hover ? 0.08 : 0.03),
              blurRadius: hover ? 26 : 12,
              offset: const Offset(0, 8),
            )
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---------------- IMAGE WITH RANDOM BG ----------------
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                color: bgColor,
                child: AnimatedScale(
                  scale: hover ? 1.03 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    widget.image,
                    width: widget.width,
                    height: 260,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            /// ---------------- CONTENT SECTION ----------------
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: cs.onSurface,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// DESCRIPTION
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// TAGS
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: widget.tags.map((tag) {
                      return Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.pink[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  widget.buttonLink.isNotEmpty?SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      decoration: BoxDecoration(
                        color: hover ? cs.primary : Colors.pink.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          _launch();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "View Live App",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.open_in_new,
                                size: 18, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ):SizedBox.shrink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


