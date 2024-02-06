// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DogAdd extends StatefulWidget {
  // final dynamic data;
  const DogAdd({
    super.key,
  });

  @override
  State<DogAdd> createState() => _DogAddState();
}

class _DogAddState extends State<DogAdd> {
  // Controllers
  var _dogName = TextEditingController();
  var _breed = TextEditingController();
  var _age = TextEditingController();
  var _gender = TextEditingController();
  var _height = TextEditingController();
  var _weight = TextEditingController();
  var _birthDate = TextEditingController();
  var _tag = TextEditingController();

  @override
  void dispose() {
    _dogName.dispose();
    _breed.dispose();
    _age.dispose();
    _gender.dispose();
    _height.dispose();
    _weight.dispose();
    _birthDate.dispose();
    _tag.dispose();
    super.dispose();
  }

  // GENDER
  static const List<String> genderList = <String>[
    'Male',
    'Female',
  ];

  // DOG BREED
  static const List<String> breedList = <String>[
    'Beagle',
    'Chihuahua',
    'Chow Chow',
    'Dalmatian',
    'Doberman Pinscher',
    'German Shepherd',
    'Golden Retriever',
    'Labrador Retriever',
    'Pomeranian',
    'Poodle',
    'Pug',
    'Shih-Tzu',
    'Siberian Husky',
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // DOG ADD REF DB
    void addDog() {
      //Dog REf
      CollectionReference ref = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('pets');

      var data = {
        'dogName': _dogName.text,
        'dogBreed': _breed.text,
        'dogAge': _age.text,
        'dogHeight': _height.text,
        'dogWeight': _weight.text,
        'dogGender': _gender.text,
        'dogBdate': _birthDate.text,
        'dogTag': _tag.text,
      };

      ref.add(data);
      Get.back();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(PhosphorIcons.arrow_left),
          color: tPrimaryColor,
        ),
        title: Text(
          'Add Dog',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage('assets/images/dog3d.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: tFormHeight),

            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  //dog Name
                  TextFormField(
                    controller: _dogName,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Dog Name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Dog Name',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      hintText: 'Dog Name',
                      prefixIcon: Icon(PhosphorIcons.dog),
                    ),
                  ),
                  SizedBox(height: tFormHeight),

                  // Breed
                  TypeAheadFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Dog Breed';
                      } else {
                        return null;
                      }
                    },
                    onSuggestionSelected: (String val) {
                      _breed.text = val;
                    },
                    itemBuilder: (_, String item) => ListTile(
                      title: Text(item),
                    ),
                    suggestionsCallback: (pattern) => breedList.where(
                      (item) =>
                          item.toLowerCase().contains(pattern.toLowerCase()),
                    ),
                    getImmediateSuggestions: true,
                    hideSuggestionsOnKeyboardHide: true,
                    hideOnEmpty: false,
                    noItemsFoundBuilder: (value) {
                      return Text('');
                    },
                    textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          labelText: 'Dog Breed',
                          hintText: 'Dog Breed',
                          prefixIcon: Icon(
                            PhosphorIcons.paw_print,
                            color: tPrimaryColor,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        controller: _breed),
                  ),
                  SizedBox(height: tFormHeight),

                  // Age
                  TextFormField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Dog Age';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Age',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      hintText: 'Age',
                      prefixIcon: Icon(PhosphorIcons.cake),
                    ),
                  ),
                  SizedBox(height: tFormHeight),

                  // Height
                  TextFormField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Dog Height';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Dog Height',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      hintText: 'cm',
                      prefixIcon: Icon(PhosphorIcons.ruler),
                    ),
                  ),
                  SizedBox(height: tFormHeight),

                  // Weight
                  TextFormField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Dog Weight';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Dog Weight',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      hintText: 'lbs',
                      prefixIcon: Icon(PhosphorIcons.scales),
                    ),
                  ),
                  SizedBox(height: tFormHeight),

                  // Gender
                  TypeAheadFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Dog Gender';
                      } else {
                        return null;
                      }
                    },
                    onSuggestionSelected: (String val) {
                      _gender.text = val;
                    },
                    itemBuilder: (_, String item) => ListTile(
                      title: Text(item),
                    ),
                    suggestionsCallback: (pattern) => genderList.where(
                      (item) =>
                          item.toLowerCase().contains(pattern.toLowerCase()),
                    ),
                    getImmediateSuggestions: true,
                    hideSuggestionsOnKeyboardHide: true,
                    hideOnEmpty: false,
                    noItemsFoundBuilder: (value) {
                      return Text('');
                    },
                    textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          labelText: 'Dog Gender',
                          hintText: 'Dog Gender',
                          prefixIcon: Icon(
                            PhosphorIcons.gender_intersex,
                            color: tPrimaryColor,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        controller: _gender),
                  ),
                  SizedBox(height: tFormHeight),

                  // Birthdate
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Dog Birthdate';
                      } else {
                        return null;
                      }
                    },
                    controller: _birthDate,
                    decoration: InputDecoration(
                      label: Text(
                        'Dog Birthdate',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      hintText: 'Select Date',
                      prefixIcon: Icon(PhosphorIcons.calendar_blank),
                    ),
                    onTap: () async {
                      DateTime? picker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1967),
                          lastDate: DateTime(2031));

                      if (picker != null) {
                        setState(() {
                          _birthDate.text =
                              DateFormat('MM-dd-yyyy').format(picker);
                        });
                      }
                    },
                  ),
                  SizedBox(height: tFormHeight),

                  // Rabies Tag
                  TextFormField(
                    controller: _tag,
                    decoration: InputDecoration(
                      label: Text('Rabies Tag'),
                      hintText: 'Optional',
                      prefixIcon: Icon(PhosphorIcons.tag),
                    ),
                  ),
                  SizedBox(height: tFormHeight),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: tPrimaryColor,
                              elevation: 6.0,
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Dog Added',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          );
                          addDog();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tPrimaryColor,
                        side: BorderSide.none,
                        shape: StadiumBorder(),
                      ),
                      child: Text('Add Dog'),
                    ),
                  ),
                  SizedBox(height: tFormHeight),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
