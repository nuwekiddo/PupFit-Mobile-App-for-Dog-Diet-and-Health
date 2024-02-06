// ignore_for_file: prefer_const_constructors

import 'package:google_maps_flutter/google_maps_flutter.dart';

class VeterinaryClinic {
  int vetID;
  String name;
  String location;
  String city;
  String desc;
  String imgUrl;
  String rating;
  String facebookMessenger;
  int phoneNum;
  LatLng langlong;

  VeterinaryClinic({
    required this.vetID,
    required this.name,
    required this.desc,
    required this.phoneNum,
    required this.facebookMessenger,
    required this.location,
    required this.city,
    required this.langlong,
    required this.imgUrl,
    required this.rating,
  });

  static List<VeterinaryClinic> veterinaryList = [
    VeterinaryClinic(
      vetID: 0,
      name: 'Oasis Animal Clinic And Grooming Center',
      location: 'Pres J P Laurel Highway, Darasa, Tanauan, Philippines',
      imgUrl: 'assets/images/oasis-main.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.078498312899997, 121.15106452265735),
      phoneNum: 09055666095,
      facebookMessenger: 'https://facebook.com/100087672823176',
      city: 'Tanauan City, Batangas',
      desc:
          'At OASIS ANIMAL CLINIC, we provide a variety of veterinary services for pets of all ages.',
    ),
    VeterinaryClinic(
      vetID: 1,
      name: 'RL Animal Clinic',
      location:
          '168 Unit A Bus Stop JP Laurel Hiway cor. V Dimayuga St. Brgy. 4 Tanauan City Batangas',
      imgUrl: 'assets/images/rl.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.086248791688583, 121.1493859738641),
      phoneNum: 09166215953,
      facebookMessenger: 'https://facebook.com/RLanimalclinic',
      city: 'Tanauan City, Batangas',
      desc:
          'Professional vet, pet grooming and pet supplies for your fur babies',
    ),
  ];

  static List<VeterinaryClinic> veterinaryList1 = [
    VeterinaryClinic(
      vetID: 0,
      name: 'Oasis Animal Clinic And Grooming Center',
      location: 'Pres J P Laurel Highway, Darasa, Tanauan, Philippines',
      imgUrl: 'assets/images/oasis-main.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.078498312899997, 121.15106452265735),
      phoneNum: 09055666095,
      facebookMessenger: 'https://facebook.com/100087672823176',
      city: 'Tanauan City, Batangas',
      desc:
          'At OASIS ANIMAL CLINIC, we provide a variety of veterinary services for pets of all ages.',
    ),
  ];

  static List<VeterinaryClinic> veterinaryList2 = [
    VeterinaryClinic(
      vetID: 0,
      name: 'RL Animal Clinic',
      location:
          '168 Unit A Bus Stop JP Laurel Hiway cor. V Dimayuga St. Brgy. 4 Tanauan City Batangas',
      imgUrl: 'assets/images/rl.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.086248791688583, 121.1493859738641),
      phoneNum: 09166215953,
      facebookMessenger: 'https://facebook.com/RLanimalclinic',
      city: 'Tanauan City, Batangas',
      desc:
          'Professional vet, pet grooming and pet supplies for your fur babies',
    ),
  ];

  static List<VeterinaryClinic> trainingList = [
    VeterinaryClinic(
      vetID: 0,
      name: 'ALLUZ K9',
      location: '43Q5+CR5, Tanauan, Batangas',
      imgUrl: 'assets/images/alluzk9.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.13805780513831, 121.06010663405401),
      phoneNum: 09771717535,
      facebookMessenger: 'https://www.facebook.com/AlluzK9',
      city: 'Tanauan City, Batangas',
      desc: 'Safety and Health is our #1 Priority',
    ),
  ];

  static List<VeterinaryClinic> trainingList2 = [
    VeterinaryClinic(
      vetID: 1,
      name: 'ALLUZ K9',
      location: '43Q5+CR5, Tanauan, Batangas',
      imgUrl: 'assets/images/alluzk9.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.13805780513831, 121.06010663405401),
      phoneNum: 09771717535,
      facebookMessenger: 'https://www.facebook.com/AlluzK9',
      city: 'Tanauan City, Batangas',
      desc: 'Safety and Health is our #1 Priority',
    ),
    VeterinaryClinic(
      vetID: 0,
      name: 'Oasis Animal Clinic And Grooming Center',
      location: 'Pres J P Laurel Highway, Darasa, Tanauan, Philippines',
      imgUrl: 'assets/images/oasis-main.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.078498312899997, 121.15106452265735),
      phoneNum: 09055666095,
      facebookMessenger: 'https://facebook.com/100087672823176',
      city: 'Tanauan City, Batangas',
      desc:
          'At OASIS ANIMAL CLINIC, we provide a variety of veterinary services for pets of all ages.',
    ),
  ];

  static List<VeterinaryClinic> veterinaryListAll = [
    VeterinaryClinic(
      vetID: 0,
      name: 'Oasis Animal Clinic And Grooming Center',
      location: 'Pres J P Laurel Highway, Darasa, Tanauan, Philippines',
      imgUrl: 'assets/images/oasis-main.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.078498312899997, 121.15106452265735),
      phoneNum: 09055666095,
      facebookMessenger: 'https://facebook.com/100087672823176',
      city: 'Tanauan City, Batangas',
      desc:
          'At OASIS ANIMAL CLINIC, we provide a variety of veterinary services for pets of all ages.',
    ),
    VeterinaryClinic(
      vetID: 1,
      name: 'RL Animal Clinic',
      location:
          '168 Unit A Bus Stop JP Laurel Hiway cor. V Dimayuga St. Brgy. 4 Tanauan City Batangas',
      imgUrl: 'assets/images/rl.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.086248791688583, 121.1493859738641),
      phoneNum: 09166215953,
      facebookMessenger: 'https://facebook.com/RLanimalclinic',
      city: 'Tanauan City, Batangas',
      desc:
          'Professional vet, pet grooming and pet supplies for your fur babies',
    ),
    VeterinaryClinic(
      vetID: 2,
      name: 'ALLUZ K9',
      location: '43Q5+CR5, Tanauan, Batangas',
      imgUrl: 'assets/images/alluzk9.jpg',
      rating: '4.0 ',
      langlong: LatLng(14.13805780513831, 121.06010663405401),
      phoneNum: 09771717535,
      facebookMessenger: 'https://www.facebook.com/AlluzK9',
      city: 'Tanauan City, Batangas',
      desc: 'Safety and Health is our #1 Priority',
    ),
  ];
}
