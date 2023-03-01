import 'dart:io';

//creating another classs for placeLocations
class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation(this.address,
      {required this.latitude, required this.longitude});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;

  Place(this.title, this.location, this.image, {required this.id});
}
