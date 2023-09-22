import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/common/language_dialog.dart';
import 'package:hotel_booking/controller/auth_controller.dart';
import 'package:hotel_booking/controller/theme_controller.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/screens/order/order.dart';
import 'package:hotel_booking/view/screens/profile/edit_profile.dart';
import '../../../utils/images.dart';
import '../../base/progress_card.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(Images.bg), fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .07),
          CircleAvatar(
            radius: 50,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: CustomNetworkImage(
                  loadingRadius: 50, url: AuthController.to.appUser!.image!),
            ),
          ),

          // user image
          SizedBox(height: MediaQuery.of(context).size.height * .05),
          // Text(AuthController.to.appUser!.name!,
          //     style: TextStyle(
          //         fontSize: fontSizeLarge(context),
          //         fontWeight: FontWeight.bold)),

          // RoundButton(
          //     height: 35.0,
          //     radius: 8.0,
          //     padding: 5,
          //     text: 'Edit Profile',
          //     iconData: FFIcons.edit,
          //     onPressed: () {
          //       launchScreen(const EditProfile());
          //     }),
          const SizedBox(height: 20),
          const ProgressCard(),
          const SizedBox(height: 30),
          _customTile(
              context, 'Edit Profile', () => launchScreen(const EditProfile()),
              icon: FFIcons.edit),
          const Divider(
            color: Colors.white,
          ),
          _customTile(
            context,
            'Orders'.tr,
            () {
              launchScreen(const OrderHistoryScreen());
            },
            icon: FFIcons.receipt,
          ),
          const Divider(
            color: Colors.white,
          ),
          _customTile(
            context,
            'dark_mode'.tr,
            () {
              ThemeController.to.toggleTheme();
            },
            theme: true,
            icon: FFIcons.moon,
          ),
          const Divider(
            color: Colors.white,
          ),
          _customTile(
            context,
            'language'.tr,
            () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return const LanguageDialog();
                  }));
            },
            icon: FFIcons.language,
          ),
          const Divider(
            color: Colors.white,
          ),
          _customTile(
            context,
            color: Colors.red,
            'Logout'.tr,
            () => AuthController.to.logoutUser(),
            icon: FFIcons.logout,
          ),
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    ));
  }

  _customTile(BuildContext context, String text, Function() onPressed,
      {bool theme = false, Color? color, IconData? icon, String? image}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      leading: CustomIcon(
          icon: icon,
          image: image,
          color: color ?? Theme.of(context).primaryColor),
      title: Text(text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      trailing: theme
          ? GetBuilder<ThemeController>(builder: (themeController) {
              return CupertinoSwitch(
                value: themeController.darkTheme,
                onChanged: (value) {
                  themeController.toggleTheme();
                },
              );
            })
          : const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
      onTap: onPressed,
    );
  }
}
