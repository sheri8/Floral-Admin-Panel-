import 'package:floral/Screens/home.dart';
import 'package:floral/Screens/signup.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';
import '../resources/auth_methods.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isLoading = false;
  bool _obscured = false;
  final textFieldFocusNode = FocusNode();

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authmethods()
        .loginUser(email: _email.text, password: _password.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Home()
            //  ResponsiveLayout(
            //   webScreenLayout: WebScreenLayout(),
            //   mobileScreenLayout: MobileScreenLayout(),
            // ),
            ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text(
                    'Admin Login',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email'),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    obscureText: _obscured,
                    controller: _password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscured
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                        // suffix: Text(
                        //   'Show',
                        //   style: TextStyle(color: Colors.blue),
                        // ),
                        // suffixStyle:
                        //     TextStyle(color: Colors.blue, fontSize: 20),
                        labelText: 'Password'),
                  ),
                  SizedBox(height: 24),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         'Forgot passcode?',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 15,
                  //             color: Colors.blue),
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (builder) => SignUp()));
                  //       },
                  //       child: Text(
                  //         'SignUp',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 15,
                  //             color: Colors.blue),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Container(
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    margin: EdgeInsets.only(top: 60, bottom: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          loginUser();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (builder) => Home()));
                        },
                        child: _isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          primary: Color(0xffF4C2C2),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
