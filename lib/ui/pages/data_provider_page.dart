import 'package:banksha/shared/theme.dart';
import 'package:banksha/ui/widget/buttons.dart';
import 'package:banksha/ui/widget/data_provider_item.dart';
import 'package:flutter/material.dart';

class DataProgviderPage extends StatelessWidget {
  const DataProgviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Balance: Rp 180.000.000',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          DataProviderItem(
            imageUrl: 'assets/img_telkomsel.png',
            name: 'Telkomsel',
            isAvailable: true,
            isSelected: true,
          ),
          DataProviderItem(
            imageUrl: 'assets/img_indosat.png',
            name: 'Indosat Ooredoo',
            isAvailable: true,
            isSelected: false,
          ),
          DataProviderItem(
            imageUrl: 'assets/img_singtel.png',
            name: 'Singtel ID',
            isAvailable: true,
            isSelected: false,
          ),
          const SizedBox(
            height: 135,
          ),
          CustomFilledButton(title: 'Continue'),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
