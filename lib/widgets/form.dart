import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final List<Widget> children;
  final String headerText;
  final String buttonText;
  final Function onPressed;

  CustomForm({
    required this.children,
    required this.headerText,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width / 5 + 200,
      height: screenSize.height / 2 + 200,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                headerText,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(height: screenSize.height / 40),
            const Divider(),
            SizedBox(height: screenSize.height / 40),
            ...children,
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => onPressed(context),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  fixedSize: MaterialStateProperty.all(const Size(180, 70)),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
