import 'package:flutter/cupertino.dart';
import 'package:shopi/model/address/address.dart';
import 'package:shopi/model/address/getaddress.dart';
import 'package:shopi/service/address_services/address_services.dart';

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
  bool isLoading = false;
  bool isLoadingsss = false;
  String addressType = 'Home';

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

  void addNewAddress(BuildContext context) async {
    isLoadingsss = true;
    notifyListeners();
    final AddAddressModel model = AddAddressModel(
      addressType: addressType,
      name: fullNameController.text,
      contactNumber: phoneNumberController.text,
      pinCode: pincodeController.text,
      state: stateController.text,
      place: cityController.text,
      address: houseAndBuildingController.text,
      landMark: roadNameAreaColonyController.text,
    );
    await AddressService().addAddress(model).then((value) {
      if (value != null) {
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

  void clearControllers() {
    fullNameController.clear();
    pincodeController.clear();
    stateController.clear();
    houseAndBuildingController.clear();
    roadNameAreaColonyController.clear();
    cityController.clear();
    phoneNumberController.clear();
    addressType = 'Home';
  }
}
