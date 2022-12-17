import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylittlebakery/users/pages/orders/orders_user_pay_started.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class OrdersStarted extends StatefulWidget {
  String? id;
  String? categoryName;
  String? itemName;
  String? description;
  String? photoURL;
  String? price;
  String? name;
  OrdersStarted(
      {super.key,
      this.id,
      this.categoryName,
      this.itemName,
      this.photoURL,
      this.price,
      this.description});

  @override
  State<OrdersStarted> createState() => _OrdersStartedState();
}

class _OrdersStartedState extends State<OrdersStarted> {
  @override
  Widget build(BuildContext context) {
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
            "CheckOut",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                leading: Image.network(
                  widget.photoURL!.toString(),
                  width: 70,
                  fit: BoxFit.cover,
                ),
                title: Text(widget.itemName!),
                subtitle: Text(widget.description!),
                trailing: FittedBox(child: Text(widget.price! + ' \$ ')),
              ),
            ),
          ),
          // autogroupf55eEvY (55JFJuYp2Y8SopVb8xf55E)
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // totallpaymentxLk (19:164)
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
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Text(
                  // 37J (19:165)
                  "\$" + widget.price!,
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
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => OrderPay(
                              id: widget.id,
                              categoryName: widget.categoryName,
                              itemName: widget.itemName,
                              description: widget.description,
                              photoURL: widget.photoURL,
                              price: widget.price,
                            )));
              },
              child: Text(
                "Order Now",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFECEC1),
                  fixedSize: Size(306, 60),
                  shape: StadiumBorder()),
            ),
          )
        ]));
  }
}
