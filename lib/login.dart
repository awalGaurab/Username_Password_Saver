import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loginPasswordVisibility = false;

  void loginPasswordVisibilityHandler() {
    setState(() {
      loginPasswordVisibility = !loginPasswordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Image(
                  image: AssetImage('assets/logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                ),
                Text(
                  'Point It!',
                  style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Loyalty Rewards!',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text('Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 95, 177, 98),
                    )),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(
          //           borderSide: BorderSide(
          //               color: Colors.green,
          //               width: 2.5,
          //               style: BorderStyle.solid)),
          //       labelText: 'Email or Mobile no.',
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email or Mobile no.',
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.green.shade500,
                      width: 5),
                ),
                suffixIcon: IconButton(
                  color: Colors.green.shade500,
                  icon: Icon(loginPasswordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off),
                  tooltip: 'Show Password',
                  onPressed: () {
                    loginPasswordVisibilityHandler();
                  },
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

          // Container(
          //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          //   child: TextField(
          //     obscureText: true,
          //     // controller: passwordController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'Password',
          //     ),
          //   ),
          // ),
          TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.green.shade500),
                ),
              )),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: BorderSide(width: 3, color: Colors.green.shade500),
              ),
              onPressed: () {
                // print(nameController.text);
                // print(passwordController.text);
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.green.shade500, fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: BorderSide(width: 3, color: Colors.green.shade500),
              ),
              onPressed: () {
                // print(nameController.text);
                // print(passwordController.text);
              },
              child: Text(
                'Create a new Account !',
                style: TextStyle(color: Colors.green.shade500, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                10, 0, 10, 0), //apply paddig to all four sides
            child: Text(
              "By continuing, you agree with Terms and Conditions and Privacy Policy, Community Guidelines.",
              style: TextStyle(
                color: Colors.green.shade500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
