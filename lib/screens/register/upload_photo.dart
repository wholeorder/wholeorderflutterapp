import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/utils/title.dart';
import 'package:file_picker/file_picker.dart';
import 'package:wholeorderclient/utils/utils.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  bool isactive = false;

  File? logoEntreprise;
  File? photoProfle;

  Future<void> selectLogo() async {
    logoEntreprise = await pickImage(context);
    setState(() {});
  }

  Future<void> selectPhoto() async {
    photoProfle = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10 , left: 10 ,right: 10 ,bottom: 30),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start,
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
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/logo.png',
                  width: 192,
                  height: 106,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TitleText(
                  data: 'Téléchargez votre photo de profile',
                  color: Colors.black,
                  size: 16,
                  weight: FontWeight.normal,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    // color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              selectLogo();
                            },
                            child: logoEntreprise == null
                                ? Image.asset(
                                    'images/group.png',
                                    width: 50,
                                    height: 50,
                                  )
                                //backgroundColor: Colors.,

                                : Image.file(logoEntreprise! , width: 50 , height: 50,),

                            /* CircleAvatar(
                            backgroundImage: FileImage(logoEntreprise!),
                            radius: 60,
                          ), */
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TitleText(
                                data: 'Logo de votre entreprise',
                                color: Colors.black,
                                size: 12,
                                weight: FontWeight.normal,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                fontFamily: 'Inter'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    //color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              selectPhoto();
                            },
                            child: photoProfle == null
                                ? Image.asset(
                                    'images/gallery.png',
                                    width: 50,
                                    height: 50,
                                  )
                                //backgroundColor: Colors.,

                                : Image.file(photoProfle!, width: 50 , height: 50,),

                            /* CircleAvatar(
                            backgroundImage: FileImage(logoEntreprise!),
                            radius: 60,
                          ), */
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TitleText(
                                data: 'Votre photo profile',
                                color: Colors.black,
                                size: 12,
                                weight: FontWeight.normal,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                fontFamily: 'Inter'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //Expanded(child: widget),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: logoEntreprise !=null && photoProfle !=null ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      onSurface:  Colors.white,
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: AppColors.myColor
                      )
                    ),
                    child: Container(
                      width: 100,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          'Ignorer',
                          style: TextStyle(color: AppColors.myColor),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: logoEntreprise != null && photoProfle != null ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      onSurface: AppColors.myColor,
                      backgroundColor: AppColors.myColor,
                    ),
                    child: Container(
                      width: 100,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          'Ignorer',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ]),
        ),
      ),
    );
  }
}
