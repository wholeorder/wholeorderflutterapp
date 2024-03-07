import 'package:flutter/material.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/utils/title.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
  bool isactive = false ;
  late TextEditingController passwordController = TextEditingController();
    late TextEditingController password2Controller = TextEditingController();

  late TextEditingController emailController = TextEditingController(); 
  bool isPasswordVisible = false;


  void updateActiveState() {
    final isActive = emailController.text.isNotEmpty &&
    passwordController.text.isNotEmpty &&
          password2Controller.text.isNotEmpty;
    setState(() {
      isactive = isActive;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
    emailController.addListener(updateActiveState);
    passwordController.addListener(updateActiveState);
    password2Controller.addListener(updateActiveState);

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

    return  Scaffold(
      backgroundColor: Color.fromRGBO(248, 250, 252, 1),

      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColors.backbutton,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Icon(
                        Icons.arrow_back,
                        color: AppColors.myColor,

                      )),
                    )
                  ),
                ],
               ),
               SizedBox(height: 30,),
                TitleText(
                data: "Réinitialiser votre mot de passe ",
                color: Colors.black,
                size: 24,
                weight: FontWeight.bold,
                maxLines: 2,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
               SizedBox(height: 20,),
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
                    hintText: 'Entrer votre email',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.white,
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 3.0,color: Colors.grey.shade200
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
                  hintText: 'Entrer le mot de passe',
                  fillColor: Colors.white,
                  focusColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 3.0,color: Colors.grey.shade200
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
              )
            ),
              SizedBox(
                height: 20,
              ),
              TitleText(
                data: "Confirmer mot de passe",
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
              controller: password2Controller,
              onChanged: (value) {
                updateActiveState();
              },
              decoration: InputDecoration(
                // labelText: "Password",
                hintText: 'Entrer le mot de passe',
                fillColor: Colors.white,
                focusColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      width: 3.0, color: Colors.grey.shade200),
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
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: isactive ? () {} : null,
              style: ElevatedButton.styleFrom(
                onSurface: AppColors.myColor,
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
                    'S inscrire',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )
        )
      )
    );
  }
}