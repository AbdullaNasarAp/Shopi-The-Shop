import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/address/address.dart';
import 'package:shopi/model/address/getaddress.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/address/widget/address_tile.dart';
import 'package:shopi/view/address/widget/customfield.dart';
import 'package:shopi/view/login/widget/button_container.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = "/address";

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var initValues = {
    'title': '',
    'fullName': '',
    'phone': '',
    'pin': '',
    'state': '',
    'place': '',
    'address': '',
    'landMark': '',
  };

  var editAddress = AddressGetModel(
      id: '',
      user: '',
      title: '',
      fullName: '',
      phone: '',
      pin: '',
      state: '',
      place: '',
      address: '',
      landMark: '');

  bool _isLoading = false;

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (editAddress.id == null) {
      await Provider.of<AddressController>(context, listen: false)
          .updateAddress(editAddress, editAddress.id);
    } else {
      try {
        await Provider.of<AddressController>(context, listen: false)
            .addNewAddress(context);
      } catch (_) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occurred!'),
            content: const Text('Something went wrong.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AddressController>(context, listen: false).getAllAddresses();
    });
    return Scaffold(
      key: _scaffoldKey,
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
            return value.addressList.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    child: Column(
                      children: const [
                        SizedBox(height: 40),
                        Image(
                          image: AssetImage(
                            'assets/images/icons8-nothing-found-100.png',
                          ),
                        ),
                        TextWithFamily(
                            title: "Address is empty",
                            ls: 0,
                            colors: kIndigo,
                            fontwght: FontWeight.w300,
                            fontsz: 15,
                            textalign: TextAlign.justify,
                            maxline: 1,
                            ws: 0),
                      ],
                    ),
                  )
                : ListView.separated(
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
                  builder: (context, values, child) {
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
                      content: Form(
                        key: _form,
                        child: Column(
                          children: [
                            CustomTextFormfield(
                              onsaved: (value) {
                                editAddress = AddressGetModel(
                                    id: '',
                                    user: '',
                                    title: editAddress.title,
                                    fullName: value!,
                                    phone: editAddress.phone,
                                    pin: editAddress.pin,
                                    state: editAddress.state,
                                    place: editAddress.place,
                                    address: editAddress.address,
                                    landMark: editAddress.landMark);
                              },
                              initvalue: initValues['fullName'],
                              controller: values.fullNameController,
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
                              onsaved: (value) {
                                editAddress = AddressGetModel(
                                    id: '',
                                    user: '',
                                    title: editAddress.title,
                                    fullName: editAddress.fullName,
                                    phone: value!,
                                    pin: editAddress.pin,
                                    state: editAddress.state,
                                    place: editAddress.place,
                                    address: editAddress.address,
                                    landMark: editAddress.landMark);
                              },
                              initvalue: initValues['phone'],
                              controller: values.phoneNumberController,
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
                              onsaved: (value) {
                                editAddress = AddressGetModel(
                                    id: '',
                                    user: '',
                                    title: editAddress.title,
                                    fullName: editAddress.fullName,
                                    phone: editAddress.phone,
                                    pin: value!,
                                    state: editAddress.state,
                                    place: editAddress.place,
                                    address: editAddress.address,
                                    landMark: editAddress.landMark);
                              },
                              initvalue: initValues['pin'],
                              controller: values.pincodeController,
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
                              onsaved: (value) {
                                editAddress = AddressGetModel(
                                    id: '',
                                    user: '',
                                    title: editAddress.title,
                                    fullName: editAddress.fullName,
                                    phone: editAddress.phone,
                                    pin: editAddress.pin,
                                    state: value!,
                                    place: editAddress.place,
                                    address: editAddress.address,
                                    landMark: editAddress.landMark);
                              },
                              initvalue: initValues['state'],
                              controller: values.stateController,
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
                              onsaved: (value) {
                                editAddress = AddressGetModel(
                                    id: '',
                                    user: '',
                                    title: editAddress.title,
                                    fullName: editAddress.fullName,
                                    phone: editAddress.phone,
                                    pin: editAddress.pin,
                                    state: editAddress.state,
                                    place: value!,
                                    address: editAddress.address,
                                    landMark: editAddress.landMark);
                              },
                              initvalue: initValues['place'],
                              controller: values.cityController,
                              keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              icon: FontAwesomeIcons.city,
                              hint: "Place",
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
                              onsaved: (value) {
                                editAddress = AddressGetModel(
                                    id: '',
                                    user: '',
                                    title: editAddress.title,
                                    fullName: editAddress.fullName,
                                    phone: editAddress.phone,
                                    pin: editAddress.pin,
                                    state: editAddress.state,
                                    place: editAddress.place,
                                    address: value!,
                                    landMark: editAddress.landMark);
                              },
                              initvalue: initValues['address'],
                              controller: values.houseAndBuildingController,
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
                              onsaved: (value) {
                                editAddress = AddressGetModel(
                                    id: '',
                                    user: '',
                                    title: editAddress.title,
                                    fullName: editAddress.fullName,
                                    phone: editAddress.phone,
                                    pin: editAddress.pin,
                                    state: editAddress.state,
                                    place: editAddress.place,
                                    address: editAddress.address,
                                    landMark: value!);
                              },
                              initvalue: initValues['landMark'],
                              controller: values.roadNameAreaColonyController,
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
                                OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: values.isSelected == true
                                        ? kIndigo
                                        : Colors.transparent,
                                    foregroundColor: values.isSelected == true
                                        ? kWhite
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    values.addressToggle();
                                  },
                                  icon: const Icon(
                                    Icons.home,
                                  ),
                                  label: const Text(
                                    'Home',
                                  ),
                                ),
                                ksizedBoxW10,
                                OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: values.isSelected == false
                                        ? kIndigo
                                        : Colors.transparent,
                                    foregroundColor: values.isSelected == false
                                        ? kWhite
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    values.addressToggle();
                                  },
                                  icon: const Icon(
                                    Icons.apartment_outlined,
                                  ),
                                  label: const Text(
                                    'Office',
                                  ),
                                ),
                              ],
                            ),
                            ksizedBox20,
                            InkWell(
                              onTap: () {
                                if (_form.currentState!.validate()) {
                                  _form.currentState!.save();
                                  values.addNewAddress(context);
                                  _saveForm();
                                }
                              },
                              child: const ButtonContainer(
                                  kWidth: 80,
                                  kHeight: 40,
                                  kColors: kBlack,
                                  colors: kWhite,
                                  title: "Submit",
                                  ls: 0,
                                  fontwght: FontWeight.normal,
                                  fontsz: 15,
                                  textalign: TextAlign.center,
                                  bRadius: 10),
                            )
                          ],
                        ),
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
        ),
      ),
    );
  }
}
