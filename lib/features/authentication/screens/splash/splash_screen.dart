// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously

// import 'package:dog_final/src/common_widgets/fade_in_animation/animation_design.dart';
// import 'package:dog_final/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
// import 'package:dog_final/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
// import 'package:dog_final/src/constants/colors.dart';
// import 'package:dog_final/src/constants/image_strings.dart';
// import 'package:dog_final/src/constants/sizes.dart';
// import 'package:dog_final/src/constants/text_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FadeInAnimationController());
//     controller.startSplashAnimation();
//     return Scaffold(
//       body: Stack(
//           // ignore: prefer_const_literals_to_create_immutables
//           children: [
//             tFadeInAnimation(
//               durationInMs: 1600,
//               animate: tAnimatePosition(
//                   topAfter: 0, topBefore: -30, leftBefore: -30, leftAfter: 0),
//               child: const Image(
//                 image: AssetImage(tSplashTopIcon),
//               ),
//             ),
//             //tFadeInAnimation(splashController: splashController),

//             tFadeInAnimation(
//               durationInMs: 2000,
//               animate: tAnimatePosition(
//                   topBefore: 80,
//                   topAfter: 80,
//                   leftAfter: tDefaultSize,
//                   leftBefore: -80),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(tAppName, style: Theme.of(context).textTheme.headline3),
//                   Text(tAppTagLine,
//                       style: Theme.of(context).textTheme.headline2),
//                 ],
//               ),
//             ),

//             tFadeInAnimation(
//               durationInMs: 2400,
//               animate: tAnimatePosition(bottomBefore: 0, bottomAfter: 100),
//               child: Image(
//                 image: AssetImage(tSplashImage),
//               ),
//             ),

//             tFadeInAnimation(
//               durationInMs: 2400,
//               animate: tAnimatePosition(
//                   bottomBefore: 0,
//                   bottomAfter: 60,
//                   rightBefore: tDefaultSize,
//                   rightAfter: tDefaultSize),
//               child: Container(
//                 width: tSplashContainerSize,
//                 height: tSplashContainerSize,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: tPrimaryColor,
//                 ),
//               ),
//             ),
//           ]),
//     );
//   }
// }
