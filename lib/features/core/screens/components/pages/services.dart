// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/basic_tutorial_exercise%20_activities/activities.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/veterinaries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.0),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                _itemWidget(
                  title: 'Veterinary Clinic And Pet Training',
                  details:
                      'Veterinary Services and Trining helps our pets for development and used to care and treat our small animals',
                  image: 'assets/icons/veterinarian.jpg',
                  onPress: () => Get.to(() => Vaterinaries()),
                ),
                Divider(height: 20),
                _itemWidget(
                  title: 'Dogs Activities',
                  details:
                      'Pet activities are beneficial to both the animal and the pet owner, as they provide exercise, mental stimulation, and socialization.',
                  image: 'assets/icons/dogtraining.jpg',
                  onPress: () => Get.to(() => DogActivities()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _itemWidget extends StatelessWidget {
  const _itemWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.onPress,
    required this.details,
  }) : super(key: key);

  final String title;
  final String details;
  final String image;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: tPrimaryColor,
            ),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        details,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Icon(
                    PhosphorIcons.arrow_right,
                    size: 15,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
