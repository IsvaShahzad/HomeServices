import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:home_services_flutter/seller/Packaging_Screen.dart';
import 'package:home_services_flutter/seller/SellerMainPage.dart';

class DeliveredScreen extends StatefulWidget {
  @override
  _DeliveredScreenState createState() => _DeliveredScreenState();
}

class _DeliveredScreenState extends State<DeliveredScreen> {
  late ConfettiController _confettiController;
  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(milliseconds: 800));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void triggerConfetti() {
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pastel.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -3.1415 / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              shouldLoop: true,
              colors: const [
                Colors.blue,
                Colors.red,
                Colors.yellow,
                Colors.green,
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 130.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 51),
                      child: Text(
                        'Order Placed Successfully! 🎉',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 120),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFAB47BC),
                            onPrimary: Colors.white,
                            elevation: 3,
                            minimumSize: const Size(150, 50),
                            maximumSize: const Size(150, 50),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SellerHomePage()));                           },
                          child: Text('Go to Homepage'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFAB47BC),
                            onPrimary: Colors.white,
                            elevation: 3,
                            minimumSize: const Size(160, 50),
                            maximumSize: const Size(160, 50),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PackagingScreen()));                          },
                          child: Text('Continue Browsing'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
