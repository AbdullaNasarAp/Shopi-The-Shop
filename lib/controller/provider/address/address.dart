import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/address/address.dart';
import 'package:shopi/model/address/getaddress.dart';
import 'package:shopi/service/address_services/address_services.dart';
import 'package:shopi/utils/app_exception.dart';
import 'package:shopi/utils/app_snack.dart';
import 'package:shopi/utils/utils.dart';

class AddressController with ChangeNotifier {
  AddressController() {
    getAllAddresses();
    // log("message");
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController houseAndBuildingController =
      TextEditingController();
  final TextEditingController roadNameAreaColonyController =
      TextEditingController();
  List<AddressGetModel> addressList = [];
  List<AddAddressModel> newAddress = [];
  bool isLoading = false;
  bool isLoadingsss = false;
  String addressType = 'Home';
  bool isSelected = false;

  Future<String?> getAllAddresses() async {
    // log("message2");
    isLoading = true;
    notifyListeners();
    await AddressService().getAllAddress().then((value) {
      // log("message1");
      if (value != null) {
        addressList = value;
        notifyListeners();

        isLoading = false;
        notifyListeners();
        return 'set';
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    });
    return null;
  }

  Future<void> addNewAddress(BuildContext context) async {
    isLoadingsss = true;
    notifyListeners();
    final AddAddressModel model = AddAddressModel(
      title: addressType,
      fullName: fullNameController.text,
      phone: phoneNumberController.text,
      pin: pincodeController.text,
      state: stateController.text,
      place: cityController.text,
      address: houseAndBuildingController.text,
      landMark: roadNameAreaColonyController.text,
    );
    await AddressService().addAddress(model).then((value) {
      if (value != null) {
        log("kitti kitti");
        clearControllers();
        Navigator.of(context).pop();
        isLoadingsss = false;
        notifyListeners();
      } else {
        isLoadingsss = false;
        notifyListeners();
      }
    });
  }

  Future<void> updateAddress(AddressGetModel newAddress, String id) async {
    final addressIndex = addressList.indexWhere((prod) => prod.id == id);
    final AddAddressModel model = AddAddressModel(
      title: addressType,
      fullName: fullNameController.text,
      phone: phoneNumberController.text,
      pin: pincodeController.text,
      state: stateController.text,
      place: cityController.text,
      address: houseAndBuildingController.text,
      landMark: roadNameAreaColonyController.text,
    );

    try {
      if (addressIndex >= 0) {
        await AddressService().updateAddress(model, id).then((value) {
          if (value != null) {
            addressList[addressIndex] = newAddress;
            notifyListeners();
          }
        });
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
  }

  void deleteAddress(String addressId) async {
    isLoading = true;
    notifyListeners();
    await AddressService().deleteAddress(addressId).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void addressToggle() {
    isSelected = !isSelected;
    notifyListeners();
    isSelected == true ? addressType = "Home" : addressType = "Office";
    notifyListeners();
  }

  void saveAddress(context) {
    addNewAddress(context);
    AppToast.showToast("Address Added", Colors.green);
    notifyListeners();
    clearControllers();
    notifyListeners();
  }

  void clearControllers() {
    fullNameController.clear();
    pincodeController.clear();
    stateController.clear();
    houseAndBuildingController.clear();
    roadNameAreaColonyController.clear();
    cityController.clear();
    phoneNumberController.clear();
    addressType = 'Home';
    notifyListeners();
  }
}
