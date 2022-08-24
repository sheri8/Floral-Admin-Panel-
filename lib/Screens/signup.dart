import 'package:floral/Screens/login.dart';
// import 'package:floral/resources/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Utils/utils.dart';
import '../resources/auth_methods.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController C_email = TextEditingController();

  TextEditingController P_password = TextEditingController();
  bool _isLoading = false;

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authmethods().signUpUser(
      email: C_email.text,
      password: P_password.text,
    );
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginAdmin()
            // ResponsiveLayout(
            //   webScreenLayout: WebScreenLayout(),
            //   mobileScreenLayout: MobileScreenLayout(),
            // ),
            ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    C_email.dispose();
    P_password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
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
                          'SignUp',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: C_email,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: 'Email'),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: P_password,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffix: Text(
                                'Show',
                                style: TextStyle(color: Colors.blue),
                              ),
                              // 'Show',
                              suffixStyle:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                              // style: TextStyle(color: Colors.blue, fontSize: 20),
                              labelText: 'Password'),
                        ),
                        SizedBox(height: 24),

                        // SizedBox(height: 60),
                        Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          margin: EdgeInsets.only(top: 60, bottom: 20),
                          child: ElevatedButton(
                              onPressed: () {
                                signUpUser();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (builder) => LoginAdmin()));
                              },
                              child: Text(
                                'Register',
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
          ],
        ),
      ),
    );
  }
}
