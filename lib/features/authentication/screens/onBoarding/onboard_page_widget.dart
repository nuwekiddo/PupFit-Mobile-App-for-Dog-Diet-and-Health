// // ignore_for_file: prefer_const_constructors

// import 'package:dog_final/src/constants/sizes.dart';
// import 'package:flutter/material.dart';

// import '../../models/onboarding_models.dart';

// class OnBoardingPageWidget extends StatelessWidget {
//   const OnBoardingPageWidget({
//     Key? key,
//     required this.model,
//   }) : super(key: key);

//   final OnBoardingModel model;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       padding: const EdgeInsets.all(tDefaultSize),
//       color: model.bgColor,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image(
//             image: AssetImage(model.image),
//             height: size.height * 0.4,
//           ),
//           Column(
//             children: [
//               Text(model.title, style: Theme.of(context).textTheme.headline3),
//               Text(model.subTitle, textAlign: TextAlign.center),
//             ],
//           ),
//           Text(model.counterText, style: Theme.of(context).textTheme.headline6),
//           SizedBox(
//             height: 10.0,
//           )
//         ],
//       ),
//     );
//   }
// }
