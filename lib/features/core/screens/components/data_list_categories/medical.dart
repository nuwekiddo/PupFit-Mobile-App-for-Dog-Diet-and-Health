// ignore_for_file: prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/pages/training_clinic_1.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/pages/vet_clinic.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/pages/vet_clinic_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class Medical extends StatefulWidget {
  const Medical({super.key});

  @override
  State<Medical> createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(PhosphorIcons.arrow_left),
          color: tPrimaryColor,
        ),
        title: Text('Medical', style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          MedicalList(
              title: 'Annual Health Check',
              onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Blood Test', onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Blood Transfusion',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Confinement', onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Consultation', onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Dental Cleaning and Extractions',
              onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Deworming', onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Emergency and Critical Care',
              onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Ehrlichia or Allergy Test',
              onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Fecal Analysis',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Flourescein Test',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Hematology and Bio Chemistry',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Hospitalisation',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'House Call Visits',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Microchip Implantation',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Neutering or De-Sexing',
              onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Parvo/Distemper/Lepto/Heartworm',
              onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Pet Hotel',
              onPress: () => Get.to(() => TrainingClinic2())),
          MedicalList(
              title: 'Pet Export', onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Schirmer Tear Test',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Soft Tissue Surgery',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Ultrasound or X-Ray',
              onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Urine Analysis',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Vaccination', onPress: () => Get.to(() => VetClinic())),
          MedicalList(
              title: 'Vaginal Smear',
              onPress: () => Get.to(() => VetClinic1())),
          MedicalList(
              title: 'Urine Analysis',
              onPress: () => Get.to(() => VetClinic1())),
        ],
      ),
    );
  }
}

class MedicalList extends StatelessWidget {
  const MedicalList({
    Key? key,
    required this.title,
    required this.onPress,
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
          title: Text(title, style: Theme.of(context).textTheme.bodyText1),
          trailing: Icon(PhosphorIcons.arrow_right_light),
          onTap: onPress,
        ),
      ),
    );
  }
}
