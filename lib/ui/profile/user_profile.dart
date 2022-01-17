import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/ui/components/background.dart';

import 'comp/country_selection.dart';
import 'comp/date_picker.dart';
import 'comp/level_selection.dart';
import 'comp/want_to_learn_selection.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({Key? key}) : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  late DateTime selectedDate;
  final UserModel currentUser = LocalData.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = currentUser.name;
    // selectedDate = currentUser.birthday ?? DateTime.now();
    // _phoneController.text = currentUser.phone ?? '';
    selectedDate = DateTime.now();
    _phoneController.text = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  void _onPressChangeAvatar() {
    log('on press change avatar button');
  }

  void _onPressSaveBtn() {
    log('on press save button');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Material(
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                      placeholder: 'assets/images/indicator.gif',
                                      image: currentUser.avatar,
                                      imageErrorBuilder:
                                          (context, intance, strace) => Image.asset(
                                              "assets/images/indicator.gif",
                                              fit: BoxFit.cover),
                                    ),
                                  ),
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
                            controller: _nameController,
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
                          Text(currentUser.email, style: textTheme.caption),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Birthday", style: textTheme.headline4),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: DatePickerButton(selectedDate: selectedDate),
                    ),
                    SizedBox(height: 10),
                    Text("Phone number", style: textTheme.headline4),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: priColor),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: cardColor,
                      ),
                      child: TextField(
                        controller: _phoneController,
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
                    const CountrySelection(),
                    SizedBox(height: 10),
                    const LevelSelection(),
                    SizedBox(height: 10),
                    const SubjectSelection(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _onPressSaveBtn();
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
    );
  }
}
