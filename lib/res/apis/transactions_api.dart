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
      newBalance: json["new_balance"].toString(),
      trxType: json["transaction_type"].toString(),
      trxNo: json["transaction_number"].toString(),
      trxDate: json["transaction_date"],
      trxAmt: json["transaction_amt"].toString(),

    );
  }
}

Future<List<Transaction>> fetchTransactions() async {

  final response = await getData('my-transactions-log?pageNumber=0&pageSize=1000');
  var body = json.decode(response.body);
  print('transaction status ${response.statusCode}');
  print('transaction response $body');
  try{
  if (response.statusCode == 200) {
    print('transaction response ok>>>>>');
    List jsonResponse = body['content'];
    print('transactions response $jsonResponse');
    return jsonResponse.map((job) => new Transaction.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load transactions');
  }
  }catch(e){
    print('error is $e');
  }
}