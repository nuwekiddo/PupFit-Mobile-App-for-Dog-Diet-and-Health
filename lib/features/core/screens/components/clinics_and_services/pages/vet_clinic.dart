// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, sort_child_properties_last, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/vet_detail_page.dart';
import 'package:dog_care/features/core/screens/components/clinics_and_services/veterinary_clinic_list_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class VetClinic extends StatefulWidget {
  const VetClinic({super.key});

  @override
  State<VetClinic> createState() => _VetClinicState();
}

class _VetClinicState extends State<VetClinic> {
  @override
  Widget build(BuildContext context) {
    List<VeterinaryClinic> _vetList = VeterinaryClinic.veterinaryList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(PhosphorIcons.arrow_left),
          color: tPrimaryColor,
        ),
        title: Text('Veterinary Clinics',
            style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        child: ListView.builder(
          itemCount: _vetList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  Get.to(() => VetDetailPage(vetID: _vetList[index].vetID)),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 5,
                  bottom: 5,
                ),
                child: Card(
                  elevation: 7.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: AspectRatio(
                        aspectRatio: 2.7,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.asset(
                                    _vetList[index].imgUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width >= 360
                                          ? 12
                                          : 8,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _vetList[index].name,
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        Expanded(
                                            child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        PhosphorIcons.phone,
                                                        size: 16,
                                                      ),
                                                      SizedBox(width: 7),
                                                      Expanded(
                                                        child: Text(
                                                          _vetList[index].city,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                    ],
                                                  ),
                                                  Text(
                                                    _vetList[index].rating,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  RatingBarIndicator(
                                                    rating: 4.0,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      PhosphorIcons.star_fill,
                                                      color: Colors.yellow,
                                                    ),
                                                    itemCount: 5,
                                                    unratedColor: tGreyColor,
                                                    itemSize: 18.0,
                                                    direction: Axis.horizontal,
                                                  )
                                                ],
                                              ),
                                            ),
                                            FittedBox(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Icon(PhosphorIcons
                                                        .arrow_right)
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
