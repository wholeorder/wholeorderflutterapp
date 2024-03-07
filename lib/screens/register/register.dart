import 'package:flutter/material.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/screens/register/entreprise_info.dart';
import 'package:wholeorderclient/utils/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Type _selectedSegment = Type.entreprise;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController prenomController;
  late TextEditingController nomController;
  bool isactive = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    prenomController = TextEditingController();
    nomController = TextEditingController();
    emailController.addListener(updateActiveState);
    passwordController.addListener(updateActiveState);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    prenomController.dispose();
    nomController.dispose();
    super.dispose();
  }

  void updateActiveState() {
    final isActive = emailController.text.isNotEmpty && passwordController.text.isNotEmpty && 
        prenomController.text.isNotEmpty && nomController.text.isNotEmpty;
    setState(() {
      isactive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 250, 252, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Ensure children expand horizontally
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
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 20),
              CupertinoSlidingSegmentedControl<Type>(
                backgroundColor: Colors.grey.shade100,
                thumbColor: TypeColors[_selectedSegment]!,
                groupValue: _selectedSegment,
                onValueChanged: (Type? value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  }
                },
                children: const <Type, Widget>{
                  Type.entreprise: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'entreprise',
                      style: TextStyle(color: CupertinoColors.black),
                    ),
                  ),
                  Type.fournisseur: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'fournisseur',
                      style: TextStyle(color: CupertinoColors.black),
                    ),
                  ),
                },
              ),
              SizedBox(height: 20), // Adjusted height to provide spacing
              if (_selectedSegment == Type.entreprise)
                Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Ensure children align to the start
                  children: [
                    Row(
                       mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                     // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 80,
                          //width: width/2-20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                data: "Prenom",
                                color: Colors.black,
                                size: 14,
                                weight: FontWeight.normal,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                fontFamily: 'Inter',
                              ),
                              SizedBox(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  controller: prenomController,
                                  onChanged: (value) {
                                    updateActiveState();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Prenom',
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    fillColor: Colors.grey.shade100,
                                    focusColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 3.0,color: Colors.grey.shade200
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                         // width:  width / 2 - 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                data: "Nom",
                                color: Colors.black,
                                size: 14,
                                weight: FontWeight.normal,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                fontFamily: 'Inter',
                              ),
                              SizedBox(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  controller: nomController,
                                  onChanged: (value) {
                                    updateActiveState();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Nom',
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    fillColor: Colors.grey.shade100,
                                    focusColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 3.0,color: Colors.grey.shade200
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                          hintText: 'Entrer votre email',
                          labelStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.grey.shade100,
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
                            fillColor: Colors.grey.shade100,
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
                      height: 40,
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
                            onPressed: () {},
                            child: Text('Sign up'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: isactive 
                      ? () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> EntrepriseInfo()));
                      } 
                      : null,
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
                ),
              if (_selectedSegment == Type.fournisseur)
                Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Ensure children align to the start
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 80,
                          //width: width/2-20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                data: "Prenom",
                                color: Colors.black,
                                size: 14,
                                weight: FontWeight.normal,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                fontFamily: 'Inter',
                              ),
                              SizedBox(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  controller: prenomController,
                                  onChanged: (value) {
                                    updateActiveState();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Prenom',
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    fillColor: Colors.grey.shade100,
                                    focusColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 3.0,color: Colors.grey.shade100
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          // width:  width / 2 - 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                data: "Nom",
                                color: Colors.black,
                                size: 14,
                                weight: FontWeight.normal,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                fontFamily: 'Inter',
                              ),
                              SizedBox(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  controller: nomController,
                                  onChanged: (value) {
                                    updateActiveState();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Nom',
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    fillColor: Colors.grey.shade100,
                                    focusColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 3.0,color: Colors.grey.shade200
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                          hintText: 'Entrer votre email',
                          labelStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.grey.shade100,
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
                      data: "Passwor",
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
                            fillColor: Colors.grey.shade100,
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
                        )),
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
                      height: 40,
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
                            onPressed: () {},
                            child: Text('Sign up'),
                          ),
                        ],
                      ),
                    ),
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

enum Type { entreprise, fournisseur }

Map<Type, Color> TypeColors = <Type, Color>{
  Type.entreprise: Colors.grey.shade300,
  Type.fournisseur: Colors.grey.shade300,
  //Type.cerulean: const Color(0xff007ba7),
};
