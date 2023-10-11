import 'package:flutter/material.dart';
import '/screens/voyage/Map.dart';
import 'screens/user/LoginUser.dart';
import 'screens/Signup.dart';
import 'screens/user/ForgetPassword.dart';
import 'package:malabus1/screens/Home.dart';
import 'package:malabus1/screens/Login.dart';
import 'screens/agence/ForgetPasswordAgence.dart';
import 'screens/user/Profil.dart';
import 'screens/user/UpdateProfil.dart';
import 'screens/voyage/Findvoyage.dart';
import 'screens/voyage/VoyageCard.dart';
import 'screens/voyage/VoyageDetails.dart';
import 'screens/voyage/VoyageDetails2.dart';
import 'screens/voyage/ReservationPayment.dart';
import 'screens/voyage/VoyageList.dart';
import 'screens/voyage/Details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final DateTime expirationDate = DateTime(2025, 09, 17);
  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final isExpired = currentDate.isAfter(expirationDate);

    return isExpired ? Center(child: Text("your app is expired"),):  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/signup": (BuildContext context) {
          return ToggleButtons1();
        },
        "/home": (BuildContext context) {
          return Home();
        },
        "/forgetpassword": (BuildContext context) {
          return ForgetPassword();
        },
        "/login": (BuildContext context) {
          return Login();
        },
        "/forgetpasswordAgence": (BuildContext context) {
          return ForgetPasswordAgence();
        },
        "/profil": (BuildContext context) {
          return Profile();
        },
        "/updateprofil": (BuildContext context) {
          return UpdateProfile();
        },
        "/listvoyage": (BuildContext context) {
          return VoyageList();
        },
        "/map": (BuildContext context) {
          return Map();
        },
        "/payer": (BuildContext context) {
          return ReservationPayment();
        }
      },
      home: //Details()
          //ReservationPayment(),
          //VoyageurCommande(),
          //VoyageDetails(),
          //VoyageCard(),
          //FindVoyage(),
          //Home(),
          // Map()
          Login(),
      //home: Profile(),
      //home: Home(),
    );
  }
}


