import 'dart:convert';
import 'package:philial/res/apis/register_api.dart';

class ReferralsData {

  String referralDate;
  String refereeName;
  String refereePhone;


  ReferralsData(
      {
        this.refereeName,
      this.referralDate,
      this.refereePhone
      });

  factory ReferralsData.fromJson(Map<String, dynamic> json) {
    return ReferralsData(
      referralDate: json["referral_date"],
      refereeName: json["referree_name"],
      refereePhone: json["referreree_phone_no"],

    );
  }
}

Future<List<ReferralsData>> fetchReferrals(String level) async {
  print('referrals level>>>> $level');
  final response = await getData('my-referrals?pageNo=0&pageSize=1000');
  var body = json.decode(response.body);

  if (response.statusCode == 200) {
    List jsonResponse = body['content']['$level'];
    print('referrals response $jsonResponse');
    return jsonResponse.map((job) => new ReferralsData.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load referrals from API');
  }
}

