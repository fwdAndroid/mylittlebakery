import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylittlebakery/models/orders_model.dart';
import 'package:mylittlebakery/users/main/user_main_screen.dart';
import 'package:mylittlebakery/widgets/utils.dart';
import 'package:uuid/uuid.dart';

enum SingingCharacter { Cash, CreditCard, Paypal }

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
  SingingCharacter? _character = SingingCharacter.Cash;
  bool _isLoading = false;

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
                    child: ListTile(
                      title: Text(
                        'Credit/Debit Card',
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          height: 1.1725,
                          color: Color(0xff000000),
                        ),
                      ),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.CreditCard,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Container(
                        // image75Kz (19:327)
                        width: 31,
                        height: 31,
                        child: Image.asset(
                          'assets/image-7.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                    child: ListTile(
                      title: Text(
                        'Paypal',
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          height: 1.1725,
                          color: Color(0xff000000),
                        ),
                      ),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Paypal,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Container(
                        // image75Kz (19:327)
                        width: 31,
                        height: 31,
                        child: Image.asset(
                          'assets/logos-paypal.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                    child: ListTile(
                      title: Text(
                        'Cash',
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          height: 1.1725,
                          color: Color(0xff000000),
                        ),
                      ),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Cash,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Container(
                        // image75Kz (19:327)
                        width: 31,
                        height: 31,
                        child: Image.asset(
                          'assets/bi-cash.png',
                          fit: BoxFit.cover,
                        ),
                      ),
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
                      onPressed: order,
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Text(
                              "Pay Now",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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

  void order() async {
    String gigId = Uuid().v1();
    Orders_Model gig_model = Orders_Model(
        uid: FirebaseAuth.instance.currentUser!.uid,
        doctorId: widget.id!,
        itemName: widget.itemName!,
        price: widget.price!,
        photoURL: widget.photoURL!,
        description: widget.description!,
        status: "accepted",
        moneyType: _character.toString());
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(gigId)
        .set(gig_model.toJson())
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => UserMainScreen()));
    });
  }
}
