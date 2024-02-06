// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/pages/training_clinic.dart';
import 'package:flutter/material.dart';

import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(PhosphorIcons.arrow_left),
          color: tPrimaryColor,
        ),
        title: Text('Training', style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          trainingNeeds(
              title: 'Advanced Obedience',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'Basic Obedience',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'Boarding with Training',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'Dog Psychology Class',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'Fixing ANY Unwanted Behavior Issues',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'Home Service',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'Owner Training',
              onPress: () => Get.to(() => TrainingClinic())),
          Divider(),
          trainingNeeds(
              title: 'K9 Training',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'K9 Training - Basic Sniffing (NOT for Security Agencies)',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'K9 Training - Detection (NOT for Security Agencies)',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'K9 Training - Family Protection Dog (Bite Work)',
              onPress: () => Get.to(() => TrainingClinic())),
          trainingNeeds(
              title: 'K9 Training - Tracking',
              onPress: () => Get.to(() => TrainingClinic())),
        ],
      ),
    );
  }
}

class trainingNeeds extends StatelessWidget {
  const trainingNeeds({
    Key? key,
    required this.title,
    this.onPress,
  }) : super(key: key);

  final String title;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: Icon(PhosphorIcons.arrow_right_light),
          onTap: onPress,
        ),
      ),
    );
  }
}
