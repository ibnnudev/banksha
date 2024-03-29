import "package:banksha/blocs/auth/auth_bloc.dart";
import "package:banksha/shared/theme.dart";
import 'package:banksha/ui/pages/data_package_provider_page.dart';
import "package:banksha/ui/pages/data_provider_page.dart";
import "package:banksha/ui/pages/data_success_page.dart";
import "package:banksha/ui/pages/home_page.dart";
import "package:banksha/ui/pages/onboarding_page.dart";
import "package:banksha/ui/pages/pin_page.dart";
import "package:banksha/ui/pages/profile_edit_page.dart";
import "package:banksha/ui/pages/profile_edit_pin_page.dart";
import "package:banksha/ui/pages/profile_edit_success_page.dart";
import "package:banksha/ui/pages/profile_page.dart";
import "package:banksha/ui/pages/sign_in_page.dart";
import "package:banksha/ui/pages/sign_up_page.dart";
import "package:banksha/ui/pages/sign_up_set_ktp_page.dart";
import "package:banksha/ui/pages/sign_up_success_page.dart";
import "package:banksha/ui/pages/splash_page.dart";
import "package:banksha/ui/pages/top_up_amount.page.dart";
import "package:banksha/ui/pages/top_up_page.dart";
import "package:banksha/ui/pages/top_up_success_page.dart";
import "package:banksha/ui/pages/transfer_amount_page.dart";
import "package:banksha/ui/pages/transfer_page.dart";
import "package:banksha/ui/pages/transfer_success_page.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: lightBackgroundColor,
            iconTheme: const IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/topup': (context) => const TopUpPage(),
          '/topup-amount': (context) => const TopUpAmountPage(),
          '/topup-success': (context) => const TopUpSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-provider-package': (context) =>
              const DataPackageProviderPage(),
          '/data-success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}
