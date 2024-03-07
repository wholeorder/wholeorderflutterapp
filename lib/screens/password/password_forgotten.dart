import 'package:flutter/material.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/utils/title.dart';

class PasswordForget extends StatefulWidget {
  const PasswordForget({super.key});

  @override
  State<PasswordForget> createState() => _PasswordForgetState();
}

class _PasswordForgetState extends State<PasswordForget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 250, 252, 1),
      body: SafeArea(child: 
      Padding(padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
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
            SizedBox(height: 20,),
            TitleText(
            data: "Mot de passe oublié ?",
            color: Colors.black,
            size: 24,
            weight: FontWeight.normal,
            maxLines: 2,
            overflow: TextOverflow.clip,
            fontFamily: 'Inter',
          ),
           SizedBox(
              height: 10,
          ),
          TitleText(
            data: "Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe",
            color: Colors.black,
            size: 12,
            weight: FontWeight.normal,
            maxLines: 1,
            overflow: TextOverflow.clip,
            fontFamily: 'Inter',
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.white,
              child: Padding( padding: EdgeInsets.only(top: 10 , left: 20),
                child: Align(alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('images/message.png') ,
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(data: 'Par sms:', color: Colors.black, size: 12, weight: FontWeight.normal, maxLines: 1, overflow: TextOverflow.clip, fontFamily: 'Inter'),
                       SizedBox(height: 10,),
                        Row(children: [
                          Icon(
                            Icons.circle,
                            color: Colors.black12,
                            size: 10,
                          ),
                          Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                         Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        TitleText(data: '00', color: Colors.black, size: 12, weight: FontWeight.normal, maxLines: 1, overflow: TextOverflow.clip, fontFamily: 'Inter'),
                
                        ],)
                      ],
                    )
                  ],
                ) ,),
              ),
            ),

          )
           ,
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.white,
              child: Padding( padding: EdgeInsets.only(top: 10 , left: 20),
                child: Align(alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('images/email.png') ,
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(data: 'Par email:', color: Colors.black, size: 12, weight: FontWeight.normal, maxLines: 1, overflow: TextOverflow.clip, fontFamily: 'Inter'),
                       SizedBox(height: 10,),
                        Row(children: [
                         Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                         Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.black12,
                          size: 10,
                        ),
                        TitleText(data: '@gmail.com', color: Colors.black, size: 12, weight: FontWeight.normal, maxLines: 1, overflow: TextOverflow.clip, fontFamily: 'Inter'),
                
                        ],)
                      ],
                    )
                  ],
                ) ,),
              ),
            ),

          )
        
        ],
      ),)
      ),
    );
  }
}