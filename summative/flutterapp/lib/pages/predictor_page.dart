import 'package:flutter/material.dart';
import 'result_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PredictorPage extends StatefulWidget {
  const PredictorPage({super.key});

  @override
  State<PredictorPage> createState() => _PredictorPageState();
}

class _PredictorPageState extends State<PredictorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController studyTimeController = TextEditingController();
  final TextEditingController absencesController = TextEditingController();
  int? gender;
  int? ethnicity;
  int? parentalEducation;
  int? tutoring;
  int? parentalSupport;
  int? extracurricular;
  int? sports;
  int? music;
  int? volunteering;
  int? gradeClass;

  Future<void> _predictGPA() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('https://flutter-linear-regression.onrender.com'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Age': int.parse(ageController.text),
          'Gender': gender,
          'Ethnicity': ethnicity,
          'ParentalEducation': parentalEducation,
          'StudyTimeWeekly': double.parse(studyTimeController.text),
          'Absences': int.parse(absencesController.text),
          'Tutoring': tutoring,
          'ParentalSupport': parentalSupport,
          'Extracurricular': extracurricular,
          'Sports': sports,
          'Music': music,
          'Volunteering': volunteering,
          'GradeClass': gradeClass,
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ResultPage(predictedGPA: result['Predicted GPA']),
          ),
        );
      } else {
        _showError("Error during prediction!");
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPA Predictor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField("Age", ageController),
              const SizedBox(height: 16),
              _buildDropdown("Gender", gender, {
                0: 'Male',
                1: 'Female',
              }, (val) => gender = val),
              const SizedBox(height: 16),
              _buildDropdown("Ethnicity", ethnicity, {
                1: 'African',
                2: 'Asian',
                3: 'European',
                4: 'Other',
              }, (val) => ethnicity = val),
              const SizedBox(height: 16),
              _buildDropdown(
                "Parental Education",
                parentalEducation,
                {1: 'Primary', 2: 'Secondary', 3: 'Tertiary'},
                (val) => parentalEducation = val,
              ),
              const SizedBox(height: 16),
              _buildTextField("Study Time Weekly (hrs)", studyTimeController),
              const SizedBox(height: 16),
              _buildTextField("Absences", absencesController),
              const SizedBox(height: 16),
              _buildDropdown("Tutoring", tutoring, {
                0: 'No',
                1: 'Yes',
              }, (val) => tutoring = val),
              const SizedBox(height: 16),
              _buildDropdown("Parental Support", parentalSupport, {
                0: 'No',
                1: 'Yes',
              }, (val) => parentalSupport = val),
              const SizedBox(height: 16),
              _buildDropdown("Extracurricular", extracurricular, {
                0: 'No',
                1: 'Yes',
              }, (val) => extracurricular = val),
              const SizedBox(height: 16),
              _buildDropdown("Sports", sports, {
                0: 'No',
                1: 'Yes',
              }, (val) => sports = val),
              const SizedBox(height: 16),
              _buildDropdown("Music", music, {
                0: 'No',
                1: 'Yes',
              }, (val) => music = val),
              const SizedBox(height: 16),
              _buildDropdown("Volunteering", volunteering, {
                0: 'No',
                1: 'Yes',
              }, (val) => volunteering = val),
              const SizedBox(height: 16),
              _buildDropdown("Grade Class", gradeClass, {
                1: 'Freshman',
                2: 'Sophomore',
                3: 'Junior',
                4: 'Senior',
              }, (val) => gradeClass = val),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _predictGPA,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Predict GPA"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[800],
        labelStyle: const TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
      validator: (value) => value!.isEmpty ? 'Enter $label' : null,
    );
  }

  Widget _buildDropdown(
    String label,
    int? value,
    Map<int, String> options,
    Function(int) onChanged,
  ) {
    return DropdownButtonFormField<int>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[800],
        labelStyle: const TextStyle(color: Colors.white),
      ),
      items: [
        DropdownMenuItem(
          value: null,
          child: Text(
            'Select $label',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        ...options.entries.map(
          (e) => DropdownMenuItem(value: e.key, child: Text(e.value)),
        ),
      ],
      onChanged: (val) => setState(() => onChanged(val!)),
      validator: (val) => val == null ? 'Please select $label' : null,
    );
  }
}
