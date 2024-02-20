import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/screens/wallet_topup_screen.dart';

import 'screens/about_us_screen.dart';
import 'screens/agora_call/join_channel_audio.dart';
import 'screens/agora_call/join_channel_video.dart';
import 'screens/appointment_detail_screen.dart';
import 'screens/appointment_history_screen.dart';
import 'screens/blog_detail_screen.dart';
import 'screens/blogs_screen.dart';
import 'screens/chat_appointment_screen.dart';
import 'screens/contact_us_screen.dart';
import 'screens/event_detail_screen.dart';
import 'screens/events_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/law_firm_profile_screen.dart';
import 'screens/law_firms_screen.dart';
import 'screens/lawyer_profile_screen.dart';
import 'screens/lawyers_by_category_screen.dart';
import 'screens/live_chat_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/quick_buy_services_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/call_appointment_screen.dart';
import 'screens/wallet_screen.dart';
import 'widgets/bottom_navigation_widget.dart';

appRoutes() => [
      GetPage(name: '/splashscreen', page: () => const SplashScreen()),
      GetPage(name: '/introscreen', page: () => const IntroScreen()),
      GetPage(name: '/homescreen', page: () => const BottomNavigationWidget()),
      GetPage(
          name: '/lawfirmprofilescreen', page: () => LawFirmProfileScreen()),
      GetPage(name: '/lawfirmsscreen', page: () => const LawFirmsScreen()),
      GetPage(name: '/lawyerprofilescreen', page: () => LawyerProfileScreen()),
      GetPage(
        name: '/lawyersbycategoryscreen',
        page: () => const LawyersByCategoryScreen(),
      ),
      GetPage(
          name: '/callappointmentscreen',
          page: () => const CallAppointmentScreen()),
      GetPage(
          name: '/chatappointmentscreen',
          page: () => const ChatAppointmentScreen()),
      GetPage(
          name: '/notificationsscreen',
          page: () => const NotificationsScreen()),
      GetPage(
          name: '/userprofilescreen', page: () => const UserProfileScreen()),
      GetPage(name: '/contactusscreen', page: () => const ContactUsScreen()),
      GetPage(name: '/aboutusscreen', page: () => const AboutUsScreen()),
      GetPage(
          name: '/appointmenthistoryscreen',
          page: () => const AppointmentHistoryScreen()),
      GetPage(
          name: '/appointmenthistorydetailscreen',
          page: () => const AppointmentDetailScreen()),
      GetPage(name: '/walletscreen', page: () => const WalletScreen()),
      GetPage(
          name: '/wallettopupscreen', page: () => const WalletTopUpScreen()),
      GetPage(name: '/blogsscreen', page: () => const BlogsScreen()),
      GetPage(name: '/blogdetailscreen', page: () => BlogDetailScreen()),
      GetPage(name: '/eventsscreen', page: () => const EventsScreen()),
      GetPage(name: '/eventdetailscreen', page: () => EventDetailScreen()),
      GetPage(name: '/signinscreen', page: () => SigninScreen()),
      GetPage(name: '/signupscreen', page: () => SignupScreen()),
      GetPage(
          name: '/quickbuyservices',
          page: () => const QuickBuyServicesScreen()),
      GetPage(
          name: '/quickbuyservices',
          page: () => const QuickBuyServicesScreen()),
      GetPage(name: '/videocallscreen', page: () => const JoinChannelVideo()),
      GetPage(name: '/audiocallscreen', page: () => const JoinChannelAudio()),
      GetPage(name: '/livechatscreen', page: () => const LiveChatScreen()),
      GetPage(
          name: '/forgotpasswordscreen', page: () => ForgotPasswordScreen()),
      GetPage(
          name: '/privacypolicyscreen',
          page: () => const PrivacyPolicyScreen()),
      // GetPage(name: '/videoCallWaiting', page: () => const CallWaitingView()),
    ];

class PageRoutes {
  static const String splashScreen = '/splashscreen';
  static const String introScreen = '/introscreen';
  static const String homeScreen = '/homescreen';
  static const String lawFirmProfileScreen = '/lawfirmprofilescreen';
  static const String lawFirmsScreen = '/lawfirmsscreen';
  static const String lawyerProfileScreen = '/lawyerprofilescreen';
  static const String lawyersByCategoryScreen = '/lawyersbycategoryscreen';
  static const String callAppointmentScreen = '/callappointmentscreen';
  static const String chatAppointmentScreen = '/chatappointmentscreen';
  static const String notificationsScreen = '/notificationsscreen';
  static const String userProfileScreen = '/userprofilescreen';
  static const String contactusScreen = '/contactusscreen';
  static const String aboutusScreen = '/aboutusscreen';
  static const String appointmentHistoryScreen = '/appointmenthistoryscreen';
  static const String appointmentHistoryDetailScreen =
      '/appointmenthistorydetailscreen';
  static const String walletScreen = '/walletscreen';
  static const String walletTopUpScreen = '/wallettopupscreen';
  static const String blogsScreen = '/blogsscreen';
  static const String blogDetailScreen = '/blogdetailscreen';
  static const String eventsScreen = '/eventsscreen';
  static const String eventDetailScreen = '/eventdetailscreen';
  static const String signinScreen = '/signinscreen';
  static const String signupScreen = '/signupscreen';
  static const String videoCallScreen = '/videocallscreen';
  static const String audioCallScreen = '/audiocallscreen';
  static const String quickBuyServices = '/quickbuyservices';
  static const String videoCallWaiting = '/quickbuyservices';
  static const String liveChatScreen = '/livechatscreen';
  static const String forgotPasswordScreen = '/forgotpasswordscreen';
  static const String privacyPolicyScreen = '/privacypolicyscreen';

  Map<String, WidgetBuilder> appRoutes() {
    return {
      splashScreen: (context) => const SplashScreen(),
      introScreen: (context) => const IntroScreen(),
      homeScreen: (context) => const BottomNavigationWidget(),
      lawFirmProfileScreen: (context) => LawFirmProfileScreen(),
      lawFirmsScreen: (context) => const LawFirmsScreen(),
      lawyerProfileScreen: (context) => LawyerProfileScreen(),
      lawyersByCategoryScreen: (context) => const LawyersByCategoryScreen(),
      callAppointmentScreen: (context) => const CallAppointmentScreen(),
      chatAppointmentScreen: (context) => const ChatAppointmentScreen(),
      notificationsScreen: (context) => const NotificationsScreen(),
      userProfileScreen: (context) => const UserProfileScreen(),
      contactusScreen: (context) => const ContactUsScreen(),
      aboutusScreen: (context) => const AboutUsScreen(),
      appointmentHistoryScreen: (context) => const AppointmentHistoryScreen(),
      appointmentHistoryDetailScreen: (context) =>
          const AppointmentHistoryScreen(),
      walletScreen: (context) => const WalletScreen(),
      walletTopUpScreen: (context) => const WalletTopUpScreen(),
      blogsScreen: (context) => const BlogsScreen(),
      blogDetailScreen: (context) => BlogDetailScreen(),
      eventsScreen: (context) => const EventsScreen(),
      eventDetailScreen: (context) => EventDetailScreen(),
      signinScreen: (context) => SigninScreen(),
      signupScreen: (context) => SignupScreen(),
      quickBuyServices: (context) => const QuickBuyServicesScreen(),
      videoCallScreen: (context) => const JoinChannelVideo(),
      audioCallScreen: (context) => const JoinChannelAudio(),
      liveChatScreen: (context) => const LiveChatScreen(),
      forgotPasswordScreen: (context) => ForgotPasswordScreen(),
      privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
    };
  }
}
