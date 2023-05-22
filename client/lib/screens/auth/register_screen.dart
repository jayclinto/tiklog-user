// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

//import 'dart:html';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:tiklogistics/provider/auth_provider.dart';
import 'package:tiklogistics/utils/utils.dart';
import 'package:tiklogistics/models/user.dart';
//import 'package:tiklogistics/widgets/flat_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  doRegister() {
    if (formKey.currentState!.validate()) {
      print('not ok');
    } else {
      print('ok');
    }
  }

  User user = User('', '');

  //create phone and password controller
  final _passwordController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  Country defaultCountry = Country(
    phoneCode: "234",
    countryCode: "NG",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Nigeria",
    example: "Nigeria",
    displayName: "Nigeria",
    displayNameNoCountryCode: "NG",
    e164Key: "",
  );

  var _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _phoneNumberController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: _phoneNumberController.text.length,
      ),
    );
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 52, 20, 18),
                width: double.infinity,
                height: 168,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1e000000),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 91, 0),
                      width: 188,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2575,
                                      color: Color(0xff6b6b6b),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Warning: Express delivery zone ahead',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffa3a3a3),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 6.5),
                      width: 48,
                      height: 36,
                      child: Image.asset("assets/logo.png"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: const Text(
                                'Phone Number',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2575,
                                  color: Color(0xff6b6b6b),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    cursorColor: Colors.black12,
                                    controller: TextEditingController(
                                        text: user.phoneNumber),
                                    onChanged: (value) {
                                      user.phoneNumber = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return null;
                                      } else {
                                        return 'please enter your phone number';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Phone Number",
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 16),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black12),
                                      ),
                                      prefixIcon: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(
                                          onTap: () {
                                            showCountryPicker(
                                                context: context,
                                                countryListTheme:
                                                    const CountryListThemeData(
                                                  bottomSheetHeight: 550,
                                                ),
                                                onSelect: ((value) {
                                                  setState(() {
                                                    defaultCountry = value;
                                                  });
                                                }));
                                          },
                                          child: Text(
                                            "${defaultCountry.flagEmoji} +${defaultCountry.phoneCode}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                              child: const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2575,
                                  color: Color(0xff6b6b6b),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                              decoration: BoxDecoration(

                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Color(0x0ffeeeee),
                                        blurRadius: 10,
                                        offset: Offset(0, 8))
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.13))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    obscureText: _isObscured,
                                    controller: TextEditingController(
                                        text: user.password),
                                    decoration: InputDecoration(
                                      hintText: 'Enter password',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 16),
                                      suffixIcon: IconButton(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                end: 12.0),
                                        icon: _isObscured
                                            ? const Icon(Icons.visibility)
                                            : const Icon(
                                                Icons.visibility_off,
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscured = !_isObscured;
                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password field cannot be empty';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                doRegister();
                              },
                              child: const Text('Create Account'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 34.5, 0),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: const Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2575,
                                  letterSpacing: -0.28,
                                  color: Color(0xffa6a6a6),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: const Text(
                                'login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2575,
                                  letterSpacing: 0.28,
                                  color: Color(0xff0185cd),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
