import 'package:flutter/material.dart';
import 'package:Sahju/localDb.dart';

class Update extends StatefulWidget {
  //const Update({super.key});
  int id;
  String website, email, password;
  Update(
      {super.key,
      required this.id,
      required this.website,
      required this.email,
      required this.password});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  var websiteValue = '';
  var emailValue = '';
  var passwordValue = '';

  @override
  void initState() {
    controller1.text = widget.website;
    controller2.text = widget.email;
    controller3.text = widget.password;
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
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
                      'Update',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    // Website name input field
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: controller1,
                        // onChanged: (value) {
                        //   setState(
                        //     () {
                        //       websiteValue = controller1.text;
                        //     },
                        //   );
                        // },
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
                        // onChanged: (value) {
                        //   setState(() {
                        //     // _grade = value;
                        //     emailValue = controller2.text;
                        //   });
                        // },
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
                        // onChanged: (value) {
                        //   setState(() {
                        //     // _grade = value;
                        //     passwordValue = controller3.text;
                        //   });
                        // },
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
                  onPressed: () async {
                    await LocalDatabase().updateData(
                        website: controller1.text,
                        emailusername: controller2.text,
                        password: controller3.text,
                        id: widget.id);
                    Navigator.pop(context, 'updated');
                  },
                  child: const Text(
                    'Update',
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
