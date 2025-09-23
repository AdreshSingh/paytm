import 'package:flutter/material.dart';
import 'package:paytm/views/balance_history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> rowOneData = [
    {
      "iconSrc": "assets/images/homescreen/Icons.png",
      "iconText": "Scan &\n Pay",
    },
    {
      "iconSrc": "assets/images/homescreen/Icons-2.png",
      "iconText": "To Mobile\nor Contact",
    },
    {
      "iconSrc": "assets/images/homescreen/Icons-3.png",
      "iconText": "To Bank A/C\nor UPI ID",
    },
    {
      "iconSrc": "assets/images/homescreen/Icons-3-1.png",
      "iconText": "To Self A/C",
    },
  ];

   List<Map<String, String>> rowThirdData = [
    {
      "iconSrc": "assets/images/homescreen/I-7.png",
      "iconText": "Mobile\nRecharge",
    },
    {
      "iconSrc": "assets/images/homescreen/I-8.png",
      "iconText": "Rent via\nCredit Card",
    },
    {
      "iconSrc": "assets/images/homescreen/I-9.png",
      "iconText": "FASTag\nRecharge",
    },
    {
      "iconSrc": "assets/images/homescreen/I-10.png",
      "iconText": "Electricity Bill",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 41, 114),
        //? Leading Icons
        leading: Container(
          margin: EdgeInsets.all(6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(99.0)),
          ),
          child: Text(
            "MS",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),

        // ? App Name
        title: Image.asset("assets/images/homescreen/App-name.png"),

        actions: [
          Icon(Icons.search_outlined, color: Colors.white),
          Icon(Icons.notifications_none_outlined, color: Colors.white),
        ],
      ),
      body: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              // app banner
              Image.asset("assets/images/homescreen/Banner.png"),

              // UPI Id
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("UPI: Activate",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                    Text("UPI ID: 8920843161@pt...",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),

              // ? First Icon Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                      rowOneData
                          .map(
                            (data) => (RowOneIcon(
                              iconSrc: data["iconSrc"]!,
                              iconText: data["iconText"]!,
                            )),
                          )
                          .toList(),
                ),
              ),

              //? Second Icon Row
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200]!,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (BuildContext builder) =>
                                    BalanceHistoryScreen(),
                          ),
                        );
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Loading..")));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/homescreen/Icons-5.png"),
                            SizedBox(width: 6),
                            Text(
                              "Check Balance\n& History",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/homescreen/Icons-6.png"),
                          SizedBox(width: 6),
                          Text(
                            "All UPI\nServices",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 22),
                        ],
                      ),
                    ),
                  ],
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECHARGE & BILL PAYMENTS",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text("View all>", style: TextStyle(color: Colors.blue)),
                      ],
                    ),

                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: rowThirdData
                          .map(
                            (data) => (RowOneIcon(
                              iconSrc: data["iconSrc"]!,
                              iconText: data["iconText"]!,
                            )),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),

              // ? Promoted Row
              Image.asset("assets/images/homescreen/Promtoed.png"),

              // ? Do More with PayTm
              Image.asset("assets/images/homescreen/Do more with Paytm.png"),

              // ? FREE Tool
              Image.asset("assets/images/homescreen/FREE Tool.png")
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

class RowOneIcon extends StatelessWidget {
  final String iconSrc;
  final String iconText;
  const RowOneIcon({super.key, required this.iconSrc, required this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(iconSrc),
        SizedBox(height: 6,),
        Text(
          iconText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
