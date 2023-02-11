import 'package:flutter/material.dart';

class BookData
{
  String? Class;
  String? Icon;
  String? Subject;
  String? about;

  BookData({ required this.Class,required this.Icon,required this.Subject,required this.about });

  BookData.fromJson(Map<String, dynamic> json)
  {
      Class = json["Class"];
      Icon = json["Icon"];
      Subject = json["Subject"];
      about = json["about"];
  }

  Map<String,dynamic> tojson()
  {
    Map<String,dynamic> data = Map<String,dynamic>();
    data["Class"] = Class; 
    data["Icon"] = Icon; 
    data["Subject"] = Subject;
    data["about"] = about; 
    return data;
  }
}