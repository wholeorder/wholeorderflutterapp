import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/methods/common_methods.dart';
import 'package:wholeorderclient/models/requests/login_request.dart';
import 'package:wholeorderclient/providers/auth_provider.dart';
import 'package:wholeorderclient/screens/register/register.dart';
import 'package:wholeorderclient/utils/title.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isactive = false;
  bool isPasswordVisible = false;
  final CommonMethods commonMethods = CommonMethods();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(updateActiveState);
    passwordController.addListener(updateActiveState);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void updateActiveState() {
    final isActive =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    setState(() {
      isactive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    login() {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      LoginRequest loginRequest = LoginRequest(
          email: emailController.text, password: passwordController.text);
      var result = ap.loginProvider(loginRequest, context);
      return result;
    }

    checkConnectivity() {
      commonMethods.checkConnectivity(context);
      login();
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 250, 252, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'images/logo.png',
                  width: 192,
                  height: 106,
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: TitleText(
                      data: 'Connectez-vous à votre compte',
                      color: Colors.black,
                      size: 16,
                      weight: FontWeight.normal,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      fontFamily: 'Inter')),
              SizedBox(
                height: 60,
              ),
              TitleText(
                data: "Email",
                color: Colors.black,
                size: 16,
                weight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: InputDecoration(
                    hintText: '',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TitleText(
                data: "Password",
                color: Colors.black,
                size: 16,
                weight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
              SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: passwordController,
                    onChanged: (value) {
                      updateActiveState();
                    },
                    decoration: InputDecoration(
                      // labelText: "Password",
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 3.0,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                  )),
              TextButton(
                onPressed: () {
                  // Handle the action when the user presses "Forgot password"
                  print('Forgot password');
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: AppColors.myColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  children: [
                    greyLine(38),
                    Padding(padding: EdgeInsets.only(right: 2)),
                    Text(
                      ' Or',
                      style: TextStyle(color: Color(0xFFD9D9D9)),
                      textAlign: TextAlign.center,
                    ),
                    greyLine(14),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: Color.fromARGB(249, 245, 243, 243),
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/googleLogo.png',
                        width: 20,
                      ),
                      TitleText(
                        data: 'Sign in with Google',
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.normal,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        fontFamily: 'Inter',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleText(
                      data: 'Don\'t have an account?',
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.normal,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      fontFamily: 'Inter',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text('Sign up'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: isactive
                    ? () {
                        checkConnectivity();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                 // onSurface: AppColors.myColor,
                  backgroundColor: AppColors.myColor,
                ),
                child: Container(
                  width: 400,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container greyLine(double valMargin) {
    return Container(
      width: 133,
      height: 1,
      color: Color(0xFFD9D9D9),
      margin: EdgeInsets.only(left: valMargin),
    );
  }
}
