import 'package:get/get.dart';
import 'package:tour/ui/views/auth/signin_screen.dart';
import 'package:tour/ui/views/auth/signup_screen.dart';
import 'package:tour/ui/views/auth/user_from_screen.dart';
import 'package:tour/ui/views/bottomnavcontroller/details_screen.dart';
import 'package:tour/ui/views/bottomnavcontroller/see_all.dart';
import 'package:tour/ui/views/drawer_pages/faq.dart';
import 'package:tour/ui/views/drawer_pages/how_to_use.dart';
import 'package:tour/ui/views/drawer_pages/privacy.dart';
import 'package:tour/ui/views/drawer_pages/settings.dart';
import 'package:tour/ui/views/drawer_pages/support.dart';
import 'package:tour/ui/views/main_home_screen.dart';
import 'package:tour/ui/views/onboardingscreen.dart';
import 'package:tour/ui/views/privacy_policy_screen.dart';
import 'package:tour/ui/views/splashscreen.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";
const String signup = "/sign-up-screen";
const String signin = "/sign-in-screen";
const String userform = "/user-form-screen";
const String privacy = "/privacy-policy-screen";
const String mainhomescreen = "/main-home-screen";
const String supportscreen = "/support-screen";
const String privacyscreen = "/privacy-screen";
const String faqscreen = "/faq-screen";
const String howtousescreen = "/how-to-use-screen";
const String settingsscreen = "/settings-screen";
const String seeallscreen = "/see_all-screen";
const String detailsscreen = "/details-screen";

List<GetPage> getpages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnboardingScreen(),
  ),
  GetPage(
    name: signup,
    page: () => SignUpScreen(),
  ),
  GetPage(
    name: signin,
    page: () => SignInScreen(),
  ),
  GetPage(
    name: privacy,
    page: () => PrivacyPolicyScreen(),
  ),
  GetPage(
    name: userform,
    page: () => UserFormScreen(),
  ),
  GetPage(
    name: mainhomescreen,
    page: () => MainHomeScreen(),
  ),
  GetPage(
    name: supportscreen,
    page: () => SupportScreen(),
  ),
  GetPage(
    name: privacyscreen,
    page: () => PrivacyScreen(),
  ),
  GetPage(
    name: faqscreen,
    page: () => FaqScreen(),
  ),
  GetPage(
    name: howtousescreen,
    page: () => HowToUseScreen(),
  ),
  GetPage(
    name: settingsscreen,
    page: () => SettingsScreen(),
  ),
  GetPage(
    name: seeallscreen,
    page: () => SeeAll(),
  ),
  GetPage(
    name: detailsscreen,
    page: () => DetailsSCreen(),
  ),
];
