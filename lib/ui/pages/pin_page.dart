import 'package:banksha/shared/shared_methods.dart';
import 'package:banksha/shared/theme.dart';
import 'package:banksha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == '123123') {
        Navigator.pop(context, true);
      } else {
        showFlushbar(
          context,
          'PIN yang anda masukkan salah. Silakan coba lagi.',
        );
        pinController.text = '';
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 36),
        children: [
          Text(
            'Pin Sha',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 72,
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                enabled: false,
                controller: pinController,
                obscureText: true,
                obscuringCharacter: '*',
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                  letterSpacing: 16,
                ),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 66,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 58),
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                CustomInputButton(
                  title: '1',
                  onTap: () {
                    addPin('1');
                  },
                ),
                CustomInputButton(
                  title: '2',
                  onTap: () {
                    addPin('2');
                  },
                ),
                CustomInputButton(
                  title: '3',
                  onTap: () {
                    addPin('3');
                  },
                ),
                CustomInputButton(
                  title: '4',
                  onTap: () {
                    addPin('4');
                  },
                ),
                CustomInputButton(
                  title: '5',
                  onTap: () {
                    addPin('5');
                  },
                ),
                CustomInputButton(
                  title: '6',
                  onTap: () {
                    addPin('6');
                  },
                ),
                CustomInputButton(
                  title: '7',
                  onTap: () {
                    addPin('7');
                  },
                ),
                CustomInputButton(
                  title: '8',
                  onTap: () {
                    addPin('8');
                  },
                ),
                CustomInputButton(
                  title: '9',
                  onTap: () {
                    addPin('9');
                  },
                ),
                const SizedBox(
                  width: 60,
                  height: 60,
                ),
                CustomInputButton(
                  title: '0',
                  onTap: () {
                    addPin('0');
                  },
                ),
                GestureDetector(
                  onTap: () {
                    deletePin();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: numberBackgroundColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chevron_left_outlined,
                        color: whiteColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
