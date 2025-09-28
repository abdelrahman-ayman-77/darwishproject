// ignore_for_file: public_member_api_docs, sort_constructors_first

class Usermodel {
  String role;
  String gender;
  double weight;
  double height;
  double heartrate;
  double bloodsugar;
  double bloodpressure;
  Usermodel({
    required this.role,
    required this.gender,
    required this.weight,
    required this.height,
    required this.heartrate,
    required this.bloodsugar,
    required this.bloodpressure,
  });

  Map<String, dynamic> toJson() {
    return {
      "role": role,
      "gender": gender,
      "weight": weight,
      "height": height,
      "heartrate": heartrate,
      "bloodsugar": bloodsugar,
      "bloodpressure": bloodpressure,
    };
  }
}
