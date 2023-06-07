import 'package:url_launcher/url_launcher.dart';
import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class SafeHome extends StatefulWidget {
  const SafeHome({super.key});

  @override
  State<SafeHome> createState() => _SafeHomeState();
}

class _SafeHomeState extends State<SafeHome> {
  Position? _currentPosition;
  String? _currentAddress;
  LocationPermission? permission;
  _getpermission() async {
    await [Permission.sms].request();
  }

  _isPermissionGranted() async {
    await Permission.sms.status.isGranted;
  }

  _sendSMS(String Number, String Message, {int? simSlot}) async {
    await BackgroundSms.sendMessage(
      phoneNumber: Number,
      message: Message,
      simSlot: simSlot,
    ).then((status) {
      if (status == "sent") {
        Fluttertoast.showToast(msg: "Sent");
      } else {
        Fluttertoast.showToast(msg: "failed");
      }
    });
  }

  _getCurrentLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: "location permission are  Denid");
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg: "Location Permissions are permanently denied");
      }
    }
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position) {
      setState(() {
        _currentPosition = Position;
        print(_currentPosition!.latitude);
        _getAddressFromLatLon();
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  _getAddressFromLatLon() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode},${place.street},";
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  ShowModelSafeHome(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SEND YOUR CURRENT LOCATION IMMEDIATELY TO sAFE-HOME",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              if (_currentPosition != null) Text(_currentAddress!),
              ElevatedButton(
                onPressed: () {
                  _getCurrentLocation();
                },
                child: Text(
                  "GET LOCATION",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                child: Text(
                  "Send Alert",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () async {
                  final String phoneNumber = "9860204340";
                  final String messageBody =
                      " I might be in Trouble . Right now i'm at $_currentAddress";
                  final Uri url =
                      Uri.parse('sms:$phoneNumber?body=$messageBody ');
                  try {
                    launchUrl(url);
                  } catch (e) {
                    print(e.toString());
                  }
                },
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ShowModelSafeHome(context);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Send Location'),
                      subtitle: Text("Share location"),
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assects/route.jpg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
