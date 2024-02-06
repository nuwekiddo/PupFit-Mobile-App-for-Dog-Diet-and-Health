// import 'package:get/get.dart';

// import '../../../constants/colors.dart';
// import '../../../constants/text_strings.dart';
// import '../models/onboarding_models.dart';
// import '../screens/onBoarding/onboard_page_widget.dart';

// class OnBoardingController extends GetxController {
//   final controller = LiquidController();
//   RxInt currentPage = 0.obs;

//   final pages = [
//     OnBoardingPageWidget(
//       model: OnBoardingModel(
//         title: tOnbaordingTitle1,
//         image: tOnBoardingImage1,
//         subTitle: tOnbaordingSubTitle1,
//         counterText: tOnbaordingCounter1,
//         bgColor: tOnBoardingPage1Color,
//       ),
//     ),
//     OnBoardingPageWidget(
//       model: OnBoardingModel(
//         title: tOnbaordingTitle2,
//         image: tOnBoardingImage2,
//         subTitle: tOnbaordingSubTitle2,
//         counterText: tOnbaordingCounter2,
//         bgColor: tOnBoardingPage2Color,
//       ),
//     ),
//     OnBoardingPageWidget(
//       model: OnBoardingModel(
//         title: tOnbaordingTitle3,
//         image: tOnBoardingImage3,
//         subTitle: tOnbaordingSubTitle3,
//         counterText: tOnbaordingCounter3,
//         bgColor: tOnBoardingPage3Color,
//       ),
//     ),
//   ];

//   skip() => controller.jumpToPage(page: 2);
//   animateToNextSlide() {
//     int nextPage = controller.currentPage + 1;
//     controller.animateToPage(page: nextPage);
//   }

//   onPageChangedCallback(int activePageIndex) =>
//       currentPage.value = activePageIndex;
// }
