import 'dart:io';

import 'package:banksha/models/sign_up_form_model.dart';
import 'package:banksha/shared/shared_methods.dart';
import 'package:banksha/shared/theme.dart';
import 'package:banksha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetKtpPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return SafeArea(
        child: Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo_light.png'),
              ),
            ),
          ),
          const SizedBox(height: 100),
          Text(
            'Verify Your\nAccount',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(selectedImage!.path),
                              ),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                              'assets/icon_upload.png',
                              width: 32,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Passport/ID Card',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  height: 50,
                  onPressed: () {
                    if (validate()) {
                    } else {
                      showFlushbar(context, 'Gambar tidak boleh ;kosong!');
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          CustomTextButton(
            title: 'Skip for now',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up-success');
            },
          ),
          const SizedBox(
            height: 81,
          ),
        ],
      ),
    ));
  }
}
