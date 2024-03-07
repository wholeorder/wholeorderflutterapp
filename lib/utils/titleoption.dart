

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleOption extends Text {

  TitleOption({
    required data ,
    required Color color ,
    required double size ,
    required FontWeight weight ,
    FontStyle? style , }) 
  :super(
    data,
    style : GoogleFonts.salsa(
      color: color ,
      fontSize:size ,
      fontWeight :weight ,
    )
     
    
  );

}