
import 'dart:convert';

import 'package:philial/res/apis/register_api.dart';

String numberOfReferrals;
double accountBalance;
String nextRepaymentDate;
double nextDueAmount;
String activePackage;
String accountStatus;

getHomeData() async {
  try {

    var response = await getData('users-account-details');

    print('rrrrrrrrrrrrrr ${response.body}');

    var data = json.decode(response.body);

    if(response.statusCode == 200) {

      numberOfReferrals = data["content"]['number_of_referrals'];
      accountBalance = data["content"]['account_balance'];
      nextRepaymentDate = data["content"]['next_repayment_date'];
      nextDueAmount = data["content"]['next_due_amt'];
      activePackage = data["content"]['active_package'];
      accountStatus = data["content"]['account_status'];
    }
  } catch (e) {
  }
}
