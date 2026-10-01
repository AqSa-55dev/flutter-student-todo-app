import 'package:flutter/material.dart';
import 'package:to_do_app/components/custom_text_field.dart';
import 'students_info.dart'; // Ensure path matches your project structure

class EditStudentList extends StatefulWidget {
  final StudentsInfo studentModelToEdit; // Pass the student object to edit

  const EditStudentList({
    super.key,
    required this.studentModelToEdit,
  });

  @override
  State<EditStudentList> createState() => _EditStudentListState();
}

class _EditStudentListState extends State<EditStudentList> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Prefill text fields with existing student details
    nameController.text = widget.studentModelToEdit.name;
    fatherNameController.text = widget.studentModelToEdit.fatherName;
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    super.dispose();
  }

  void saveStudent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;

    if (name.isNotEmpty && fatherName.isNotEmpty) {
      // Retain the existing studentId while updating name and fatherName
      final updatedStudent = StudentsInfo(
        studentId: widget.studentModelToEdit.studentId,
        name: name,
        fatherName: fatherName,
      );

      // Return updated student back to main screen
      Navigator.pop(context, updatedStudent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display existing Student ID at top
            Text(
              'ID: ${widget.studentModelToEdit.studentId}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(componentController: nameController, hintText: 'Enter Name',),
            const SizedBox(height: 20),
            CustomTextField(componentController: fatherNameController, hintText: 'Enter Father Name',),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                saveStudent();
              },
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Colors.white, size: 25),
                    SizedBox(width: 8),
                    Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}