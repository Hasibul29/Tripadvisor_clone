import 'package:flutter/material.dart';

const double kDefaultPadding = 20.0;
const kPrimaryColor = Colors.black;
const kSecondaryColor = Color(0xFF34e0a1);
const kTertiaryColor = Color(0xFF1B5E20);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const appBarTheme = AppBarTheme(elevation: 0);
const bottomAppBar = BottomAppBarTheme(
    elevation: 0, surfaceTintColor: Colors.white, padding: EdgeInsets.all(0));

const List month = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class Member {
  final IconData icon;
  final String text;

  Member(this.icon, this.text);
}

final List<Member> members = [
  Member(Icons.person_2_outlined, "Going solo"),
  Member(Icons.favorite_border_outlined, "Partner"),
  Member(Icons.group_outlined, "Friend"),
  Member(Icons.family_restroom_outlined, "Family")
];

class TourCategory {
  String text;
  bool isSelected;

  TourCategory({required this.text, this.isSelected = false});
}

List<TourCategory> tourCategories = [
  TourCategory(text: "Must-see Attractions"),
  TourCategory(text: "Great Food"),
  TourCategory(text: "Hidden Gems"),
  TourCategory(text: "Ocean Adventures in Oahu"),
  TourCategory(text: "Sunset Cruise and Fireworks"),
  TourCategory(text: "Island Flavors of Oahu"),
  TourCategory(text: "Surfing"),
  TourCategory(text: "Pearl Harbor Historic Sites"),
  TourCategory(text: "Nature and Wildlife"),
  TourCategory(text: "Nightlife and Entertainment"),
  TourCategory(text: "Luxury Shopping"),
  TourCategory(text: "Outdoors"),
];
