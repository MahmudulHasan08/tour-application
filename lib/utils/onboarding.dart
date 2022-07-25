import 'package:tour/utils/const/appfiles.dart';
import 'package:tour/utils/const/appstrings.dart';

class Onboarding{
  final String title;
  final String SubTitle;
  final String files;
  Onboarding({required this.title,required this.SubTitle,required this.files});
  List<Onboarding> onboardingContents=[
    Onboarding(
        title: AppStrings.onboardingTitle1,
        SubTitle: AppStrings.onboardingDescription,
        files: AppFiles.welcome
    ),
    Onboarding(
        title: AppStrings.onboardingTitle2,
        SubTitle: AppStrings.onboardingDescription,
        files: AppFiles.categories
    ),
    Onboarding(
        title: AppStrings.onboardingTitle3,
        SubTitle: AppStrings.onboardingDescription,
        files: AppFiles.support
    ),
  ];
}