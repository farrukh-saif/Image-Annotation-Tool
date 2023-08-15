import 'package:dap_annotation_website_new/pages/feedback.dart';
import 'package:flutter/material.dart';

class AnnotationPage extends StatefulWidget {
  const AnnotationPage({Key? key}) : super(key: key);

  @override
  State<AnnotationPage> createState() => _AnnotationPageState();
}

class _AnnotationPageState extends State<AnnotationPage> {
  int numAnswered = 1;
  int totalQuestions = 5;
  String? selectedOption;
  String chosenCategory = '';

  late List<String> categories;
  late String urlOfImageToShow;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Warning"),
                  content: const Text(
                      "Your progress will be lost. Do you want to exit?"),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("No"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);
                      },
                      child: const Text("Yes"),
                    ),
                  ],
                );
              },
            ) ??
            false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height / 40,
              ),
              Text(
                "Annotation Page",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: screenSize.height / 80,
              ),
              const Divider(),
              SizedBox(
                height: screenSize.height / 40,
              ),
              Card(
                elevation: 10,
                child: SizedBox(
                    height: screenSize.height / 2,
                    width: screenSize.width / 2 + 200,
                    child: ClipRRect(
                        child: numAnswered <= totalQuestions
                            ? Image.network("https://picsum.photos/200")
                            : const SizedBox(
                                width: 10,
                                height: 10,
                              ))),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height / 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio<String>(
                                value: 'category_one',
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value;
                                  });
                                },
                              ),
                              const Text(
                                'Category One',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: screenSize.width / 10),
                        SizedBox(
                          height: 80,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio<String>(
                                value: 'category_two',
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value;
                                  });
                                },
                              ),
                              const Text(
                                'Category Two',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (numAnswered < totalQuestions) {
                          setState(() {
                            numAnswered++;
                            selectedOption = null;
                          });
                        } else {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedbackPage()));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            selectedOption == null
                                ? Colors.grey
                                : Colors.blueGrey),
                        fixedSize:
                            MaterialStateProperty.all(const Size(230, 70)),
                      ),
                      child: Text(
                        numAnswered >= totalQuestions ? "Finish" : "Next",
                        style: const TextStyle(letterSpacing: 1, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height / 20),
              SizedBox(
                  width: 200,
                  height: 2,
                  child: LinearProgressIndicator(
                    value: numAnswered / totalQuestions,
                  )),
              Text(
                  "${numAnswered < totalQuestions ? numAnswered : totalQuestions}/$totalQuestions"),
            ],
          ),
        ),
      ),
    );
  }
}
