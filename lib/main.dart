import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() => runApp(JazzCashHomePage());

class JazzCashHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              FadeInDown(
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'JazzCashBusiness',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.qr_code_scanner, color: Colors.white),
                          SizedBox(width: 10),
                          Icon(Icons.notifications_none, color: Colors.white),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              // Balance Section
              FadeInLeft(
                delay: Duration(milliseconds: 300),
                duration: Duration(milliseconds: 700),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rs. 175,000.00',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade800,
                            child: Text('FS', style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'FS Studios',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                'Faisal Shahzad',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Get Payment'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Action Buttons
              FadeInUp(
                delay: Duration(milliseconds: 600),
                duration: Duration(milliseconds: 700),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _iconButton(Icons.receipt_long, 'Bill Payments'),
                      _iconButton(Icons.send, 'Money Transfer'),
                      _iconButton(Icons.phone_android, 'Mobile Load'),
                      _iconButton(Icons.receipt, 'Taxes'),
                    ],
                  ),
                ),
              ),

              // Transactions Section
              FadeInLeft(
                delay: Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today\'s Transactions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_downward, color: Colors.green),
                              SizedBox(width: 5),
                              Text('Rs. 250,000', style: TextStyle(color: Colors.white))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.arrow_upward, color: Colors.red),
                              SizedBox(width: 5),
                              Text('Rs. 50,000', style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Transactions List
              Expanded(
                child: FadeInUp(
                  delay: Duration(milliseconds: 1000),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        _animatedTile('QR Payment', '****3434', '12:45PM', 'Rs. 124.00', true, 0),
                        _animatedTile('QR Payment', '****9876', '12:50PM', 'Rs. 1240.00', false, 200),
                        _animatedTile('QR Payment', '****1243', '12:51PM', 'Rs. 140.00', true, 400),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
        )
      ],
    );
  }

  Widget _animatedTile(String title, String card, String time, String amount, bool isDebit, int delayMs) {
    return FadeInRight(
      delay: Duration(milliseconds: delayMs),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(card + '   ·   ' + time, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            Text(
              amount,
              style: TextStyle(color: isDebit ? Colors.red : Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
