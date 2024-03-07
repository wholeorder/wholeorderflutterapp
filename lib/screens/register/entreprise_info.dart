import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/utils/title.dart';
import 'package:dropdown_cupertino/dropdown_cupertino.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EntrepriseInfo extends StatefulWidget {
  const EntrepriseInfo({super.key});

  @override
  State<EntrepriseInfo> createState() => _EntrepriseInfo();
}

class _EntrepriseInfo extends State<EntrepriseInfo> {
  final List<String> genderItems = [
    'pomme',
    'banane',
  ];

  String? selectedValue;
  List<String> selectedValues = [];
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  String countryCode = "";
  String number = "";

  late TextEditingController nomcommercialController;
  late TextEditingController nomentrepriseController;
  late TextEditingController prenomController;
  late TextEditingController nomController;
  late TextEditingController addressController;

  bool isactive = false;
  bool isnomentrepriseVisible = false;

  @override
  void initState() {
    super.initState();
    nomcommercialController = TextEditingController();
    nomentrepriseController = TextEditingController();
    //prenomController = TextEditingController();
    //nomController = TextEditingController();
    addressController = TextEditingController();
    // prenomController.addListener(updateActiveState);
    //nomController.addListener(updateActiveState);
    nomcommercialController.addListener(updateActiveState);
    nomentrepriseController.addListener(updateActiveState);
    addressController.addListener(updateActiveState);
  }

  @override
  void dispose() {
    nomcommercialController.dispose();
    nomentrepriseController.dispose();
    // prenomController.dispose();
    // nomController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void updateActiveState() {
    final isActive = nomcommercialController.text.isNotEmpty &&
        nomentrepriseController.text.isNotEmpty &&
        /*  selectedValues.isNotEmpty && */
        addressController.text.isNotEmpty;
    setState(() {
      isactive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                data: 'Information du fournisseur',
                color: Colors.black,
                size: 16,
                weight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TitleText(
              data: "Nom commercial",
              color: Colors.black,
              size: 12,
              weight: FontWeight.normal,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontFamily: 'Inter',
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: nomcommercialController,
                onChanged: (value) {
                  updateActiveState();
                },
                decoration: InputDecoration(
                  hintText: 'Nom commercial',
                  labelStyle: TextStyle(color: Colors.black38),
                  fillColor: Colors.grey.shade100,
                  focusColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(width: 3.0, color: Colors.grey.shade200),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TitleText(
              data:
                  "Nom de l’entreprise (si elle est différente du nom commerciale)",
              color: Colors.black,
              size: 12,
              weight: FontWeight.normal,
              maxLines: 2,
              overflow: TextOverflow.clip,
              fontFamily: 'Inter',
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: nomentrepriseController,
                onChanged: (value) {
                  updateActiveState();
                },
                decoration: InputDecoration(
                  hintText: 'Nom commercial',
                  labelStyle: TextStyle(color: Colors.black38),
                  fillColor: Colors.grey.shade100,
                  focusColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(width: 3.0, color: Colors.grey.shade200),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TitleText(
              data: "Catégorie d’entreprise",
              color: Colors.black,
              size: 12,
              weight: FontWeight.normal,
              maxLines: 2,
              overflow: TextOverflow.clip,
              fontFamily: 'Inter',
            ),
            DropdownButtonFormField2<List<String>>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              hint: selectedValues.isEmpty
                  ? Text(
                      'Select Your categories',
                      style: TextStyle(fontSize: 14),
                    )
                  : Text(
                      selectedValues.toString(),
                      style: TextStyle(fontSize: 14),
                    ),
              items: genderItems
                  .map((item) => DropdownMenuItem<List<String>>(
                        value: [item],
                        child: CheckboxListTile(
                          title: Text(
                            item,
                            style: const TextStyle(fontSize: 14),
                          ),
                          value: selectedValues.contains(item),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                if (!selectedValues.contains(item)) {
                                  // Check if the item is not already selected
                                  selectedValues.add(item);
                                  print(selectedValues);
                                }
                              } else {
                                selectedValues.remove(item);
                              }
                            });
                          },
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) {},
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),

           
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 70,
              //width: ,
              child: IntlPhoneField(
                initialCountryCode: 'SN',
                decoration: InputDecoration(
                  //labelText: "entrer votre numéro",
                  hintText: "Entrer votre numéro",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (phoneNumber) {
                  setState(() {
                    this.phoneNumber = phoneNumber.number;
                    this.countryCode = phoneNumber.countryISOCode!;
                    this.number = phoneNumber.number!;
                    print(
                        'la valeur de phone :${this.phoneNumber} ,la valeur de cn ${this.countryCode} la valeur du numero juste${number}');
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TitleText(
              data: "address",
              color: Colors.black,
              size: 12,
              weight: FontWeight.normal,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontFamily: 'Inter',
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: addressController,
                onChanged: (value) {
                  updateActiveState();
                },
                decoration: InputDecoration(
                  hintText: 'Address',
                  labelStyle: TextStyle(color: Colors.black38),
                  fillColor: Colors.grey.shade100,
                  focusColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(width: 3.0, color: Colors.grey.shade200),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TitleText(
              data: "Pays",
              color: Colors.black,
              size: 12,
              weight: FontWeight.normal,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontFamily: 'Inter',
            ),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              hint: const Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 14),
              ),
              items: genderItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) {},
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(
              height: 20,
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
      )),
    );
  }
}

enum Person {
  yakup,
  burak,
  ramazan,
}

Map<Person?, String> personMap = {
  null: "INITIAL",
  Person.yakup: "YAKUP",
  Person.ramazan: "RAMAZAN",
  Person.burak: "BURAK"
};
