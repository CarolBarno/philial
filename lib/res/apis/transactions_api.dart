import 'dart:convert';
import 'package:philial/res/apis/register_api.dart';

class Transaction {

  String trxDate;
  String trxAmt;
  String newBalance;
  String trxNo;
  String trxType;


  Transaction(
      {
        this.newBalance,
        this.trxAmt,
        this.trxDate,
        this.trxNo,
        this.trxType
      });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      newBalance: json["new_balance"],
      trxType: json["transaction_type"],
      trxNo: json["transaction_number"],
      trxDate: json["transaction_date"],
      trxAmt: json["transaction_amt"],

    );
  }
}

Future<List<Transaction>> fetchTransactions() async {

  final response = await getData('my-transactions-log?pageNumber=0&pageSize=1000');
  var body = json.decode(response.body);

  if (response.statusCode == 200) {
    List jsonResponse = body['content'];
    print('transactions response $jsonResponse');
    return jsonResponse.map((job) => new Transaction.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load transactions');
  }
}