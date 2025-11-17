import 'experience_item.dart';
import 'social_link.dart';

class PortfolioData {
  final List<SocialLink> socials;
  final List<ExperienceItem> experience;

  const PortfolioData({
    required this.socials,
    required this.experience,
  });
}
