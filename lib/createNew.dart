import 'package:flutter/material.dart';
import 'package:Sahju/home.dart';
import 'package:Sahju/localDb.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class Createnew extends StatefulWidget {
  const Createnew({super.key});

  @override
  State<Createnew> createState() => _CreatenewState();
}

class _CreatenewState extends State<Createnew> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  var websiteValue = '';
  var emailValue = '';
  var passwordValue = '';

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
  }

  void saveClickHandler() {
    setState(() {
      AlertDialog alert = const AlertDialog(
        title: Text("Notice"),
        content: Text(
            "Launching this missile will destroy the entire universe. Is this what you intended to do?"),
      );
      //AlertDialog('Save button clicked'),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAHJU'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 90, 216, 97),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              // shadowColor: const Color.fromARGB(255, 78, 215, 149),
              shadowColor: Colors.green.shade500,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 20, 5, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Create a new',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    // Website name input field
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: controller1,
                        onChanged: (value) {
                          setState(() {
                            // _grade = value;
                            websiteValue = controller1.text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Website',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.green.shade500,
                                width: 5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.green.shade500,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // User ID/Email
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: controller2,
                        onChanged: (value) {
                          setState(() {
                            // _grade = value;
                            emailValue = controller2.text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Email/Username',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.green.shade500,
                                width: 5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.green.shade500,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Password input field
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: controller3,
                        onChanged: (value) {
                          setState(() {
                            // _grade = value;
                            passwordValue = controller3.text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.green.shade500,
                                width: 5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.green.shade500,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Save button
              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade500,
                    shape: const StadiumBorder(),
                    side: BorderSide(width: 3, color: Colors.green.shade500),
                  ),
                  // onPressed: () => showDialog<String>(
                  //   context: context,
                  //   builder: (BuildContext context) => AlertDialog(
                  //     actions: <Widget>[
                  //       Text(websiteValue),
                  //       Text(emailValue),
                  //       Text(passwordValue),
                  //     ],
                  //   ),
                  // ),
                  onPressed: () async {
                    await LocalDatabase().addDataToDatabase(
                        website: websiteValue,
                        emailusername: emailValue,
                        password: passwordValue);
                    Navigator.pop(context, 'created');
                  },

                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              // Create  button
              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade500,
                    shape: const StadiumBorder(),
                    side: BorderSide(width: 3, color: Colors.green.shade500),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
