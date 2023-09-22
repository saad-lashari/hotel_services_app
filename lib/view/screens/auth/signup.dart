import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/common/textfield.dart';
import 'package:hotel_booking/controller/auth_controller.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/style.dart';

import '../../../utils/images.dart';

class SignupScreen extends StatefulWidget {
  final bool back;
  const SignupScreen({this.back = false, super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dialCode = '+92';
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController phone = TextEditingController();
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // Image.asset(
              //   Images.logoWhite,
              //   width: MediaQuery.of(context).size.width,
              // ),
              CustomTextField(
                keyboardType: TextInputType.name,
                controller: name,
                labelText: 'Name',
                hintText: 'Enter your name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: email,
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: const Icon(FFIcons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: password,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                prefixIcon: const Icon(FFIcons.lock),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: confirmpassword,
                labelText: 'Confirm Password',
                hintText: 'Enter  password again',
                obscureText: true,
                prefixIcon: const Icon(FFIcons.lock),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value != password.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Phone Number',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        favorite: ['+92'],
                        countryListTheme: CountryListThemeData(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor),
                        onSelect: (Country country) {
                          setState(() {
                            dialCode = "+${country.phoneCode}";
                          });
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 13),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Theme.of(context).cardColor),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Text(dialCode,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context).hintColor)),
                          const SizedBox(width: 5),
                          const Icon(FFIcons.downArrow,
                              color: Colors.grey, size: 15),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      padding: const EdgeInsets.only(top: 5),
                      controller: phone,
                      hintText: 'Enter phone number',
                      prefixIcon: Icon(Icons.call,
                          size: 20, color: Theme.of(context).hintColor),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              OutlineButton(
                text: 'SIGN Up',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthController.to.signupUser(
                        context,
                        email.text,
                        password.text,
                        name.text,
                        '$dialCode ${phone.text.replaceAll(' ', '')}');
                  }
                },
                boarderSideColor: Theme.of(context).primaryColor,
                buttonInerColor: Theme.of(context).secondaryHeaderColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).cardColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Sign In',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xffEB330F),
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));

    // Scaffold(
    //     appBar: AppBar(
    //       leading: widget.back ? const CustomBackButton() : null,
    //       title: const Text('Sign Up'),
    //       centerTitle: true,
    //     ),
    //     body: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(20),
    //         child: Form(
    //           key: _formKey,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text('Welcome',
    //                   style: Theme.of(context).textTheme.headlineLarge),
    //               const SizedBox(height: 10),
    //               Text(
    //                   'Enter your details below to complete\nyour registration.',
    //                   style: Theme.of(context)
    //                       .textTheme
    //                       .bodyMedium!
    //                       .copyWith(fontWeight: fontWeightNormal)),

    //               //
    //               SizedBox(height: getPixels(context, 20)),
    // CustomTextField(
    //   controller: name,
    //   labelText: 'Name',
    //   hintText: 'Enter your name',
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return 'Please enter your name';
    //     }
    //     return null;
    //   },
    // ),
    // CustomTextField(
    //   controller: email,
    //   labelText: 'Email',
    //   hintText: 'Enter your email',
    //   prefixIcon: const Icon(FFIcons.email),
    //   keyboardType: TextInputType.emailAddress,
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return 'Please enter your email';
    //     }
    //     return null;
    //   },
    // ),
    // CustomTextField(
    //   controller: password,
    //   labelText: 'Password',
    //   hintText: 'Enter your password',
    //   obscureText: true,
    //   prefixIcon: const Icon(FFIcons.lock),
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return 'Please enter your password';
    //     }
    //     return null;
    //   },
    // ),
    // CustomTextField(
    //   controller: confirmpassword,
    //   labelText: 'Confirm Password',
    //   hintText: 'Enter  password again',
    //   obscureText: true,
    //   prefixIcon: const Icon(FFIcons.lock),
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return 'Please enter your password';
    //     } else if (value != password.text) {
    //       return 'Password does not match';
    //     }
    //     return null;
    //   },
    // ),
    // const SizedBox(height: 20),
    // Text(
    //   'Phone Number',
    //   style: Theme.of(context)
    //       .textTheme
    //       .bodyMedium!
    //       .copyWith(color: Theme.of(context).hintColor),
    // ),
    // Row(
    //   children: [
    //     GestureDetector(
    //       onTap: () {
    //         showCountryPicker(
    //           context: context,
    //           showPhoneCode: true,
    //           favorite: ['+92'],
    //           countryListTheme: CountryListThemeData(
    //               backgroundColor:
    //                   Theme.of(context).scaffoldBackgroundColor),
    //           onSelect: (Country country) {
    //             setState(() {
    //               dialCode = "+${country.phoneCode}";
    //             });
    //           },
    //         );
    //       },
    //       child: Container(
    //         margin: const EdgeInsets.only(top: 5),
    //         padding: const EdgeInsets.symmetric(
    //             horizontal: 10, vertical: 15),
    //         decoration: BoxDecoration(
    //           color: Theme.of(context).cardColor,
    //           borderRadius: BorderRadius.circular(8),
    //         ),
    //         child: Row(
    //           children: [
    //             Text(dialCode,
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .bodyLarge!
    //                     .copyWith(
    //                         color: Theme.of(context).hintColor)),
    //             const SizedBox(width: 5),
    //             const Icon(FFIcons.downArrow,
    //                 color: Colors.grey, size: 15),
    //           ],
    //         ),
    //       ),
    //     ),
    //     const SizedBox(width: 10),
    //     Expanded(
    //       child: CustomTextField(
    //         padding: const EdgeInsets.only(top: 5),
    //         controller: phone,
    //         hintText: 'Enter phone number',
    //         prefixIcon: Icon(Icons.call,
    //             size: 20, color: Theme.of(context).hintColor),
    //         keyboardType: TextInputType.phone,
    //         validator: (value) {
    //           if (value!.isEmpty) {
    //             return 'Please enter your phone number';
    //           }
    //           return null;
    //         },
    //       ),
    //     ),
    //   ],
    // ),
    //               const SizedBox(height: 50),
    //               CustomButton(
    //                   text: 'Sign Up',
    //                   onPressed: () {
    //                     if (_formKey.currentState!.validate()) {
    //                       AuthController.to.signupUser(
    //                           context,
    //                           email.text,
    //                           password.text,
    //                           name.text,
    //                           '$dialCode ${phone.text.replaceAll(' ', '')}');
    //                     }
    //                   }),
    //               const SizedBox(height: 10),
    //               // dont have account text
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     'Already have an account?',
    //                     style: Theme.of(context)
    //                         .textTheme
    //                         .bodyMedium!
    //                         .copyWith(fontWeight: FontWeight.normal),
    //                   ),
    //                   TextButton(
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     child: Text('Sign In',
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .bodyMedium!
    //                             .copyWith(
    //                                 color: Theme.of(context).primaryColor,
    //                                 fontWeight: FontWeight.normal)),
    //                   ),
    //                 ],
    //               ),
    //               Center(
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: RichText(
    //                     textAlign: TextAlign.center,
    //                     text: TextSpan(
    //                       text: 'If you continue, you agree to our',
    //                       style: Theme.of(context)
    //                           .textTheme
    //                           .bodyLarge!
    //                           .copyWith(fontWeight: FontWeight.normal),
    //                       children: <TextSpan>[
    //                         TextSpan(
    //                             text: 'Terms of Service',
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyLarge!
    //                                 .copyWith(
    //                                     color: Theme.of(context).primaryColor,
    //                                     fontWeight: FontWeight.normal)),
    //                         const TextSpan(text: ' and '),
    //                         TextSpan(
    //                             text: 'Privacy Policy',
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyLarge!
    //                                 .copyWith(
    //                                     color: Theme.of(context).primaryColor,
    //                                     fontWeight: FontWeight.normal)),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ));
  }
}
