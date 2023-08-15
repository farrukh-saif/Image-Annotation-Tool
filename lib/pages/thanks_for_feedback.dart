import 'package:flutter/material.dart';

class ThanksForFeedbackPage extends StatelessWidget {
  const ThanksForFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          child: SizedBox(
            width: screenSize.width / 5 + 200,
            height: screenSize.height / 7 + 200,
            child: const ThanksForFeedbackCard(),
          ),
        ),
      ),
    );
  }
}

class ThanksForFeedbackCard extends StatelessWidget {
  const ThanksForFeedbackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Thank you for sharing your feedback!",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
