import 'package:banksha/blocs/auth/auth_bloc.dart';
import 'package:banksha/models/sign_up_form_model.dart';
import 'package:banksha/shared/shared_methods.dart';
import 'package:banksha/shared/theme.dart';
import 'package:banksha/ui/pages/sign_up_set_profile_page.dart';
import 'package:banksha/ui/widget/buttons.dart';
import 'package:banksha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showFlushbar(context, state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpSetProfilePage(
                  data: SignUpFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
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
                'Join Us to Unlock\nYour Growth',
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
                    CustomFormField(
                      title: 'Full Name',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      height: 50,
                      onPressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailController.text));
                        } else {
                          showFlushbar(context, 'Semua field harus diisi');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomTextButton(
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
              ),
              const SizedBox(height: 81),
            ],
          );
        },
      ),
    ));
  }
}
