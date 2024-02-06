// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/pages/vet_clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class Grooming extends StatefulWidget {
  const Grooming({super.key});

  @override
  State<Grooming> createState() => _GroomingState();
}

class _GroomingState extends State<Grooming> {
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
        title: Text('Grooming', style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          groomingNeeds(
              title: 'Fur Trimming', onPress: () => Get.to(() => VetClinic())),
          groomingNeeds(
              title: 'Nail Trimming', onPress: () => Get.to(() => VetClinic())),
          groomingNeeds(
              title: 'Teeth Brushing',
              onPress: () => Get.to(() => VetClinic())),
          groomingNeeds(
              title: 'Bathing', onPress: () => Get.to(() => VetClinic())),
          groomingNeeds(
              title: 'Ear Care', onPress: () => Get.to(() => VetClinic())),
        ],
      ),
    );
  }
}

class groomingNeeds extends StatelessWidget {
  const groomingNeeds({
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
