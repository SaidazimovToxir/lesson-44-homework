import 'package:flutter/material.dart';
import 'package:lesson44/controllers/company_controller.dart';
import 'package:lesson44/models/employee.dart';
import 'package:lesson44/views/widgets/company_widgets.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final _controller = CompanyContoller();

  @override
  void initState() {
    super.initState();
    _controller.getProducts();
  }

  void _editEmployee(int index) {
    final employee = _controller.list[0].employees[index];
    TextEditingController nameController =
        TextEditingController(text: employee.name);
    TextEditingController ageController =
        TextEditingController(text: employee.age.toString());
    TextEditingController positionController =
        TextEditingController(text: employee.position);
    TextEditingController skillsController =
        TextEditingController(text: employee.skills.join(', '));

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Employee'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(nameController, 'Name'),
                _buildTextField(ageController, 'Age', TextInputType.number),
                _buildTextField(positionController, 'Position'),
                _buildTextField(skillsController, 'Skills (vergul, comma)'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  employee.name = nameController.text;
                  employee.age = int.parse(ageController.text);
                  employee.position = positionController.text;
                  employee.skills = skillsController.text
                      .split(',')
                      .map((skill) => skill.trim())
                      .toList();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteEmployee(int index) {
    setState(() {
      _controller.deleteEmployee(index);
    });
  }

  void _addEmployee() {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController positionController = TextEditingController();
    TextEditingController skillsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Employee'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(nameController, 'Name'),
                _buildTextField(ageController, 'Age', TextInputType.number),
                _buildTextField(positionController, 'Position'),
                _buildTextField(skillsController, 'Skills (comma separated)'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final newEmployee = Employee(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    position: positionController.text,
                    skills: skillsController.text
                        .split(',')
                        .map((skill) => skill.trim())
                        .toList(),
                  );
                  _controller.addEmployee(newEmployee);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _controller.list[0];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        title: const Text(
          "Information",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CompanyWidgets(name: data.company, title: "Company:"),
                    const SizedBox(height: 10),
                    CompanyWidgets(name: data.location, title: "Location:"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Employees",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10.0),
                itemCount: data.employees.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              data.employees[i].name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              "Age: ${data.employees[i].age}  •  Position: ${data.employees[i].position}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () => _editEmployee(i),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _deleteEmployee(i),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.blue.shade400),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              "Skills",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 8.0,
                            children: data.employees[i].skills
                                .map((skill) => Chip(
                                      side: BorderSide.none,
                                      label: Text(skill),
                                      backgroundColor: Colors.blue.shade400,
                                      labelStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEmployee,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue.shade400,
      ),
    );
  }
}
