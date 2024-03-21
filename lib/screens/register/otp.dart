import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/methods/common_methods.dart';
import 'package:wholeorderclient/models/requests/verifyotp_request.dart';
import 'package:wholeorderclient/providers/auth_provider.dart';
import 'package:wholeorderclient/utils/title.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool isactive = false;
  CommonMethods commonMethods = CommonMethods();
  final TextEditingController otpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    void verifyOtp() {
      final app = Provider.of<AuthProvider>(context, listen: false);
      VerifyOtpRequest verifyOtpRequest = VerifyOtpRequest(
          email: app.getEmail, otp: otpController.text);
      print('eamil :${app.getEmail}');
      print(currentText);

      var result = app.validationCodeProvider(verifyOtpRequest, context);
    }

    void checkConnection() {
      commonMethods.checkConnectivity(context);
      verifyOtp();
    }

    return Scaffold(
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
                    )),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TitleText(
              data: 'OTP Vérification',
              color: Colors.black,
              size: 20,
              weight: FontWeight.bold,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontFamily: 'Inter',
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: TitleText(
                data:
                    'Veuillez saisir le code de vérification  envoyé à votre adresse mail massar33@gmail.com',
                color: Colors.black,
                size: 12,
                weight: FontWeight.normal,
                maxLines: 2,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 30,
                ),
                child: PinCodeTextField(
                  controller: otpController ,
                  appContext: context,
                  length: 4,
                  onCompleted: (value) {
                    //authProvider.authMobileResponse!.codeAuto = value;
                    // otpSaisitState.updateOtpSaisit(value);
                    setState(() {
                      currentText = value;
                      isactive = true;
                    });
                  },
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedFillColor: Colors.teal,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    activeColor: Colors.black,
                    activeFillColor: Colors.grey,
                    disabledColor: Colors.grey,
                    inactiveColor: Colors.grey,
                    inactiveFillColor: Colors.grey,
                    fieldHeight: 48,
                    fieldWidth: 48,
                  ),
                  keyboardType: TextInputType.number,
                ),

                /*  PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: true,
                  obscuringCharacter: '*',
                  obscuringWidget: Icon(
                    Icons.star,
                    size: 20,
                  ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.myColor,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      inactiveFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      selectedColor: AppColors.myColor,
                      inactiveColor: AppColors.myColor,
                      selectedFillColor: AppColors.myColor
                      // selectedFillColor: Colors.white
                      ),
                  cursorColor: AppColors.myColor,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                    setState(() {
                      isactive = true;
                    });
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    
                    return true;
                  },
                ), */
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: TitleText(
                data: 'Vous n avez pas recu le code',
                color: Colors.black,
                size: 12,
                weight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
            ),
            Center(
                child: TextButton(
              onPressed: () {},
              child: TitleText(
                data: 'Renvoyer code',
                color: AppColors.myColor,
                size: 14,
                weight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
            )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: isactive
                  ? () {
                      checkConnection();
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
                    'Suivant',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
