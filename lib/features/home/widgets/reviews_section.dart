import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  final PageController pageController;
  final int currentIndex;
  final Function(int) onPageChanged;

  const ReviewsSection({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.onPageChanged,
  });

  static const orangeColor = Color(0xFFC95524);

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {
        'text':
        'While I was going through my bad days where i was facing serious career problems and even has hurdles in my marriage, I had reached out to UnlimitedAstro app to get my horoscope read. Without creating any unnecessary fear and recommending any difficult remedies, they gave me accurate timelines of my marriage and job change. I did a very simple remedy and saw all my problem solving one by one.',
        'user': '@Piyush',
        'image': 'assets/images/user1.png',
      },
      {
        'text':
        'My daughter had been preparing for a government job for a long time but was not seeing any results. After consulting an astrologer on UnlimitedAstro, they advised that she should start a business.',
        'user': '@Deepak',
        'image': 'assets/images/piyush.png',
      },
      {
        'text':
        'My health had been deteriorating for a few days. Despite extensive treatments, there was no significant improvement. After consulting an astrologer, my health improved significantly.',
        'user': '@Anita',
        'image': 'assets/images/rajesh.png',
      },
    ];

    return Container(
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

          /// PAGE VIEW
          SizedBox(
            height: 390,
            child: PageView.builder(
              controller: pageController,
              itemCount: reviews.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                final review = reviews[index];

                return Container(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                  color: Colors.white,
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

                      /// REVIEW TEXT
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            review['text']!,
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

                      /// USER IMAGE
                      CircleAvatar(
                        radius: 35,
                        backgroundImage:
                        AssetImage(review['image']!),
                      ),
                      const SizedBox(height: 10),

                      /// USER NAME
                      Text(
                        review['user']!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// DOT INDICATOR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          reviews.length,
                              (dotIndex) => Container(
                            width: dotIndex == currentIndex ? 8 : 6,
                            height: 6,
                            margin:
                            const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: dotIndex == currentIndex
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
    );
  }
}
