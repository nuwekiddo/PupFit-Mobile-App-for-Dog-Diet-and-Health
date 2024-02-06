// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_local_variable, camel_case_types, prefer_adjacent_string_concatenation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/components/data_list_categories/breeding.dart';
import 'package:dog_care/features/core/screens/components/data_list_categories/grooming.dart';
import 'package:dog_care/features/core/screens/components/data_list_categories/medical.dart';
import 'package:dog_care/features/core/screens/components/data_list_categories/training.dart';
import 'package:dog_care/features/core/screens/components/dog_tile/detail_page_main.dart';
import 'package:dog_care/features/core/screens/components/dog_tile/dogAdd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Databse Ref
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('pets');

    String isMale = 'Male';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Widget
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        categoryWidget(
                          categName: 'Breeding',
                          categImage: 'assets/icons/breed.png',
                          onPress: () => Get.to(() => Breeding()),
                        ),
                        categoryWidget(
                          categName: 'Grooming',
                          categImage: 'assets/icons/grooming.png',
                          onPress: () => Get.to(() => Grooming()),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        categoryWidget(
                          categName: 'Training',
                          categImage: 'assets/icons/dogwalk.png',
                          onPress: () => Get.to(() => Training()),
                        ),
                        categoryWidget(
                          categName: 'Medical',
                          categImage: 'assets/icons/medkit.png',
                          onPress: () => Get.to(() => Medical()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Add
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: GestureDetector(
                onTap: () => Get.to(() => DogAdd())!.then((value) {
                  print('Calling State');
                  setState(() {});
                }),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    backgroundBlendMode: BlendMode.screen,
                    border: Border.all(color: tPrimaryColor),
                    color: tPrimaryColor,
                  ),
                  child: Icon(
                    PhosphorIcons.plus_bold,
                    size: 24,
                  ),
                ),
              ),
            ),

            // Text
            Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Dog',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),

            // DOG DATA LIST
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                  future: ref.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map data = snapshot.data!.docs[index].data() as Map;
                          return GestureDetector(
                            onTap: () => Get.to(() => DogDetailPages(
                                    data: data,
                                    ref: snapshot.data!.docs[index].reference))!
                                .then((value) {
                              setState(() {});
                            }),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 15.0,
                                  right: 20.0,
                                  left: 20.0,
                                ),
                                child: Stack(
                                  children: [
                                    Material(
                                      borderRadius: BorderRadius.circular(20),
                                      elevation: 7.0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: size.width * 0.4),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                            "${data['dogName']}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8.0),
                                                  Text("${data['dogBreed']}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4),
                                                  SizedBox(height: 8.0),
                                                  Text(
                                                      "${data['dogAge']}" +
                                                          ' Years Old',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  SizedBox(height: 8.0),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                          "${data['dogGender']}" ==
                                                                  isMale
                                                              ? PhosphorIcons
                                                                  .gender_male
                                                              : PhosphorIcons
                                                                  .gender_female,
                                                          color: tPrimaryColor,
                                                          size: 16),
                                                      SizedBox(width: 6.0),
                                                      Text(
                                                          "${data['dogGender']}",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // DELETE ENTRY
                                          ],
                                        ),
                                      ),
                                    ),

                                    // Image BG
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 0,
                                                blurRadius: 6,
                                                offset: Offset(0,
                                                    2), // changes position of shadow
                                              ),
                                            ],
                                            color: tPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          height: 155,
                                          width: size.width * 0.4,
                                        ),
                                        //Image
                                        Image(
                                          image: AssetImage(
                                              'assets/images/dog3d.png'),
                                          height: 155,
                                          width: size.width * 0.4,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('Loading...'),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// WIDGET
class categoryWidget extends StatelessWidget {
  const categoryWidget({
    Key? key,
    required this.categName,
    required this.categImage,
    required this.onPress,
  }) : super(key: key);

  final String categName;
  final String categImage;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 70,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: tPrimaryColor.withOpacity(.3),
                ),
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      categImage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categName,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Delete Data
// void deleteData(id) {
//   firestore
//       .collection(usersCollection)
//       .doc(currentUser!.uid)
//       .collection('pets')
//       .doc(id)
//       .delete();
//   Fluttertoast.showToast(msg: "DELETED");
// }
