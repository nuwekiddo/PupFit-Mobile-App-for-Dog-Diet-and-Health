// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:dog_care/features/core/screens/components/clinics_and_services/pages/training_clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';

class Breeding extends StatefulWidget {
  const Breeding({super.key});

  @override
  State<Breeding> createState() => _BreedingState();
}

class _BreedingState extends State<Breeding> {
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
        title: Text('Breeding', style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          breedingNeeds(
              title: 'Breeding', onPress: () => Get.to(() => TrainingClinic())),
        ],
      ),
    );
  }
}

class breedingNeeds extends StatelessWidget {
  const breedingNeeds({
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
