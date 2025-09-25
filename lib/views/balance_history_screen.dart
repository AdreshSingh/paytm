import 'package:flutter/material.dart';

class BalanceHistoryScreen extends StatefulWidget {
  const BalanceHistoryScreen({super.key});

  @override
  State<BalanceHistoryScreen> createState() => _BalanceHistoryScreenState();
}

class _BalanceHistoryScreenState extends State<BalanceHistoryScreen> {
  List<Map<String, String>> rowOneData = [
    {
      "iconSrc": "assets/images/historyscreen/I-1.png",
      "iconTitle": "UPI Lite",
      "iconSubTitle":"Try payments that never fail.\n Pay in a single tap.",
      "iconButtonText":"Settings"
    },
    {
      "iconSrc": "assets/images/historyscreen/I-2.png",
      "iconTitle": "Bank of Maharashtra - 0284",
      "iconSubTitle":"UPI Payments will be\nreceived here",
      "iconButtonText":"Check Balance"
    },
    {
      "iconSrc": "assets/images/historyscreen/I-3.png",
      "iconTitle": "Credit Card",
      "iconSubTitle":"With best Cashback &\nRewards!",
      "iconButtonText":"Apply Now"
    },
    {
      "iconSrc": "assets/images/historyscreen/I-4.png",
      "iconTitle": "Personal Loan",
      "iconSubTitle":"Get up to र5 lacs",
      "iconButtonText":"Get now"
    },
    {
      "iconSrc": "assets/images/historyscreen/I-5.png",
      "iconTitle": "Cashback Points",
      "iconSubTitle":"",
      "iconButtonText":"120"
    },
  ];

  List<Map<String, String>> rowTwoData = [
    {
      "listSrc": "EN",
      "listTitle": "Enosh Peter Nag",
      "listSubTitle":"Sent on 14 Sep, 03:20 PM",
      "amount":"- र1,500",
      "type":"From"
    },
    {
      "listSrc": "EN",
      "listTitle": "Enosh Peter Nag",
      "listSubTitle":"Received on 14 Sep, 03:20 PM",
      "amount":"+ र1,500",
      "type":"In"
    },
    {
      "listSrc": "AR",
      "listTitle": "Archana Archana",
      "listSubTitle":"Paid on 11 Sep, 07:21 PM",
      "amount":"+ र40",
      "type":"From"
    },
    {
      "listSrc": "H",
      "listTitle": "H",
      "listSubTitle":"Sent on 08 Sep, 09:20 PM",
      "amount":"- र500",
      "type":"From"
    },
    {
      "listSrc": "JR",
      "listTitle": "Jip Prepaid Recharges",
      "listSubTitle":"Paid on 08 Sep, 09:58 PM",
      "amount":"+ र349",
      "type":"From"
    },
    {
      "listSrc": "PD",
      "listTitle": "Mrs. Poonam Dawani",
      "listSubTitle":"Paid on 06 Sep, 09:05 PM",
      "amount":"- र151",
      "type":"From"
    },
    {
      "listSrc": "EN",
      "listTitle": "Enosh Peter Nag",
      "listSubTitle":"Sent on 14 Sep, 09:36 PM",
      "amount":"- र300",
      "type":"From"
    },
    {
      "listSrc": "EN",
      "listTitle": "Sangameshwar Nagindrappa",
      "listSubTitle":"Sent on 04 Sep, 04:40 PM",
      "amount":"- र1,720",
      "type":"From"
    },
  ];

  void updateBalanceAmount(String amount) {
    setState(() {
      rowOneData[1]["iconButtonText"] = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(238, 255, 255, 255),
        // ? App Name
        title: Text(
          "Balance & History",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),

        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Loading..")));
            },
            child: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              // ? First Icon Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...rowOneData.asMap().entries.map(
                      (entry) => RowOneIcon(
                        iconSrc: entry.value["iconSrc"],
                        iconTitle: entry.value["iconTitle"],
                        iconSubTitle: entry.value["iconSubTitle"],
                        iconButtonText: entry.value["iconButtonText"],
                        onAmountEntered: entry.key == 1 ? updateBalanceAmount : null,
                      ),
                    ),
                  ],
                ),
              ),

              //? View all Accounts
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(99)
                  ),
                  child: Text("View All Accounts v"),
                ),
              ),


              // ? Third Row Icon
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment History",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 8),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Expanded(
                          child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search your payments",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                            ),
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                          ),
                          ),
                        ),

                        SizedBox(width: 12),

                      Image.asset("assets/images/historyscreen/I-6.png")
                      ],
                    ),

                    SizedBox(height: 8),

                    ...rowTwoData.map((data)=>RowThirdPayment(
                      listSrc: data['listSrc'],
                      listTitle: data['listTitle'],
                      listSubTitle: data['listSubTitle'],
                      amount: data['amount'],
                      type: data['type'],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/homescreen/I-11.png", scale: 1.45),
        ],
      ),
    );
  }
}

class RowThirdPayment extends StatelessWidget {
  final String? listSrc;
  final String? listTitle;
  final String? listSubTitle;
  final String? amount;
  final String? type;
  
  const RowThirdPayment({
    super.key,
    this.listSrc,
    this.listTitle,
    this.listSubTitle,
    this.amount,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.amber,
        child: Text(
          listSrc??"EN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: Text(listTitle??"Enosh Peter Nag"),
      subtitle: Text(listSubTitle??"Sent on 14 Sep, 03:20 PM"),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount??"- र1,500"),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(type??"In"),
              SizedBox(width: 4),
              Image.asset("assets/images/historyscreen/I-2.png", width: 20, height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class RowOneIcon extends StatefulWidget {
  final String? iconSrc;
  final String? iconTitle;
  final String? iconSubTitle;
  final String? iconButtonText;
  final Function(String)? onAmountEntered;

  const RowOneIcon({
    super.key, 
    required this.iconSrc, 
    required this.iconTitle,
    required this.iconSubTitle,
    required this.iconButtonText,
    this.onAmountEntered,
  });

  @override
  State<RowOneIcon> createState() => _RowOneIconState();
}

class _RowOneIconState extends State<RowOneIcon> {
  String? buttonText;

  @override
  void initState() {
    super.initState();
    buttonText = widget.iconButtonText;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.iconSrc??"None"),
      title: Text(widget.iconTitle??"None", style: TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(
        widget.iconSubTitle??"None",
        style: TextStyle(color: Colors.grey[500]),
      ),
      trailing: TextButton(
        onPressed: () {
          if (widget.iconTitle == "Bank of Maharashtra - 0284" && buttonText == "Check Balance") {
            TextEditingController _controller = TextEditingController();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                title: Text("Enter Amount"),
                content: Container(
                  width: 220, // Reduce dialog width
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Enter money amount"),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      String entered = _controller.text.trim();
                      if (entered.isNotEmpty && double.tryParse(entered) != null) {
                        setState(() {
                          buttonText = entered;
                        });
                        if (widget.onAmountEntered != null) {
                          widget.onAmountEntered!(entered);
                        }
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter a valid amount"))
                        );
                      }
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Loading..")));
          }
        },
        child: Text(
          buttonText??"None",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
        ),
      ),
    );
  }
}
