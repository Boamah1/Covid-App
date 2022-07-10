// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.country,
        required this.cases,
        required this.todayCases,
        required this.deaths,
        required this.todayDeaths,
        required this.recovered,
        required this.active,
        required this.critical,
        required this.casesPerOneMillion,
        required this.deathsPerOneMillion,
        required this.totalTests,
        required this.testsPerOneMillion,
    });

    String country;
    int cases;
    int todayCases;
    int deaths;
    int todayDeaths;
    int? recovered;
    int? active;
    int critical;
    int casesPerOneMillion;
    int deathsPerOneMillion;
    int totalTests;
    int testsPerOneMillion;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        country: json["country"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"],
        totalTests: json["totalTests"],
        testsPerOneMillion: json["testsPerOneMillion"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "totalTests": totalTests,
        "testsPerOneMillion": testsPerOneMillion,
    };
}

class Welcometext {
  List<Welcome> nyash;

  Welcometext({required this.nyash});

  factory Welcometext.fromjson(List parsedjson) {
    List<Welcome> nyash = <Welcome>[];

    nyash = parsedjson.map((e) => Welcome.fromJson(e)).toList();

    return Welcometext(nyash: nyash);
  }
}


