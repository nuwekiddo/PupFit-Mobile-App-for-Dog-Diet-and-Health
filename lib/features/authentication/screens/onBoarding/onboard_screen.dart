// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable
// import 'package:dog_final/src/features/authentication/controllers/onboarding_controllers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final obController = OnBoardingController();

//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           LiquidSwipe(
//             pages: obController.pages,
//             enableSideReveal: true,
//             liquidController: obController.controller,
//             onPageChangeCallback: obController.onPageChangedCallback,
//             slideIconWidget: Icon(Icons.arrow_back_ios),
//           ),
//           Positioned(
//             bottom: 60.0,
//             child: OutlinedButton(
//               onPressed: () => obController.animateToNextSlide(),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 side: BorderSide(color: Colors.black26),
//                 shape: CircleBorder(),
//                 padding: EdgeInsets.all(20),
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF272727),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(Icons.arrow_forward_ios),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 55,
//             right: 20,
//             child: TextButton(
//               onPressed: () => obController.skip(),
//               child: Text(
//                 'Skip',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//           ),
//           Obx(
//             () => Positioned(
//                 bottom: 15,
//                 child: AnimatedSmoothIndicator(
//                   count: 3,
//                   activeIndex: obController.currentPage.value,
//                   effect: WormEffect(
//                       activeDotColor: Color(0xFF272727), dotHeight: 5.0),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }
