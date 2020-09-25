import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/transactions_api.dart';

Future _futuretransactions;

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  void initState() {
    _futuretransactions = fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: defaultBlue,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 1))
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: size.setHeight(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                            EdgeInsets.fromLTRB(size.setWidth(15), 0, 0, 0),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back,
                                  color: Colors.white, size: size.setWidth(60)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                                fontSize: size.setSp(26),
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.setWidth(20), 0, size.setWidth(20), 0),
                    child: mytransactionsFunction(context),
                  ),
                ),
              ],
            ),
          ),

        ));
  }
}

Widget mytransactionsFunction(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
  var size = ScreenUtil();
  //try {
  return FutureBuilder<List<Transaction>>(
    future: _futuretransactions,
    builder: (context, snapshot) {
      if (snapshot.hasData && snapshot.data.length == 0) {
//         print('data length is there${snapshot.data.length}>>>>>>>>>>>>>>>>>>>>>');

        return Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.setHeight(20),
                ),

                SizedBox(
                  height: size.setHeight(20),
                ),
                Text(
                  'No transactions found',
                  style: TextStyle(
                    fontSize: size.setSp(24),
                    color: Colors.grey[800],
                  ),
                )
              ],
            ));
      } else if (snapshot.hasData) {
//        print('data length is zer>>>>>>>>>>>>>>>>>>>>>');
        List<Transaction> data = snapshot.data;
        return mytransactionsListView(context, data);
      } else if (snapshot.hasError) {
//         print('errorrrr>>>>>>>>>>>>>>>>>>>>> ${snapshot.error}');
        return Center(child: Text(
//          'Failed to load items, try again later',
          'Failed to load items',
          style: TextStyle(
            fontSize: size.setSp(24),
            color: Colors.grey[800],
          ),
        ));
      }
      return spinkitBlue;
    },
  );
}

Widget mytransactionsListView(BuildContext context, data) {
  ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
  var size = ScreenUtil();
  return ListView.builder(
    //itemExtent: size.setWidth(100),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return transactionCard(
            context,
            data[index].trxDate,
            data[index].trxAmt,
            data[index].newBalance,
            data[index].trxNo,
            data[index].trxType,

        );
      });
}

Widget transactionCard(BuildContext context, String date, String amount,
    String newbalance, String number, String type
    ) {
  ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
  var size = ScreenUtil();
  return InkWell(
    onTap: () {

    },
    child: Padding(
      padding: EdgeInsets.fromLTRB(size.setWidth(10), size.setWidth(20),
          size.setWidth(10), size.setWidth(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ksh. $amount',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: size.setSp(26),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '$date',
                        style: TextStyle(
                            color: defaultBlue,
                            fontSize: size.setSp(22),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$type',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: size.setSp(24),
                            fontWeight: FontWeight.w600),
                      ),
                      // Text(
                      //   '$requestdate',
                      //   style: TextStyle(
                      //       color: Colors.grey[700],
                      //       fontSize: size.setSp(22),
                      //       fontWeight: FontWeight.w500),
                      // ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: size.setWidth(30),
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    ),
  );
}
// class RequestsList extends StatefulWidget {
//   static const int PAGE_SIZE = 20;

//   @override
//   _RequestsListState createState() => _RequestsListState();
// }

// class _RequestsListState extends State<RequestsList> {

// @override
// void initState() {
//   this._pageLoadController.addListener(() {
//   if (!this._pageLoadController.hasMoreItems) {
//     Scaffold.of(context).showSnackBar(
//       SnackBar(
//         content: Text('No More Items!')
//       )
//     );
//   }
// });
//   super.initState();
// }
// final _pageLoadController = PagewiseLoadController(
//   pageSize: RequestsList.PAGE_SIZE,
//   pageFuture: (pageIndex) => MemberHistory.getMemberRequestsHistory(
//       pageIndex * RequestsList.PAGE_SIZE, RequestsList.PAGE_SIZE, pageIndex),
// );

// @override
// Widget build(BuildContext context) {
//   return Expanded(
//       child: Pagination<MemberRequestsHistory>(
//       pageBuilder: (currentListSize) => MemberHistory.getMemberRequestsHistory(0,0,currentListSize),
//       itemBuilder: (index,item) => ListTile(title: Text(item.requestno)),
//     ),
//     PagewiseListView(
//   //pageSize: PAGE_SIZE,
//  // semanticChildCount: 3,

//   itemBuilder: this._itemBuilder,
//   pageLoadController: _pageLoadController,
//   // pageFuture: (pageIndex) =>
//   //     MemberHistory.getMemberRequestsHistory(pageIndex * PAGE_SIZE, PAGE_SIZE)),
// )
//   );
// }

// Widget _itemBuilder(context, MemberRequestsHistory entry, index) {
//   return Column(
//     children: <Widget>[
//       ListTile(
//         leading: Icon(
//           Icons.person,
//           color: Colors.brown[200],
//         ),
//         title: Text('${entry.requestno} index= ${index}'),
//         subtitle: Text(entry.requestno),
//       ),
//       Divider()
//     ],
//   );
// }
//}
