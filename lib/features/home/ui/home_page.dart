import 'package:flutter/material.dart';
import '../../../core/widgets/app_header.dart';
import '../data/astrologer_api.dart';
import '../models/astrologer.dart';
import '../widgets/promo_banner.dart';
import '../widgets/astrologer_section.dart';
import '../widgets/reviews_section.dart';
import '../widgets/why_choose_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/about_dialog.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late Future<List<Astrologer>> futureAstrologers;
//   late PageController reviewController;
//   int currentReviewPage = 0;
//
//   static const orangeColor = Color(0xFFC95524);
//
//   @override
//   void initState() {
//     super.initState();
//     futureAstrologers = AstrologerApi.fetchAstrologers();
//     reviewController = PageController();
//     _autoSlide();
//   }
//
//   void _autoSlide() {
//     Future.delayed(const Duration(seconds: 5), () {
//       if (!mounted) return;
//       currentReviewPage++;
//       reviewController.animateToPage(
//         currentReviewPage % 3,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOut,
//       );
//       _autoSlide();
//     });
//   }
//
//   @override
//   void dispose() {
//     reviewController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const AppHeader(title: 'UnlimitedAstro'),
//
//             const PromoBanner(),
//
//             AstrologerSection(futureAstrologers: futureAstrologers),
//
//             ReviewsSection(
//               pageController: reviewController,
//               currentIndex: currentReviewPage,
//               onPageChanged: (index) {
//                 setState(() {
//                   currentReviewPage = index;
//                 });
//               },
//             ),
//
//
//
//             WhyChooseSection(
//               onReadMore: () {
//                 showUnlimitedAstroAboutDialog(context);
//               },
//             ),
//
//             const FAQSection(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const AppFooter(currentIndex: 0),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Astrologer>> futureAstrologers;
  late PageController reviewController;
  int currentReviewPage = 0;

  @override
  void initState() {
    super.initState();
    futureAstrologers = AstrologerApi.fetchAstrologers();
    reviewController = PageController();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      currentReviewPage++;
      reviewController.animateToPage(
        currentReviewPage % 3,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      _autoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(title: 'UnlimitedAstro'),
            const PromoBanner(),
            AstrologerSection(futureAstrologers: futureAstrologers),
            ReviewsSection(
              pageController: reviewController,
              currentIndex: currentReviewPage,
              onPageChanged: (index) {
                setState(() {
                  currentReviewPage = index;
                });
              },
            ),
            WhyChooseSection(
              onReadMore: () {
                showUnlimitedAstroAboutDialog(context);
              },
            ),
            const FAQSection(),
          ],
        ),
      ),
    );
  }
}
