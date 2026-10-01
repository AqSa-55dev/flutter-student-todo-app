import 'dart:math';
import 'package:flutter/material.dart';
import 'package:to_do_app/components/custom_text_field.dart';
import 'package:to_do_app/students_info.dart';
import 'package:to_do_app/components/custom_buttons.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  void saveStudent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;
    if(name.isNotEmpty||fatherName.isNotEmpty) {
      final newStudent = StudentsInfo(name: name,
          fatherName: fatherName,
          studentId: Random().nextInt(1000000));


      // Pops back to student list with data
      Navigator.pop(context, newStudent);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text ("Name and Father Name Can't be empty"),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.black87,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(componentController: nameController, hintText: 'Enter Name',),
            const SizedBox(height: 20),
            CustomTextField(componentController: fatherNameController, hintText: 'Enter Father Name',),
            const SizedBox(height: 30),
            CustomButtons(
              onButtonTap: () {
                saveStudent();
              },
              label: 'Add',), //buttonIcon: Icons.add,),

            // InkWell(
            //   onTap: () {
            //     saveStudent();
            //   },
            //   child: Container(
            //     height: 50,
            //     width: 180,
            //     decoration: BoxDecoration(
            //       color: Colors.blueAccent,
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: const Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(Icons.add, color: Colors.white, size: 25),
            //         Text(
            //           'Add',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}