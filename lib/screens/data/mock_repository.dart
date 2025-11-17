import 'package:flutter/material.dart';

import '../../core/porfolio_repository.dart';
import '../../models/experience_item.dart';
import '../../models/portfolio_data.dart';
import '../../models/social_link.dart';


class MockPortfolioRepository implements PortfolioRepository {
  static const socials = <SocialLink>[
    SocialLink(icon: Icons.code, label: 'GitHub', url: 'https://github.com/yamuna1996d'),
    SocialLink(icon: Icons.business_center, label: 'LinkedIn', url: 'https://www.linkedin.com/in/yamuna-g-978088180/'),
    SocialLink(icon: Icons.email_outlined, label: 'Mail', url: 'mailto:yamunag19@gmail.com'),
    SocialLink(icon: Icons.phone, label: 'Call', url: 'tel:+918129756354'),
  ];

  static const experience = <ExperienceItem>[
    ExperienceItem(
      company: 'UVJ Technologies Pvt Ltd.',
      role: 'Software Engineer',
      period: 'July 2023 - Present',
      points: [
        'Developed and maintained high-performance Flutter apps.',
        'Implemented WebSockets for real-time messaging.',
        'Created custom plugin for background geofencing.',
        'Improved state management and sync integrity.',
      ],
    ),
    ExperienceItem(
      company: 'Techins Software Solutions',
      role: 'Software Developer',
      period: 'July 2022 - April 2023',
      points: [
        'Built Bookit E-commerce suite with seamless UX.',
        'Integrated Android (Java) & iOS (Swift) via method channels.',
        'Collaborated with backend for secure data exchange.',
        'Delivered scalable solutions across teams.',
      ],
    ),
    ExperienceItem(
      company: 'Folea Film Factory Pvt Ltd',
      role: 'Software Developer',
      period: 'April 2021 - June 2022',
      points: [
        'Developed SPC PRANA e-learning commerce app.',
        'Integrated Razorpay for online payments.',
        'Built office management system using Flutter & Firebase.',
        'Maintained clean code with version control workflow.',
      ],
    ),
  ];

  @override
  Future<PortfolioData> fetchPortfolio() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const PortfolioData(socials: socials, experience: experience);
  }
}
