import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lettutor/controller/user.dart';
import 'package:lettutor/models/user.dart';

import 'package:lettutor/ui/components/background.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';

class ProfileUI extends StatelessWidget {
  ProfileUI({Key? key, required this.user}) : super(key: key) {
    _avatar = (user.avatar ?? "").obs;
    _birthday = user.birthday.obs;
    _nameUpdateCtrl.text = user.name ?? "";
    _phoneUpdateCtrl.text = user.phone ?? "";
    _country = CountryParser.tryParse(user.country ?? "").obs;
    _level = user.level.obs;
    _learnTopic = Rx<List<String>?>(
        (user.learnTopics ?? []).map((e) => e.name ?? "").toList());
  }

  late UserModel user;
  late Rx<String> _avatar;
  late Rx<DateTime?> _birthday;
  late Rx<Country?> _country;
  late Rx<String?> _level;
  late Rx<List<String>?> _learnTopic;

  final _nameUpdateCtrl = TextEditingController();
  final _phoneUpdateCtrl = TextEditingController();

  void _onPressChangeAvatar() async {
    final fileX = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (fileX != null) {
      String newAvatar = await UserCtrl.to.uploadAvatar(File(fileX.path));
      if (newAvatar != "") {
        _avatar.value = newAvatar;
      }
    }
  }

  void _onPressSaveBtn() {
    // log('on press save button');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthday.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _birthday.value) {
      _birthday.value = picked;
    }
  }

  void _showListLevel(BuildContext context) {
    Color cardColor = Theme.of(context).cardColor;
    Get.bottomSheet(
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: UserEnum.UserLevel.map((e) => ListTile(
                    onTap: () {
                      _level.value = e;
                      Get.back();
                    },
                    title: Text(e),
                  )).toList(),
            ),
          ),
        ),
        elevation: 1.0,
        settings: RouteSettings(name: "Choose Topic to learn"),
        enableDrag: true,
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )));
  }

  void _selectCountry(BuildContext context) {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        _country.value = country;
      },
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }

  void _showListTopic(BuildContext context) {
    Color cardColor = Theme.of(context).cardColor;
    Get.bottomSheet(
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Option 1"),
                  trailing: Icon(Icons.access_alarms),
                ),
                ListTile(
                  title: Text("Option 2"),
                  trailing: Icon(Icons.ac_unit),
                ),
                ListTile(
                  title: Text("Option 3"),
                  trailing: Icon(Icons.present_to_all_sharp),
                ),
                ListTile(
                  title: Text("Option 4"),
                  trailing: Icon(Icons.keyboard),
                ),
              ],
            ),
          ),
        ),
        elevation: 1.0,
        settings: RouteSettings(name: "Choose Topic to learn"),
        enableDrag: true,
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )));
  }

  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Material(
      child: SafeArea(
        child: KeyboardDismisser(
          child: Background(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Stack(
                              children: [
                                Center(
                                  child: Obx(() => ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                          placeholder:
                                              'assets/images/indicator.gif',
                                          image: _avatar.value,
                                          imageErrorBuilder: (context, _,
                                                  strace) =>
                                              Image.asset(
                                                  "assets/images/indicator.gif",
                                                  fit: BoxFit.cover),
                                        ),
                                      )),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        color: hlColor),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: _onPressChangeAvatar,
                                      iconSize: 20,
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 20,
                                        color: priColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            controller: _nameUpdateCtrl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              border: InputBorder.none,
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Text(user.email ?? "a@g", style: textTheme.caption),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Birthday", style: textTheme.headline4),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: priColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: cardColor,
                        ),
                        child: Obx(() {
                          String text = _birthday.value != null
                              ? "${_birthday.value!.toLocal()}".split(' ')[0]
                              : "Please choose Date";
                          return Text(text, style: textTheme.caption);
                        }),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Phone number", style: textTheme.headline4),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: priColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: cardColor,
                      ),
                      child: TextField(
                        controller: _phoneUpdateCtrl,
                        textAlign: TextAlign.left,
                        style: textTheme.caption,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: textTheme.caption),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Country", style: textTheme.headline4),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => _selectCountry(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: priColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: cardColor,
                        ),
                        child: Obx(() {
                          String text = _country.value != null
                              ? "${_country.value!.displayName}"
                              : "Please choose Date";
                          return Text(text, style: textTheme.caption);
                        }),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("My level", style: textTheme.headline4),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        _showListLevel(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: priColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: cardColor,
                        ),
                        child: Obx(() {
                          String text = _level.value != null
                              ? _level.value!
                              : "Please choose Level";
                          return Text(text, style: textTheme.caption);
                        }),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Want to learn", style: textTheme.headline4),
                    SizedBox(height: 5),
                    Obx(() => SpecicalitiesList(
                          listSpec: _learnTopic.value ?? [],
                        )..selectClick = (_) {
                            _showListTopic(context);
                          }),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              String? country = _country.value == null
                                  ? null
                                  : _country.value!.countryCode;
                              UserCtrl.to.updateMe(
                                  name: _nameUpdateCtrl.text,
                                  phone: _phoneUpdateCtrl.text,
                                  birthday: _birthday.value,
                                  country: country,
                                  level: _level.value);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              child: Text(
                                "Save",
                                style: textTheme.headline3,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
