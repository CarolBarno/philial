import 'dart:convert';

import 'package:philial/res/apis/register_api.dart';

int pageNo = 0;
int pageSize = 10;

class Package {
  String packageName;
  String level1Bonus;
  String level2Bonus;
  String level3Bonus;
  String regFee;
  String minOperatingBal;
  String minOperatingPeriod;
  String monthlySubscription;
  String packageId;

  Package({
    this.packageName,
    this.level1Bonus,
    this.level2Bonus,
    this.level3Bonus,
    this.regFee,
    this.minOperatingBal,
    this.minOperatingPeriod,
    this.monthlySubscription,
    this.packageId,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
        packageName: json["package_name"],
        level1Bonus: json["level_one_bonus"].toString(),
        level2Bonus: json["level_two_bonus"].toString(),
        level3Bonus: json["level_three_bonus"].toString(),
        regFee: json["reg_fee"].toString(),
        minOperatingBal: json["min_operating_bal"].toString(),
        minOperatingPeriod: json["min_operating_period"].toString(),
        monthlySubscription: json["montly_subscription_fee"].toString(),
        packageId: json["package_id"].toString());
  }
}

Future<List<Package>> fetchPackages() async {
  final response = await getData('package?pageNo=$pageNo&pageSize=$pageSize');
  var body = json.decode(response.body);

  if (response.statusCode == 200) {
    List jsonResponse = body['content'];
    print('packages response $jsonResponse');
    return jsonResponse.map((job) => new Package.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load packages');
  }
}
