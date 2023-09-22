import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/textfield.dart';
import 'package:hotel_booking/controller/auth_controller.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/view/screens/auth/signup.dart';
import 'package:hotel_booking/view/screens/auth/widget/verify_email_dialog.dart';

import '../../../utils/images.dart';

class LoginScreen extends StatefulWidget {
  final bool verificationn;
  final bool back;
  const LoginScreen({this.verificationn = false, this.back = true, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    if (widget.verificationn) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context, builder: (context) => const VerifyEmailDialog());
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height * 1,
      width: Get.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.background), fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            // Image.asset(
            //   Images.logoWhite,
            //   width: MediaQuery.of(context).size.width,
            // ),
            CustomTextField(
              controller: email,
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: const Icon(FFIcons.email),
            ),
            CustomTextField(
              controller: password,
              obscureText: true,
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: const Icon(FFIcons.lock),
            ),
            const SizedBox(height: 20),
            OutlineButton(
              text: 'SIGN IN',
              onPressed: () {
                AuthController.to.loginUser(context, email.text, password.text);
              },
              boarderSideColor: Theme.of(context).primaryColor,
              buttonInerColor: Theme.of(context).secondaryHeaderColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).cardColor),
                ),
                TextButton(
                  onPressed: () {
                    launchScreen(const SignupScreen());
                  },
                  child: Text('Sign Up',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xffEB330F),
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          ],
        ),
      ),
    ));

    // Scaffold(
    //     body: SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    // CustomTextField(
    //   controller: email,
    //   labelText: 'Email',
    //   hintText: 'Enter your email',
    //   prefixIcon: const Icon(FFIcons.email),
    // ),
    // CustomTextField(
    //   controller: password,
    //   obscureText: true,
    //   labelText: 'Password',
    //   hintText: 'Enter your password',
    //   prefixIcon: const Icon(FFIcons.lock),
    // ),
    //         const SizedBox(height: 50),
    //         CustomButton(
    //             text: 'Sign In',
    //             onPressed: () {
    // AuthController.to
    //     .loginUser(context, email.text, password.text);
    //             }),
    //         const SizedBox(height: 10),
    //         // dont have account text
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(
    //       'Don\'t have an account?',
    //       style: Theme.of(context)
    //           .textTheme
    //           .bodyMedium!
    //           .copyWith(fontWeight: FontWeight.normal),
    //     ),
    //     TextButton(
    //       onPressed: () {
    //         launchScreen(const SignupScreen());
    //       },
    //       child: Text('Sign Up',
    //           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
    //               color: Theme.of(context).primaryColor,
    //               fontWeight: FontWeight.normal)),
    //     ),
    //   ],
    // ),
    //         Center(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: RichText(
    //               textAlign: TextAlign.center,
    //               text: TextSpan(
    //                 text: 'If you continue, you agree to our',
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .bodyMedium!
    //                     .copyWith(fontWeight: FontWeight.normal),
    //                 children: <TextSpan>[
    //                   TextSpan(
    //                       text: 'Terms of Service',
    //                       style: Theme.of(context)
    //                           .textTheme
    //                           .bodyLarge!
    //                           .copyWith(
    //                               color: Theme.of(context).primaryColor,
    //                               fontWeight: FontWeight.normal)),
    //                   const TextSpan(text: ' and '),
    //                   TextSpan(
    //                       text: 'Privacy Policy',
    //                       style: Theme.of(context)
    //                           .textTheme
    //                           .bodyLarge!
    //                           .copyWith(
    //                               color: Theme.of(context).primaryColor,
    //                               fontWeight: FontWeight.normal)),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
  }
}
