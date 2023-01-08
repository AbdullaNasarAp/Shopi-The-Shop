import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/address/address.dart';

import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/login.dart';
import 'package:shopi/view/login/widget/button_container.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = "/address";

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWithFamily(
          title: "Address",
          ls: 0,
          colors: kIndigo,
          fontwght: FontWeight.bold,
          fontsz: 20,
          textalign: TextAlign.center,
          maxline: 1,
          ws: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<AddressController>(
          builder: (context, value, child) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return ksizedBox20;
              },
              itemCount: value.addressList.length,
              itemBuilder: (context, index) {
                return AddressTile(
                  index: index,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kBlack,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Consumer<AddressController>(
                    builder: (context, value, child) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: const TextWithFamily(
                            title: "Add your Address",
                            ls: 0,
                            colors: kIndigo,
                            fontwght: FontWeight.bold,
                            fontsz: 15,
                            textalign: TextAlign.center,
                            maxline: 1,
                            ws: 0),
                        content: Column(
                          children: [
                            CustomTextFormfield(
                              controller: value.fullNameController,
                              keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              icon: Icons.person,
                              hint: "Fullname",
                              obscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            ksizedBox10,
                            CustomTextFormfield(
                              controller: value.phoneNumberController,
                              keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              icon: Icons.call,
                              hint: "Phone",
                              obscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your Phone";
                                } else if (value.length != 10) {
                                  return "Enter valid Phone number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            ksizedBox10,
                            CustomTextFormfield(
                              controller: value.pincodeController,
                              keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              icon: Icons.pin,
                              hint: "Pincode",
                              obscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your Pincode";
                                } else if (value.length != 6) {
                                  return "Enter valid Pincode";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            ksizedBox10,
                            CustomTextFormfield(
                              controller: value.stateController,
                              keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              icon: FontAwesomeIcons.globeAsia,
                              hint: "State",
                              obscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your State";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            ksizedBox10,
                            CustomTextFormfield(
                              controller: value.houseAndBuildingController,
                              keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              icon: Icons.house,
                              hint: "Address",
                              obscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your Address";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            ksizedBox10,
                            CustomTextFormfield(
                              controller: value.roadNameAreaColonyController,
                              keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              icon: Icons.route,
                              hint: "LandMark",
                              obscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your LandMark";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            ksizedBox10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                Text("Home"),
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                Text("office"),
                              ],
                            ),
                            const ButtonContainer(
                                kWidth: 80,
                                kHeight: 40,
                                kColors: kBlack,
                                colors: kWhite,
                                title: "Submit",
                                ls: 0,
                                fontwght: FontWeight.normal,
                                fontsz: 15,
                                textalign: TextAlign.center,
                                bRadius: 10)
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          child: const FaIcon(
            textDirection: TextDirection.ltr,
            semanticLabel: "Add Address",
            FontAwesomeIcons.circlePlus,
            color: kWhite,
            size: 30,
          )),
    );
  }
}

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AddressController>(context, listen: false).getAllAddresses();
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<AddressController>(
        builder: (context, value, child) {
          return value.addressList.isEmpty
              ? LoadingAnimationWidget.flickr(
                  leftDotColor: kBlack, rightDotColor: kGrey, size: 30)
              : Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: kGrey,
                        offset: Offset(1, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: kGrey,
                        offset: Offset(1, -5.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: kIndigo,
                          child: FaIcon(
                            FontAwesomeIcons.mapLocation,
                            color: kWhite,
                          ),
                        ),
                        ksizedBoxW10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWithFamily(
                                title: value.addressList[index].fullName,
                                ls: 0,
                                colors: kIndigo,
                                fontwght: FontWeight.normal,
                                fontsz: 15,
                                textalign: TextAlign.center,
                                maxline: 1,
                                ws: 0),
                            TextWithFamily(
                                title: value.addressList[index].phone,
                                ls: 0,
                                colors: kGrey,
                                fontwght: FontWeight.normal,
                                fontsz: 13,
                                textalign: TextAlign.center,
                                maxline: 1,
                                ws: 0),
                            TextWithFamily(
                                title: value.addressList[index].place,
                                ls: 0,
                                colors: kGrey,
                                fontwght: FontWeight.normal,
                                fontsz: 13,
                                textalign: TextAlign.center,
                                maxline: 1,
                                ws: 0),
                            TextWithFamily(
                                title: value.addressList[index].landMark,
                                ls: 0,
                                colors: kGrey,
                                fontwght: FontWeight.normal,
                                fontsz: 13,
                                textalign: TextAlign.center,
                                maxline: 1,
                                ws: 0),
                            TextWithFamily(
                                title: value.addressList[index].pin,
                                ls: 0,
                                colors: kGrey,
                                fontwght: FontWeight.normal,
                                fontsz: 13,
                                textalign: TextAlign.center,
                                maxline: 1,
                                ws: 0),
                          ],
                        ),
                        ksizedBoxW20,
                        Center(
                          child: RawMaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            fillColor: kGrey,
                            elevation: 2,
                            onPressed: () {},
                            child: const FaIcon(FontAwesomeIcons.xmark),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class CustomTextFormfield extends StatelessWidget {
  const CustomTextFormfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.action,
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.validator,
    this.suffixOntap,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final IconData icon;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;
  final void Function()? suffixOntap;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: keyboardType,
      textInputAction: action,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: kGrey,
        prefixIcon: Icon(
          icon,
          color: kGrey,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        hintText: hint,
        hintStyle: const TextStyle(color: kGrey),
        suffixIcon: obscure == true
            ? IconButton(
                onPressed: suffixOntap,
                icon: Icon(
                  suffixIcon,
                  color: kBlack,
                ),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: kGrey, width: 1)),
      ),
      obscureText: obscure,
    );
  }
}
