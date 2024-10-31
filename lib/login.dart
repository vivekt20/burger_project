import 'package:burger_project/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Box box;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String _loginMessage = "";

  void initState() {
    super.initState();
    box = Hive.box('myBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Login",
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
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      hintText: "User Name", border: OutlineInputBorder()),
                  onChanged: (text) {
                    setState(() {
                      _loginMessage = "";
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password", border: OutlineInputBorder()),
                  onChanged: (text) {
                    setState(() {
                      _loginMessage = "";
                    });
                  },
                ),
              ),
              SizedBox(height: 45),
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
                    List<dynamic> usersListDynamic =
                        box.get('registeritemsList', defaultValue: []);

                    List<Map<String, String>> usersList = usersListDynamic
                        .map((e) => Map<String, String>.from(e as Map))
                        .toList();

                    bool userFound = false;
                    bool passwordCorrect = false;

                    for (var user in usersList) {
                      if (user['fullname'] == usernamecontroller.text) {
                        userFound = true;
                        if (user['password'] == passwordcontroller.text) {
                          passwordCorrect = true;
                          break;
                        }
                      }
                    }

                    if (userFound && passwordCorrect) {
                      setState(() {
                        _loginMessage = "Login successful";
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen()));

                      usernamecontroller.clear();
                      passwordcontroller.clear();
                    } else if (userFound) {
                      setState(() {
                        _loginMessage = "Incorrect password.";
                      });
                    } else {
                      setState(() {
                        _loginMessage = "Username not found.";
                      });
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Text("$_loginMessage"),
            ],
          ),
        ),
      ),
    );
  }
}