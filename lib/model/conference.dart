/*
congress_fahrplan
This is the dart file contains the Conference class.
SPDX-License-Identifier: GPL-2.0-only
Copyright (C) 2019 Benjamin Schilling
*/

import 'package:congress_fahrplan/model/day.dart';
import 'package:flutter/material.dart';

class Conference {
  final String acronym;
  final String title;
  final String start;
  final String end;
  final int daysCount;
  final String timeslotDuration;
  final List<Day> days;
  final List<String> namesOfRooms;

  Conference({
    this.acronym,
    this.title,
    this.start,
    this.end,
    this.daysCount,
    this.timeslotDuration,
    this.days,
    this.namesOfRooms,
  });

  factory Conference.fromJson(var json) {
    return Conference(
      acronym: json['acronym'],
      title: json['title'],
      start: json['start'],
      end: json['end'],
      daysCount: json['daysCount'],
      timeslotDuration: json['timeslot_duration'],
      days: jsonToDayList(json['days']),
    );
  }

  static List<Day> jsonToDayList(var json) {
    List<Day> days = new List<Day>();
    for (var j in json) {
      days.add(Day.fromJson(j));
    }
    return days;
  }

  List<Widget> buildDayTabs() {
    List<Column> dayColumns = List<Column>();
    for (Day d in days) {
      List<Widget> widgets = List<Widget>();
      widgets.addAll(d.talks);
      dayColumns.add(
        Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: d.talks.length,
                itemBuilder: (context, index) {
                  return d.talks[index];
                },
              ),
            ),
          ],
        ),
      );
    }
    return dayColumns;
  }

  List<Text> getDaysAsText() {
    List<Text> dayTexts = new List<Text>();
    for (Day d in days) {
      String weekday = '';
      switch (d.date.weekday) {
        case DateTime.monday:
          weekday = 'Mon';
          break;
        case DateTime.tuesday:
          weekday = 'Tue';
          break;
        case DateTime.wednesday:
          weekday = 'Wed';
          break;
        case DateTime.thursday:
          weekday = 'Thu';
          break;
        case DateTime.friday:
          weekday = 'Fri';
          break;
        case DateTime.saturday:
          weekday = 'Sat';
          break;
        case DateTime.sunday:
          weekday = 'Sun';
          break;
      }
      String dateString = d.date.month.toString() + '-' + d.date.day.toString();
      dayTexts.add(new Text(
        '$weekday | $dateString',
        style: TextStyle(
          fontSize: 16,
        ),
      ));
    }
    return dayTexts;
  }
}
