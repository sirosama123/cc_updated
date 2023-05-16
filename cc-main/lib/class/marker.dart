import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerData {
  String markerId;
  double latitude;
  double longitude;
  String title;
  String names;
  String contact;
  String city;

  MarkerData(this.markerId, this.latitude,this.longitude, this.title, this.names, this.contact, this.city);
}