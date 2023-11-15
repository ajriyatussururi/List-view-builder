import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Validasi input
                if (nameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Please fill in all fields.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Navigasi ke halaman berisi data dummy jika input valid
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DummyDataPage(),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DummyDataPage extends StatefulWidget {
  @override
  _DummyDataPageState createState() => _DummyDataPageState();
}

class _DummyDataPageState extends State<DummyDataPage> {
  List<String> dummyData = [
    'Gelang Kupu-Kupu',
    'Gelang Tali Serut Batu Kerikil',
    'Gelang Manik Pastel',
    'Gelang Tali Adjustable',
    'Gelang Tangan Rhodium',
    'Gelang Mutiara',
    'Gelang Titanium Silver',
    'Gelang Alphabet Gold',
    'Gelang Tali Kepang Pink',
    'Gelang Serut Silver',
  ];
  TextEditingController newItemController = TextEditingController();

  void addDummyData(String newItem) {
    setState(() {
      dummyData.add(newItem);
    });
  }

  void deleteDummyData(int index) {
    setState(() {
      dummyData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Data Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dummyData[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteDummyData(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newItemController,
                    decoration: InputDecoration(
                      hintText: 'Enter new item',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addDummyData(newItemController.text);
                    newItemController.clear();
                  },
                  child: Text('Add Dummy Data'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
