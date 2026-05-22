import 'package:flutter/material.dart';
import '../../core/constants/app_images.dart';
import '../../core/utils/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  int currentIndex = 0;
  final List<Map<String, dynamic>> onboarding = [
    {
      "image": AppImages.onboardingImage1,

      "title": "Welcome to Trophy Talk",

      "desc":
          "Connect with hunting enthusiasts, share your adventures, and grow with a vibrant community.",
    },

    {
      "image": AppImages.onboardingImage2,

      "title": "Discover Videos",

      "desc":
          "Create short videos, go live, and watch exciting videos from your fellow hunters!",
    },

    {
      "image": AppImages.onboardingImage3,

      "title": "Join Giveaways & Competitions",

      "desc":
          "Gear up with exclusive giveaways, exciting competitions, and adventurous trips.",
    },
  ];

  void nextPage(int index) {
    if (index == onboarding.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.welcomeAuthScreen);
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),

        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),

      body: PageView.builder(
        controller: controller,

        itemCount: onboarding.length,

        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },

        itemBuilder: (_, index) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  onboarding[index]["image"],
                  fit: BoxFit.cover,
                ),
              ),

              Container(color: Colors.black.withValues(alpha: 0.25)),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.welcomeAuthScreen,
                            );
                          },

                          child: const Text(
                            "Skip",

                            style: TextStyle(
                              color: Colors.white,

                              fontSize: 14,

                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      Text(
                        onboarding[index]["title"],

                        textAlign: TextAlign.center,

                        style: const TextStyle(
                          color: Colors.white,

                          fontSize: 28,

                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 18),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),

                        child: Text(
                          onboarding[index]["desc"],

                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            color: Colors.white70,

                            fontSize: 15,

                            height: 1.7,
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      GestureDetector(
                        onTap: () {
                          nextPage(index);
                        },

                        child: Container(
                          height: 65,

                          width: 65,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            border: Border.all(color: Colors.white, width: 1.2),
                          ),

                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,

                              color: Colors.white,

                              size: 28,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
