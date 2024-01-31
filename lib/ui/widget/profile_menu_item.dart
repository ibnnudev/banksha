import 'package:banksha/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  final int? amount;

  const ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onTap,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconUrl,
              width: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const Spacer(),
            if (amount != null)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    amount.toString(),
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
