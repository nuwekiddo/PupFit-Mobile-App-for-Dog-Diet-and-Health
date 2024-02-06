// ignore_for_file: must_be_immutable, unused_element, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_adjacent_string_concatenation, camel_case_types, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_care/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class DogDetailPages extends StatefulWidget {
  DogDetailPages({
    required this.data,
    required this.ref,
    super.key,
  });

  final Map data;
  final DocumentReference ref;
  // QueryDocumentSnapshot doc;
  // DocumentSnapshot docId;

  @override
  State<DogDetailPages> createState() => _DogDetailPagesState();
}

// var controller = Get.put(PetController());

class _DogDetailPagesState extends State<DogDetailPages> {
  @override
  Widget build(BuildContext context) {
    //Condition
    String _message = 'No Height found or Invalid Height';

    void _suggestedCalorioes() {
      if ("${widget.data['dogHeight']}" == null) {
        setState(() {
          _message = "Your height and weight must be positive numbers";
        });
        return;
      }
    }

    setState(
      () {
        var _height = double.parse("${widget.data['dogHeight']}");
        if (_height < 39) {
          _message = '139 - 231 calories per day.';
        } else if (_height < 50) {
          _message = '342 - 576 calories per day.';
        } else if (_height < 68.58) {
          _message = '782 - 1145 calories per day.';
        } else if (_height < 110) {
          _message = '1313 - 1926 calories per day.';
        }
      },
    );

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color: tGreyColor),
                          ),
                          child: Icon(
                            PhosphorIcons.arrow_left,
                            size: 24,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await widget.ref.delete();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: tPrimaryColor,
                              elevation: 6.0,
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Dog Deleted',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          );
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color: tGreyColor),
                          ),
                          child: Icon(
                            PhosphorIcons.trash,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * .25),

                  // ALL DATA INSIDE OF THE MID BOX
                  Container(
                    height: 380,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: tGreyColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // BOX HEADER CONTAIN INFO
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // widget.docId.get('dogBreed')
                                  "${widget.data['dogBreed']}",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Icon(
                                      PhosphorIcons.cake,
                                      size: 24,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "${widget.data['dogAge']}" + ' years old',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2, color: tGreyColor),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                "${widget.data['dogGender']}" == 'Male'
                                    ? PhosphorIcons.gender_male
                                    : PhosphorIcons.gender_female,
                                color: tPrimaryColor,
                                size: 24,
                              ),
                            ),
                          ],
                        ),

                        // BOX INFO
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // DATA BOX
                            doxBox(
                              label: 'Height',
                              data: "${widget.data['dogHeight']}" + ' cm',
                            ),
                            doxBox(
                              label: 'Weight',
                              data: "${widget.data['dogWeight']}" + ' lbs',
                            ),
                            doxBox(
                              label: 'Birthdate',
                              data: "${widget.data['dogBdate']}",
                            ),
                          ],
                        ),

                        // TITLE TEXT
                        Text(
                          'Pet Description',
                          style: Theme.of(context).textTheme.headline2,
                        ),

                        // DOG TAG
                        Container(
                          height: 75,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: tGreyColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${widget.data['dogTag']}",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'Rabies Tag',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // Suggested Calories
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 75,
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: tGreyColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Suggested Calories",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Text(
                                    _message,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

              // IMAGE
              Positioned(
                top: 20,
                left: size.width / 2 - 120,
                child: Container(
                  height: 350,
                  width: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: tPrimaryColor,
                    border: Border.all(width: 2, color: tGreyColor),
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    width: 200,
                    height: 250,
                    child: Align(
                      alignment: Alignment(-0.5, -0.2),
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage(
                            'assets/images/dog3d.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class doxBox extends StatelessWidget {
  const doxBox({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);
  final String label;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: tGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data,
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
