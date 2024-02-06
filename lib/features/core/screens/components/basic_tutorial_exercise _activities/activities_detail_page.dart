// ignore_for_file: prefer_const_constructors

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/basic_tutorial_exercise%20_activities/common_activities_list_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class ActivitiesDetailPage extends StatefulWidget {
  final int commActId;
  const ActivitiesDetailPage({super.key, required this.commActId});

  @override
  State<ActivitiesDetailPage> createState() => _ActivitiesDetailPageState();
}

List<CommonActivities> _actList = CommonActivities.commonAct1;

class _ActivitiesDetailPageState extends State<ActivitiesDetailPage> {
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
          title: Text(_actList[widget.commActId].title,
              style: Theme.of(context).textTheme.headline2),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 330,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image.asset(_actList[widget.commActId].image)),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.58,
                maxChildSize: 1.0,
                minChildSize: 0.58,
                builder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: tPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 25,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 5,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: tBlackColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            _actList[widget.commActId].title,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 12),
                          Text(
                            _actList[widget.commActId].categ,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          // Row(children: [],)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Divider(height: 4, thickness: 1),
                          ),
                          Text(
                            "Benefits",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 10),
                          Text(
                            _actList[widget.commActId].benefits,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Divider(height: 4, thickness: 1),
                          ),
                          Text(
                            'Routine',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(PhosphorIcons.circle_fill,
                                        color: tBlackColor.withOpacity(0.3),
                                        size: 12),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            _actList[widget.commActId].step1)),
                                  ],
                                ),
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    Icon(PhosphorIcons.circle_fill,
                                        color: tBlackColor.withOpacity(0.3),
                                        size: 12),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            _actList[widget.commActId].step2)),
                                  ],
                                ),
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    Icon(PhosphorIcons.circle_fill,
                                        color: tBlackColor.withOpacity(0.3),
                                        size: 12),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            _actList[widget.commActId].step3)),
                                  ],
                                ),
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    Icon(PhosphorIcons.circle_fill,
                                        color: tBlackColor.withOpacity(0.3),
                                        size: 12),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            _actList[widget.commActId].step4)),
                                  ],
                                ),
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    Icon(PhosphorIcons.circle_fill,
                                        color: tBlackColor.withOpacity(0.3),
                                        size: 12),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            _actList[widget.commActId].step5)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ));
  }

  steps(BuildContext context) {}
}
