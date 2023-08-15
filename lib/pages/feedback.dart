import 'package:dap_annotation_website_new/pages/thanks_for_feedback.dart';
import 'package:dap_annotation_website_new/widgets/form.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextEditingController textarea = TextEditingController();
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          child: CustomForm(
            headerText: "Thank you for your contribution!",
            buttonText: "Next",
            onPressed: (context) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThanksForFeedbackPage(),
                ),
              );
            },
            children: [
              const Center(
                child: Text(
                  "Your annotations have been recorded. If you wish, please describe in a few sentences any particular features or properties of the images that guided your annotations. This feedback is optional but appreciated.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height / 40),
              const Divider(),
              SizedBox(height: screenSize.height / 40),
              TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: "Your feedback",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
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
}
