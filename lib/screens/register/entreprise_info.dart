import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/methods/common_methods.dart';
import 'package:wholeorderclient/models/requests/info_entreprise.dart';
import 'package:wholeorderclient/models/response/categories_entreprise.dart';
import 'package:wholeorderclient/providers/auth_provider.dart';
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
  List<String> selectedValues = []; // List of selected category names
  

  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  String countryCode = "";
  String countryName = "";
  String number = "";
  int categorieId = 0;

  List<DataCategoriesEntreprise?> categories = [];
  late TextEditingController nomcommercialController;
  late TextEditingController nomentrepriseController;
  late TextEditingController prenomController;
  late TextEditingController nomController;
  late TextEditingController addressController;
  final CommonMethods commonMethods = CommonMethods();
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
    fetchCategories();
    final app = Provider.of<AuthProvider>(context, listen: false);
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

  void fetchCategories() {
    final app = Provider.of<AuthProvider>(context, listen: false);
    app.categoriesEntrepriseProvider(context).then((value) {
      setState(() {
        categories = value ?? [];
      });

      print('List of categories:');
      for (DataCategoriesEntreprise? category in categories) {
        if (category != null) {
          print('Category ID: ${category.id}');
          print('Category Name: ${category.entreprisecategorie}');
          print('Created At: ${category.createdat}');
          print('Updated At: ${category.updatedat}');
          print('---------------------------');
        }
      }
    });
  }

  registerentrepriseinfo() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    var iduser = ap.getId;
    var role = ap.getRole;
    EntrepriseInfoRequest entrepriseInfoRequest = EntrepriseInfoRequest(
        nomCommercial: nomcommercialController.text,
        nomEntreprise: nomentrepriseController.text,
        idUser: iduser,
        idEntrepriseCategorie: categorieId,
        codePays: countryCode,
        telephone: phoneNumber,
        adresse: addressController.text,
        pays: countryName);

    var result = ap.EntrepriseInfoProvider(entrepriseInfoRequest, context);
    print('iduser : ----- ${iduser}');
    print('roleuser : ----- ${role}');

    print(EntrepriseInfoRequest);

    return result;
  }

  checkConnectivity() {
    commonMethods.checkConnectivity(context);
    registerentrepriseinfo();
  }

  @override
  Widget build(BuildContext context) {
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
                data: 'Information de L entreprise',
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
            DropdownButtonFormField<String>(
  isExpanded: true,
  decoration: InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  hint: selectedValue == null
      ? Text(
          'Select Your category',
          style: TextStyle(fontSize: 14),
        )
      : Text(
          selectedValue!,
          style: TextStyle(fontSize: 14),
        ),
  value: selectedValue,
  items: categories
      .map((item) => DropdownMenuItem<String>(
            value: item!.entreprisecategorie, // Store the category name as a string
            child: ListTile(
              title: Text(item.entreprisecategorie!),
            ),
          ))
      .toList(),
  onChanged: (value) {
    setState(() {
      selectedValue = value; // Update the selectedValue when a new value is chosen
      // Do something with the selected value if needed
      // For example, you can find the corresponding DataCategoriesEntreprise object
      final selectedItemObject = categories.firstWhere(
        (item) => item!.entreprisecategorie == value,
        // No need for orElse here as we're sure the item exists
      );
      // If the item is found, print its ID
      if (selectedItemObject != null) {
        print("Selected item ID for $value: ${selectedItemObject.id}");
        categorieId = selectedItemObject.id!;
      }
    });
  },
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please select a category.';
    }
    return null;
  },
  style: TextStyle(
    // Define the text style for the dropdown button
    fontSize: 14,
    color: Colors.black,
  ),
  icon: Icon(
    Icons.arrow_drop_down,
    color: Colors.black45,
    size: 24,
  ),
  dropdownColor: Colors.white, // Customize the dropdown background color if needed
),

             /*  DropdownButtonFormField2<List<String>>(
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
                items: categories
                    .map((item) => DropdownMenuItem<List<String>>(
                          value: [
                            item!.entreprisecategorie!
                          ], // Store the category name as a string
                          child: ListTile(
                            title: Text(item.entreprisecategorie!),
                            leading: Checkbox(
                              value: selectedValues
                                  .contains(item.entreprisecategorie!),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedValues.add(item.entreprisecategorie!);
                                  } else {
                                    selectedValues
                                        .remove(item.entreprisecategorie!);
                                  }
                                });
                              },
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select at least one category.';
                  }
                  return null;
                },
                onChanged: (value) {
                  /// Do something when the value changes
                  // Do something when the value changes
                  if (value != null && categories != null) {
                    // Find the corresponding DataCategoriesEntreprise object for each selected category name
                    for (var categoryName in value) {
                      // Find the corresponding DataCategoriesEntreprise object
                      final selectedItemObject = categories.firstWhere(
                        (item) => item!.entreprisecategorie == categoryName,
                        // No need for orElse here as we're sure the item exists
                      );

                      // If the item is found, print its ID
                      if (selectedItemObject != null) {
                        print(
                            "Selected item ID for $categoryName: ${selectedItemObject.id}");
                        setState(() {
                          categorieId = selectedItemObject!.id!;
                        });
                      }
                    }
                  }
                },
                onSaved: (value) {
                  // Save the selected value
                  selectedValues = value!;
                },
                buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: IconStyleData(
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
                menuItemStyleData: MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
               */SizedBox(
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
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // primary: Colors.white,
                  //onPrimary: Colors.grey,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    //Optional.  Can be used to exclude(remove) one or more countries from the countries list (optional).
                    exclude: <String>['KN', 'MF'],
                    favorite: <String>['SN'],
                    //Optional. Shows phone code before the country name.
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      print('Select country: ${country.name}');
                      setState(() {
                        countryName = country.name;
                      });
                    },
                    // Optional. Sets the theme for the country list picker.
                    countryListTheme: CountryListThemeData(
                      // Optional. Sets the border radius for the bottom sheet.
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      // Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                      ),
                      // Optional. Styles the text in the search field
                      searchTextStyle: TextStyle(
                        color: AppColors.myColor,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(
                        data: "Pays",
                        color: Colors.black,
                        size: 12,
                        weight: FontWeight.normal,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        fontFamily: 'Inter',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: isactive
                  ? () {
                      checkConnectivity();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                //onSurface: AppColors.myColor,
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
