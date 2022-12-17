import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class OrderPay extends StatefulWidget {
  String? id;
  String? categoryName;
  String? itemName;
  String? description;
  String? photoURL;
  String? price;
  String? name;
  OrderPay(
      {super.key,
      this.id,
      this.categoryName,
      this.itemName,
      this.photoURL,
      this.price,
      this.description});

  @override
  State<OrderPay> createState() => _OrderPayState();
}

class _OrderPayState extends State<OrderPay> {
  bool _checkboxListTile = false;

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/back.png"),
          ),
        ),
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        // paymentWWY (19:259)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouplcpnDme (55JKyBx7scWd9WvoqcLCPN)
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // group2347ME (19:322)
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.fromLTRB(18, 5, 24, 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          // ellipse55rQc (19:340)
                          value: _checkboxListTile,
                          onChanged: (t) {},
                        ),
                        Container(
                          // creditdebitcardbvc (19:324)
                          margin: EdgeInsets.fromLTRB(0, 0, 45, 1),
                          child: Text(
                            'Credit/Debit Card',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              height: 1.1725,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // image75Kz (19:327)
                          width: 31,
                          height: 31,
                          child: Image.asset(
                            'assets/image-7.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // group233bZE (19:328)
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.fromLTRB(18, 5.08, 26.66, 5.03),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          offset: Offset(0, 0),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          shape: CircleBorder(),

                          // ellipse55rQc (19:340)
                          value: _checkboxListTile,
                          onChanged: (t) {},
                        ),
                        Container(
                          // paypalsQG (19:330)
                          margin: EdgeInsets.fromLTRB(0, 1.94, 141, 0),
                          child: Text(
                            'Paypal',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              height: 1.1725,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // logospaypalwuv (19:332)
                          width: 25.33,
                          height: 29.89,
                          child: Image.asset(
                            'assets/logos-paypal.png',
                            width: 25.33,
                            height: 29.89,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    // group2353i4 (19:337)
                    padding: EdgeInsets.fromLTRB(18, 9, 27, 7),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          offset: Offset(0, 0),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          shape: CircleBorder(),

                          // ellipse55rQc (19:340)
                          value: _checkboxListTile,
                          onChanged: (t) {},
                        ),
                        Container(
                          // cashM6U (19:339)
                          margin: EdgeInsets.fromLTRB(0, 0, 155, 0),
                          child: Text(
                            'Cash',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              height: 1.1725,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // bicash2yJ (19:341)
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                          width: 25,
                          height: 15.63,
                          child: Image.asset(
                            'assets/bi-cash.png',
                            width: 25,
                            height: 15.63,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 25),
                    // autogroup1xheKxQ (55JKmMxVaT9gtthUkM1XHE)
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // totallpaymentdTJ (19:316)
                          margin: EdgeInsets.fromLTRB(0, 0, 131, 0),
                          child: Text(
                            'Total Payment',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.1725,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Text(
                          // XHn (19:317)
                          '\$' + widget.price!,
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Container(
                    height: 180,
                  ),
                  Container(
                    height: 190,
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Pay Now",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(306, 58),
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xfffecec1)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
