/*
congress_fahrplan
This is the dart file contains the Room StatelessWidget.
SPDX-License-Identifier: GPL-2.0-only
Copyright (C) 2019 Benjamin Schilling
*/

import 'package:congress_fahrplan/widgets/talk.dart';

class Room {
  final String name;
  final List<Talk> talks;

  static int numberOfRooms = 0;
  static List<String> namesOfRooms = new List<String>();

  Room({
    this.name,
    this.talks,
  });

  factory Room.fromJson(var json, String name, DateTime day) {
    return Room(name: name, talks: jsonToTalkList(json, name, day));
  }

  static List<Talk> jsonToTalkList(var json, String name, DateTime day) {
    List<Talk> talkList = new List<Talk>();
    for (var j in json) {
      Talk t = Talk.fromJson(j, name);
      t.setDay(day);
      talkList.add(t);
    }
    return talkList;
  }
}
