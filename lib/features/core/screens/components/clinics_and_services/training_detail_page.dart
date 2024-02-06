// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_final_fields, unnecessary_new, prefer_collection_literals, deprecated_member_use

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'veterinary_clinic_list_all.dart';

class TrainingDetailPage extends StatefulWidget {
  final int vetID;
  const TrainingDetailPage({
    super.key,
    required this.vetID,
  });

  @override
  State<TrainingDetailPage> createState() => _VetDetailPageState();
}

class _VetDetailPageState extends State<TrainingDetailPage> {
  //Google Map
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    List<VeterinaryClinic> _vetList = VeterinaryClinic.trainingList2;
    Size size = MediaQuery.of(context).size;

    //Dark Mode
    var brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;

    final Uri fbMessenger =
        Uri.parse(_vetList[widget.vetID].facebookMessenger.toString());
    final Uri phoneNum = Uri.parse(_vetList[widget.vetID].phoneNum.toString());

    //Info
    return Scaffold(
      backgroundColor: tPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(PhosphorIcons.arrow_left),
          color: tWhiteColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: 42,
                      left: tDashboardPadding,
                      right: tDashboardPadding,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: isDarkMode ? tSecondaryColor : tWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Call and Message
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Call
                            Row(
                              children: [
                                Container(
                                  height: 44,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: tPrimaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      launch('tel://$phoneNum');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(PhosphorIcons.phone_thin,
                                            size: 32),
                                        Text(' Call',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 55),
                            // Messenger
                            GestureDetector(
                              onTap: (() async {
                                launch(
                                  '$fbMessenger',
                                  // forceWebView: true,
                                  // forceSafariVC: true,
                                  // enableJavaScript: true,
                                  // enableDomStorage: true,
                                );
                              }),
                              child: Row(
                                children: [
                                  Container(
                                    height: 44,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: tPrimaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(PhosphorIcons.facebook_logo,
                                            size: 32),
                                        Text(' Facebook',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'About Us',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(height: 10),
                            Text(
                              _vetList[widget.vetID].desc,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        // Location GMap
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Location',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(height: tFormHeight + 10)
                          ],
                        ),
                        // GMAP
                        SizedBox(
                          height: 240,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _vetList[widget.vetID].langlong,
                              zoom: 16,
                            ),
                            gestureRecognizers:
                                <Factory<OneSequenceGestureRecognizer>>[
                              new Factory<OneSequenceGestureRecognizer>(
                                () => new EagerGestureRecognizer(),
                              ),
                            ].toSet(),
                            onMapCreated: (controller) {
                              mapController = controller;
                              addMarker(
                                  'final',
                                  _vetList[widget.vetID].name,
                                  _vetList[widget.vetID].location,
                                  _vetList[widget.vetID].langlong);
                            },
                            markers: _markers.values.toSet(),
                          ),
                        ),
                        SizedBox(height: tFormHeight),
                      ],
                    ),
                  ),

                  // Vet Top Design
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: tDashboardPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _vetList[widget.vetID].name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(_vetList[widget.vetID].rating,
                                style: Theme.of(context).textTheme.bodyText1),
                            Icon(PhosphorIcons.star_fill,
                                size: 15, color: Colors.yellow),
                          ],
                        ),
                        SizedBox(height: tDashboardCardPadding),
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(PhosphorIcons.map_pin_light,
                                          size: 15),
                                    ),
                                    TextSpan(
                                        text: 'Location:\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextSpan(
                                        text: _vetList[widget.vetID].location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: tDashboardPadding),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  _vetList[widget.vetID].imgUrl,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  addMarker(String id, title, snip, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: InfoWindow(title: title, snippet: snip),
    );

    _markers[id] = marker;
    setState(() {});
  }
}
