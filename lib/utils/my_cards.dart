import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final double balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final color;

  const MyCards(
      {Key? key,
      required this.balance,
      required this.cardNumber,
      required this.expiryMonth,
      required this.expiryYear,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 10),
          const Text('Balance',
              style: TextStyle(
                color: Colors.white,
              )),
          const SizedBox(height: 10),
          Text('\$$balance',
              style: const TextStyle(color: Colors.white, fontSize: 28)),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //Card number
            Text(cardNumber.toString(),
                style: const TextStyle(color: Colors.white)),

            //card expiry date
            Text('$expiryMonth/$expiryYear',
                style: const TextStyle(
                  color: Colors.white,
                )),
          ])
        ]),
      ),
    );
  }
}
