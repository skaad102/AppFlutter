// To parse this JSON data, do
//
//     final rutaPoint = rutaPointFromJson(jsonString);

import 'dart:convert';

RutaPoint rutaPointFromJson(String str) => RutaPoint.fromJson(json.decode(str));

String rutaPointToJson(RutaPoint data) => json.encode(data.toJson());

class RutaPoint {
  RutaPoint({
    required this.routes,
    required this.waypoints,
  });

  List<Route> routes;
  List<Waypoint> waypoints;

  factory RutaPoint.fromJson(Map<String, dynamic> json) => RutaPoint(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        waypoints: List<Waypoint>.from(
            json["waypoints"].map((x) => Waypoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
      };
}

class Route {
  Route({
    required this.countryCrossed,
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.legs,
    required this.geometry,
  });

  bool countryCrossed;
  String weightName;
  double weight;
  double duration;
  double distance;
  List<dynamic> legs;
  String geometry;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        countryCrossed: json["country_crossed"],
        weightName: json["weight_name"],
        weight: json["weight"].toDouble(),
        duration: json["duration"].toDouble(),
        distance: json["distance"].toDouble(),
        legs: List<dynamic>.from(json["legs"].map((x) => Leg.fromJson(x))),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "country_crossed": countryCrossed,
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "geometry": geometry,
      };
}

class Leg {
  Leg({
    required this.viaWaypoints,
    required this.admins,
    required this.weight,
    required this.duration,
    required this.steps,
    required this.distance,
    required this.summary,
  });

  List<dynamic> viaWaypoints;
  List<dynamic> admins;
  double weight;
  double duration;
  List<dynamic> steps;
  double distance;
  String summary;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
        admins: List<dynamic>.from(json["admins"].map(((x) => x))),
        weight: json["weight"].toDouble(),
        duration: json["duration"].toDouble(),
        steps: List<dynamic>.from(json["steps"].map((x) => x)),
        distance: json["distance"].toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "distance": distance,
        "summary": summary,
      };
}

class Waypoint {
  Waypoint({
    required this.distance,
    required this.name,
    required this.location,
  });

  double distance;
  String name;
  List<double> location;

  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"].toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}
