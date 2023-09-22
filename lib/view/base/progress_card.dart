import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/controller/auth_controller.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:hotel_booking/utils/icons.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (con) {
      return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // name
                Text(con.appUser!.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white)),
                const Spacer(),
                // points
                Text(
                    con.appUser!.loyaltyPoints == null
                        ? ''
                        : '${con.appUser!.loyaltyPoints}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white)),
                const SizedBox(width: 5),
                // points icon
                const Icon(
                  FFIcons.star,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 10),

            Text('${con.appUser!.loyalty_amount} $CURRENCY',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white))

            // // progress bar
            // Row(
            //   children: [
            //     Expanded(
            //       child: Column(
            //         children: [
            //           ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: LinearProgressIndicator(
            //               value: 0.2,
            //               backgroundColor: Colors.white.withOpacity(0.2),
            //               valueColor:
            //                   const AlwaysStoppedAnimation<Color>(Colors.orange),
            //             ),
            //           ),
            //           const SizedBox(height: 5),
            //           Row(
            //             children: [
            //               // text
            //               ,
            //               // text
            //               Text('10,000',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodySmall!
            //                       .copyWith(color: Colors.white)),
            //               const Spacer(),
            //               // text
            //               Text('Elite',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodySmall!
            //                       .copyWith(color: Colors.white)),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      );
    });
  }
}
