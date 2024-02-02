import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/utils/my_buttons.dart';
import 'package:wallet_app/utils/my_cards.dart';
import 'package:wallet_app/utils/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[300], //this is only possible if scaffold is not const
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: const Icon(Icons.monetization_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home,
                        size: 32,
                        color: Colors.pink.shade200,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 32,
                        color: Colors.grey,
                      ))
                ]),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text("My ",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        Text("Cards", style: TextStyle(fontSize: 28)),
                      ],
                    ),

                    //plus button
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: const Icon(Icons.add))
                  ]),
            ),
            const SizedBox(height: 25),

            //Cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCards(
                    balance: 5250.25,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 25,
                    color: Colors.deepPurple[400],
                  ),
                  MyCards(
                    balance: 3450.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 25,
                    color: Colors.blue[300],
                  ),
                  MyCards(
                    balance: 7160.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 25,
                    color: Colors.green[300],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect:
                    ExpandingDotsEffect(activeDotColor: Colors.grey.shade800)),

            const SizedBox(height: 20),
            //3 buttons => send + pay + bills
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //send button
                  MyButton(
                    iconImagePath: 'lib/icons/send-money.png',
                    buttonText: 'Send',
                  ),
                  MyButton(
                    iconImagePath: 'lib/icons/credit-card.png',
                    buttonText: 'Pay',
                  ),
                  MyButton(
                    iconImagePath: 'lib/icons/bill.png',
                    buttonText: 'Bill',
                  ),
                  //pay button
                ],
              ),
            ),

            //column => stats + transactions
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(children: [
                MyListTile(
                  iconImageTile: 'lib/icons/statistics.png',
                  tileTitle: 'Statistics',
                  tileSubTitle: 'Payments and Income',
                ),
                MyListTile(
                  iconImageTile: 'lib/icons/transaction.png',
                  tileTitle: 'Transactions',
                  tileSubTitle: 'Transaction History',
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
