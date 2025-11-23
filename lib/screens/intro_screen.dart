import 'package:flutter/material.dart';
import 'package:store_app_template/screens/home_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 239, 215),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 60, right: 60, top: 150),
            child: Image.asset('images/red_logo.png'),
          ),

          Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              'Fresh groceries delivered to your door',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ShadowsIntoLight',
                fontSize: 36,
                fontWeight: FontWeight.bold
              ),
            )
          ),

          SizedBox(height: 10),

          Text(
            'Fresh items everyday',
            style: TextStyle(
                fontFamily: 'ShadowsIntoLight',
                fontSize: 20,
                color: Colors.grey.shade600
              ),
          ),

          Spacer(),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, 
              MaterialPageRoute(
                builder: (context) { return HomePage(); }
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Text(
                'Get Started',
            style: TextStyle(
                fontFamily: 'SourceSans3',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}