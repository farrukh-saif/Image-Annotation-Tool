import 'package:flutter/material.dart';
import 'package:dap_annotation_website_new/pages/annotator_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              MyHero(screenSize: screenSize),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHero extends StatelessWidget {
  const MyHero({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 228, 228, 228),
      height: screenSize.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.height / 15,
              left: screenSize.height / 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SelectionArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Image Annotation Tool",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height / 20,
                      ),
                      SizedBox(
                        width: screenSize.width / 1.75,
                        child: const Text(
                          "Welcome to the Image Annotation Tool! Here, you can annotate various images according to specific criteria or guidelines. Feel free to provide any context or information to the annotators that will help them in labeling the images.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height / 20,
                      ),
                      SizedBox(
                        width: screenSize.width / 1.75,
                        child: const Text(
                          "Instructions or additional guidelines can be displayed here. For example, you may want to specify how to handle certain types of images or the particular annotations you're looking for.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnnotatorInfoPage()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                    fixedSize: MaterialStateProperty.all(const Size(250, 75)),
                  ),
                  child: const Text(
                    "Start Annotation",
                    style: TextStyle(letterSpacing: 1, fontSize: 20),
                  ),
                ),
                SizedBox(height: screenSize.height / 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
