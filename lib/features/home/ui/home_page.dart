import 'package:flutter/material.dart';
import '../../../core/widgets/app_header.dart';
import '../../../core/widgets/app_footer.dart';
import '../data/astrologer_api.dart';
import '../widgets/astrologer_card.dart';
import '../models/astrologer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Astrologer>> futureAstrologers;
  late PageController _reviewPageController;
  int _currentReviewPage = 0;

  static const orangeColor = Color(0xFFC95524);

  @override
  void initState() {
    super.initState();
    futureAstrologers = AstrologerApi.fetchAstrologers();
    _reviewPageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        _currentReviewPage++;
        _reviewPageController.animateToPage(
          _currentReviewPage % 3,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      }
    });
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Why Choose UnlimitedAstro?",
                      style: TextStyle(
                        color: const Color(0xFFC95524),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () => Navigator.of(context).pop(),
                    //   child: const Icon(Icons.close, size: 24),
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '   At UnlimitedAstro, we offer an unparalleled feature—unlimited talk time with our astrologers. We believe that meaningful guidance requires time, and you deserve the freedom to explore your concerns without worrying about limits. Whether it’s relationships, career, health, or personal growth, our astrologers are here to listen and provide thoughtful, personalized solutions.\n',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                        const Text(
                          '   Our mission goes beyond just offering convenience. Our goal is to challenge misconceptions surrounding astrology and provide a clearer understanding of its significance. Sadly, astrology’s reputation has been tarnished by those who lack proper knowledge and use it as a tool to exploit. At UnlimitedAstro, we are committed to changing this perception. Our astrologers are not here to scam or profit unethically; they are experienced, compassionate, and genuinely dedicated to helping you.\n',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                        const Text(
                            '   Astrology is an ancient knowledge that, when practiced authentically, can bring clarity and wisdom into your life. At UnlimitedAstro, we honor this tradition by building trust and ensuring that every interaction you have with us is meaningful and sincere.\n',
                            style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                        const Text(
                          '   Join us in rediscovering astrology’s true essence, with a team that places your well-being above all else. UnlimitedAstro is here to help you navigate life’s challenges, one conversation at a time.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC95524),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _reviewPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(title: 'UnlimitedAstro'),
            Container(
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Consult Genuine Astrologer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Unlimited Chat Minutes',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Unlimited Call Minutes',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Starting @151 rs',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/astro.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 12),
              child: Text(
                "Choose Astrologer to consult",
                style: TextStyle(
                  color: orangeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 310,
              child: FutureBuilder<List<Astrologer>>(
                future: futureAstrologers,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final astro = snapshot.data![index];
                      return AstrologerCard(
                        name: astro.name,
                        specialties: astro.expertise.join(', '),
                        originalPrice: '₹${astro.price}',
                        discountedPrice: '₹${astro.discountedPrice}',
                        imageUrl: astro.picture,
                        experience: astro.experience,
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Words from Our Users",
                    style: TextStyle(
                      color: orangeColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 450,
                    child: PageView.builder(
                      controller: _reviewPageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentReviewPage = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final reviews = [
                          {
                            'text': 'While I was going through my bad days where i was facing serious career problems and even has hurdles in my marriage, I had reached out to UnlimitedAstro app to get my horoscope read. Without creating any unnecessary fear and recommending any difficult remedies, they gave me accurate timelines of my marriage and job change. I did a very simple remedy and saw all my problem solving one by one. I feel so lucky to have landed up on this app. Even now my friends and family are also using this app for astrology.',
                            'user': '@Piyush',
                            'image': 'assets/images/user1.png',
                          },
                          {
                            'text': 'My daughter had been preparing for a government job for a long time but was not seeing any results. After consulting an astrologer on UnlimitedAstro, they advised that she should start a business as there was no indication of a government job in her horoscope. Now she has opened her own coaching center, and with God\'s grace, she has received many admissions. Whatever the astrologer on UnlimitedAstro app predicted turned out to be absolutely',
                            'user': '@Deepak',
                            'image': 'assets/images/piyush.png',
                          },
                          {
                            'text': 'My health had been deteriorating for a few days. Despite extensive treatments, there was no significant improvement. One day, I consulted an astrologer on UnlimitedAstro about my health issues. After following the recommended solution, my health improved significantly. Not only did my health get better, but my stalled work also progressed, and my relationships with some loved ones strengthened.',
                            'user': '@Anita',
                            'image': 'assets/images/rajesh.png',
                          }
                        ];

                        final review = reviews[index];

                        return Container(
                          padding: const EdgeInsets.fromLTRB(14, 0,14,14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '„„',
                                style: TextStyle(
                                  fontSize: 42,
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  height: 0.8,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    review['text'] ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(review['image'] ?? ''),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                review['user'] ?? '',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                      (dotIndex) => Container(
                                    width: dotIndex == _currentReviewPage ? 8 : 6,
                                    height: 6,
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: dotIndex == _currentReviewPage
                                          ? Colors.blue
                                          : Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBE6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black38, width: 1),
              ),
              // decoration: BoxDecoration(
              //   color: const Color(0xFFFFFBE6),
              //   borderRadius: BorderRadius.circular(12),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Why Choose UnlimitedAstro App for Astrology?",
                    style: TextStyle(
                      color: orangeColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'At UnlimitedAstro, we offer an unparalleled feature—unlimited talk time with our astrologers. We believe that meaningful guidance requires time, and you deserve the freedom to explore your concerns without worrying about limits. Whether it’s relationships, career, health, or personal growth, our astrologers are here to listen and provide thoughtful, personalized solutions.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const Text(
                    'Our mission goes beyond just offering convenience. Our goal is to challenge misconceptions surrounding astrology and provide a clearer under...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      _showAboutDialog();
                    },
                    child: Text(
                      'Read More',
                      style: TextStyle(
                        color: orangeColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[600]!, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Frequently Asked Questions",
                    style: TextStyle(
                      color: orangeColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFAQItem(
                    "What makes UnlimitedAstro different from other astrology apps?",
                    "At UnlimitedAstro, we offer unlimited talk time with genuine and experienced astrologers who are here to truly help you, not just to make money. Our mission is to restore trust in astrology by providing honest and personalized guidance tailored to your unique concerns.",
                  ),
                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "How does unlimited talk time work?",
                    "Unlimited talk time means there are no time limits when you consult with our astrologers. You can take all the time you need to discuss your concerns, ask questions, and get the clarity you deserve.",
                  ),
                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "After the amount is paid, how many times can I take the session?",
                    "The amount is valid for only one session. Once the consultation has started, the session is considered to be started. You have to be available for the session to continue the conversation. In case you are not responding, the system will automatically end the chat and mark as completed.",
                  ),
                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "How do I book a session with an astrologer?",
                    "If you need to reschedule, you can do so through the app or by contacting our customer care. We understand that life can be unpredictable, and we want to accommodate your needs.",
                  ),

                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "What if I need to reschedule my session?",
                    "If you need to reschedule, you can do so through the app or by contacting our customer care. We understand that life can be unpredictable, and we want to accommodate your needs.",
                  ),
                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "How do I know which astrologer is right for me?",
                    "You can read the profiles and reviews of our astrologers to find one that resonates with your needs. Each astrologer has their own expertise and approach, so take your time to choose the one that feels right for you.",
                  ),
                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "How many questions can I ask on one call?",
                    "You can ask as many questions as you want during one call, provided they are related to one birth detail or one hand (can be yours, a family member's, or a friend's). Similarly, for tarot card readings, you can ask unlimited questions for one person’s reading. If you wish to discuss readings for another person, you would need to connect on a separate call.",
                  ),
                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "What can I ask the astrologers?",
                    "You can ask about any aspect of your life, including relationships, career, health, finances, and personal growth. Whether you're looking for clarity, solutions, or just peace of mind, our astrologers are here to guide you.",
                  ),
                  const SizedBox(height: 14),
                  _buildFAQItem(
                    "Are my details and conversations secure?",
                    "Yes, we prioritize your privacy. All your details and conversations with our astrologers are completely confidential and handled with the utmost care.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 0),
    );
  }


  Widget _buildFAQItem(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          answer,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}