import 'package:dap_annotation_website_new/pages/annotation.dart';
import 'package:dap_annotation_website_new/widgets/form.dart';
import 'package:flutter/material.dart';

class AnnotatorInfoPage extends StatefulWidget {
  const AnnotatorInfoPage({super.key});

  @override
  State<AnnotatorInfoPage> createState() => _AnnotatorInfoPageState();
}

class _AnnotatorInfoPageState extends State<AnnotatorInfoPage> {
  static List<String> ageList = <String>[
    'Enter Age',
    'Under 14',
    '15-19',
    '20-24',
    '25-29',
    '30-34',
    '35-39',
    '40-44',
    '45-49',
    '50-54',
    '55-59',
    '60-64',
    '65+',
  ];
  static List<String> genderList = <String>[
    'Enter Gender',
    'Male',
    'Female',
    'Other',
    'Prefer not to say'
  ];

  String genderDropdownValue = genderList.first;
  String ageDropdownValue = ageList.first;

  final TextEditingController _ageController = TextEditingController();

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
          child: CustomForm(
            headerText: "Annotator Information",
            buttonText: "Next",
            onPressed: (context) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnnotationPage(),
                ),
              );
            },
            children: [
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      // color: Colors.white,
                      width: 3,
                    ),
                  ),
                  // labelStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 18,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenSize.height / 20),
              DropdownButtonFormField<String>(
                // dropdownColor: const Color(0xFFFF672B),
                value: ageDropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                  // color: Colors.white,
                  fontSize: 18,
                ),
                onChanged: (String? value) {
                  setState(() {
                    ageDropdownValue = value!;
                  });
                },
                items: ageList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == 'Enter Age') {
                    return 'Please select your age';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenSize.height / 20),
              DropdownButtonFormField<String>(
                // dropdownColor: const Color(0xFFFF672B),
                value: genderDropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                  // color: Colors.white,
                  fontSize: 18,
                ),
                onChanged: (String? value) {
                  setState(() {
                    genderDropdownValue = value!;
                  });
                },
                items: genderList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == 'Enter Gender') {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
