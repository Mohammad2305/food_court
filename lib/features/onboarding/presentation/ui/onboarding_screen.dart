import 'package:flutter/material.dart';
import 'package:food_court/features/onboarding/data/models/onboarding_page.dart';
import 'package:food_court/features/onboarding/presentation/ui/widgets/skip_button.dart';
import 'package:food_court/features/onboarding/presentation/ui/widgets/text_container.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

late final PageController _onboardingController;
late int _currentIndex;

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    _onboardingController = PageController();
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _onboardingController,
            itemCount: onboarding.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                onboarding[index].pageImage,
                fit: BoxFit.cover,
              );
            },
          ),
          _currentIndex==onboarding.length-1 ? SizedBox.shrink() : SkipButton(),
          TextContainer(
            currentIndex: _currentIndex,
            pageController: _onboardingController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _onboardingController.dispose();
    super.dispose();
  }
}
