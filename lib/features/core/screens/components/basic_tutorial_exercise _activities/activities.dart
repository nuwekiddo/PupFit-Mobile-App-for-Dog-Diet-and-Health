// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/basic_tutorial_exercise%20_activities/activities_detail_page.dart';
import 'package:dog_care/features/core/screens/components/basic_tutorial_exercise%20_activities/common_activities_list_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class DogActivities extends StatefulWidget {
  const DogActivities({super.key});

  @override
  State<DogActivities> createState() => _DogActivitiesState();
}

List<CommonActivities> _actList = CommonActivities.commonAct1;

class _DogActivitiesState extends State<DogActivities> {
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
        title: Text('Activities for your Dogs',
            style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _actList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(() => ActivitiesDetailPage(
                      commActId: _actList[index].commActId,
                    )),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            height: 120,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(_actList[index].cover),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 15),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _actList[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  _actList[index].desc,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      _actList[index].categ,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    Icon(
                                      PhosphorIcons.dog_fill,
                                      size: 15,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 70),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        PhosphorIcons.arrow_right,
                                        size: 15,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: tPrimaryColor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
