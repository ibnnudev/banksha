import 'package:banksha/shared/theme.dart';
import 'package:banksha/ui/widget/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: lightBackgroundColor,
        iconTheme: const IconThemeData(
          color: blackColor,
        ),
        title: Text(
          'My Profile',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/img_profile.png'),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const ProfileMenuItem(
                  iconUrl: 'assets/icon_user_profile.png',
                  title: 'Edit Profile',
                ),
                const ProfileMenuItem(
                  iconUrl: 'assets/icon_shield.png',
                  title: 'My Pin',
                ),
                const ProfileMenuItem(
                  iconUrl: 'assets/icon_credit_card.png',
                  title: 'Wallet Settings',
                ),
                const ProfileMenuItem(
                  iconUrl: 'assets/icon_award.png',
                  title: 'My Rewards',
                  amount: 2,
                ),
                const ProfileMenuItem(
                  iconUrl: 'assets/icon_sidebar.png',
                  title: 'Help Center',
                ),
                const ProfileMenuItem(
                  iconUrl: 'assets/icon_logout.png',
                  title: 'Log Out',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          Text(
            'Report a Problem',
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
