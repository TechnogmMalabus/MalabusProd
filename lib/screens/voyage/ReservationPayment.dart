import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:malabus1/model/voyage.dart';
import '../../services/UserService.dart';
class ReservationPayment extends StatefulWidget {
  @override
  State<ReservationPayment> createState() => _ReservationPaymentState();
}

class _ReservationPaymentState extends State<ReservationPayment> {
  bool? _masterCard = false;
  bool? _VisaCard = false;
  bool? _eDinar = false;
  String error = "";


  @override
  void initState() {

    super.initState();
  }

  void getUserProfil() async {
    final DataV = ModalRoute.of(context)!.settings.arguments as Voyage ;
    var rsp = await getProfil();


    if (rsp.statusCode == 200) {
      var convertedJson = json.decode(rsp.body);

          var  rspIns = await SetReserve( convertedJson['fname'],   convertedJson['lname'],  convertedJson['phoneNum'], convertedJson['email'], DataV.Nbrtickets, DataV.id);
          var  convertedjason2 = json.decode(rspIns.body);
          if(rspIns.statusCode == 200){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Ok"),
                  titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  content: const Text("your reservation  has been succes"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),

                    ),
                  ],
                );
              },
            );

          }










    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFFFFFF),
          title: const Center(
            child: Text(
              "Paiement",
              style: TextStyle(color: Color(0xFF4C4C4C)),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu_outlined),
              color: Color(0xFFCFD0CF),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFCFD0CF),
              ),
              onPressed: () {
                // Do something.
              })),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              "Details de paiement",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF19184A)),
            )),
            const SizedBox(
              height: 5,
            ),
            const Center(
                child: Text(
              "Cette transaction est sécurisée par chiffrement de bout en bout.",
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF727373)),
            )),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: 315,
              height: 359.1,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 7, // soften the shadow
                    spreadRadius: 5, //extend the shadow
                    offset: const Offset(
                      1.0, // Move to right 10  horizontally
                      1.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text("Selectionnez votre carte"),
                  ),
                  CheckboxListTile(
                      value: _masterCard,
                      title: const Text("Master card"),
                      secondary: Image.asset(
                        "assets/images/mastercard.png",
                        width: 28,
                        height: 22,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _masterCard = value;
                          _eDinar = false;
                          _VisaCard = false;
                        });
                      }),
                  CheckboxListTile(
                      value: _VisaCard,
                      title: const Text("Visa card"),
                      secondary: Image.asset(
                        "assets/images/mastercard.png",
                        width: 28,
                        height: 22,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _VisaCard = value;
                          _eDinar = false;
                          _masterCard = false;
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

