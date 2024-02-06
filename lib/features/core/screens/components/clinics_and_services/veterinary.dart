// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/vet_detail_page.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/veterinary_clinic_list_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VeterinaryPage extends StatefulWidget {
  const VeterinaryPage({super.key});

  @override
  State<VeterinaryPage> createState() => _VeterinaryPageState();
}

class _VeterinaryPageState extends State<VeterinaryPage> {
  List<VeterinaryClinic> _vetList = VeterinaryClinic.veterinaryListAll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: _vetList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    Get.to(() => VetDetailPage(vetID: _vetList[index].vetID)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(_vetList[index].imgUrl),
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
                                    _vetList[index].name,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Text(
                                    _vetList[index].location,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.yellow.withOpacity(0.5),
                              child: Text(
                                _vetList[index].rating,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
