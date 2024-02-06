// ignore_for_file: prefer_const_constructors, unused_local_variable, camel_case_types, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, must_be_immutable, prefer_final_fields, unused_field
import 'dart:io';
import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/constants/text_strings.dart';
import 'package:dog_care/features/core/screens/components/profile_update/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../constants/sizes.dart';

class UpdateProfile extends StatelessWidget {
  final dynamic data;
  const UpdateProfile({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    controller.nameController.text = data['fullName'];
    controller.passController.text = data['password'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(PhosphorIcons.arrow_left),
          color: tPrimaryColor,
        ),
        title:
            Text('Edit Profile', style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () => (SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(children: [
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Align(
                      alignment: Alignment(-0.5, -0.2),
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: data['imgUrl'] == '' &&
                                  controller.profileImgPath.isEmpty
                              ? Image.asset(
                                  'assets/images/dog3d.png',
                                  fit: BoxFit.cover,
                                )

                              // data not empty , controller path empty
                              : data['imgUrl'] != '' &&
                                      controller.profileImgPath.isEmpty
                                  ? Image.network(
                                      data['imgUrl'],
                                      fit: BoxFit.cover,
                                    )

                                  // controller path not empty, data empty
                                  : Image.file(
                                      File(controller.profileImgPath.value),
                                      fit: BoxFit.cover,
                                    ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor),
                      child: IconButton(
                        icon: Icon(PhosphorIcons.camera),
                        padding: EdgeInsets.all(4),
                        onPressed: () {
                          controller.changeImage(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.nameController,
                      decoration: InputDecoration(
                          label: Text(tFullName),
                          prefixIcon: Icon(PhosphorIcons.user)),
                    ),
                    SizedBox(height: tFormHeight),
                    TextFormField(
                      controller: controller.passController,
                      decoration: InputDecoration(
                          label: Text(tPassword),
                          prefixIcon: Icon(PhosphorIcons.password)),
                    ),
                    SizedBox(height: tFormHeight),
                    controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(tPrimaryColor),
                            ),
                          )
                        : Center(
                            child: updateProfileButton(
                              onPressed: () async {
                                controller.isLoading(true);
                                await controller.uploadProfileImage();
                                await controller.updateProfile(
                                    controller.nameController.text,
                                    controller.passController.text,
                                    controller.profileImageLink);
                                // ignore: use_build_context_synchronously
                                VxToast.show(context,
                                    msg: 'Profile Succesfully Updated');
                                Get.back();
                              },
                            ),
                          )
                  ],
                ),
              )
            ]),
          ),
        )),
      ),
    );
  }
}

class updateProfileButton extends StatelessWidget {
  const updateProfileButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: tPrimaryColor,
          side: BorderSide.none,
          shape: StadiumBorder(),
        ),
        child: Text('Edit Profile'),
      ),
    );
  }
}
