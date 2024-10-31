import 'package:burger_project/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late Box box;
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  List<Map<String, String>> registerItems = [];
  String _registrationmessage = "";

  @override
  void initState() {
    super.initState();
    box = Hive.box('myBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("SignUp"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "CREATE NEW ACCOUNT",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 80),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: fnamecontroller,
                    decoration: InputDecoration(
                        hintText: "Full Name", border: OutlineInputBorder()),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        hintText: "Email", border: OutlineInputBorder()),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        hintText: "Password", border: OutlineInputBorder()),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    controller: cpasswordcontroller,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder()),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: phonecontroller,
                    decoration: InputDecoration(
                        hintText: "Phone Number", border: OutlineInputBorder()),
                  )),
              SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      if (fnamecontroller.text.isEmpty ||
                          emailcontroller.text.isEmpty ||
                          passwordcontroller.text.isEmpty ||
                          cpasswordcontroller.text.isEmpty ||
                          phonecontroller.text.isEmpty) {
                        _registrationmessage = "All fields are required.";
                        return;
                      }

                      if (passwordcontroller.text != cpasswordcontroller.text) {
                        _registrationmessage = "Passwords do not match.";
                        return;
                      }

                      // If all validations pass, proceed with registration
                      registerItems.add({
                        'fullname': fnamecontroller.text,
                        'email': emailcontroller.text,
                        'password': passwordcontroller.text,
                        'cpassword': cpasswordcontroller.text,
                        'phonenumber': phonecontroller.text
                      });

                      box.put(
                        'registeritemsList',
                        registerItems
                            .map((e) => Map<String, dynamic>.from(e))
                            .toList(),
                      );

                      // Clear input fields and set success message
                      fnamecontroller.clear();
                      emailcontroller.clear();
                      passwordcontroller.clear();
                      cpasswordcontroller.clear();
                      phonecontroller.clear();
                      _registrationmessage = "Registration Successful";

                      // Navigate to the login page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen()));
                    });

                    print("Registered Items: $registerItems");
                  },
                  child: Text(
                    "Sign UP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Text("$_registrationmessage"),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an Account?"),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}