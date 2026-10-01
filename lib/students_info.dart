import 'package:flutter/material.dart';
import 'add_students.dart';
import 'edit_student_list.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentListState(),
    ),
  );
}

// Model
class StudentsInfo {
  int studentId;
  String name;
  String fatherName;
  List<String>? subjects;

  StudentsInfo({
    required this.studentId,
    required this.name,
    required this.fatherName,
    this.subjects,
  });
}

class StudentListState extends StatefulWidget {
  const StudentListState({super.key});

  @override
  State<StudentListState> createState() => _StudentListState();
}

class _StudentListState extends State<StudentListState> {
  List<StudentsInfo> students = [
    StudentsInfo(studentId: 1, name: 'Aqsa', fatherName: 'Basheer'),
    StudentsInfo(studentId: 2, name: 'Hudaibia', fatherName: 'Feroz'),
    StudentsInfo(studentId: 3, name: 'Anmol', fatherName: 'Daim'),
  ];

  void removeStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  //editStudent to take the index and update state on result
  void editStudent(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditStudentList(
          studentModelToEdit: students[index],
        ),
      ),
    );

    // If an updated student object is returned, update the list
    if (result != null && result is StudentsInfo) {
      setState(() {
        students[index] = result;
      });
    }
  }

  //studentCard to use named arguments
  Widget studentCard({
    required StudentsInfo studentObject,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column to stack Name and FatherName vertically
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Student ID: ${studentObject.studentId}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Name: ${studentObject.name}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'FatherName: ${studentObject.fatherName}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Action Buttons
          Row(
            spacing: 10,
            children: [
              // Connected edit icon onTap to editStudent(index)
              InkWell(
                onTap: () {
                  editStudent(index);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit),
                ),
              ),
              InkWell(
                onTap: () {
                  removeStudent(index);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addStudent() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddStudents()),
    );

    if (result != null && result is StudentsInfo) {
      setState(() {
        students.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('TO DO LIST'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Students',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              itemCount: students.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // Pass named arguments to studentCard
                return studentCard(
                  studentObject: students[index],
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          addStudent();
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.add, color: Colors.black, size: 30),
        ),
      ),
    );
  }
}