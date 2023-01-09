import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/address/address.dart';
import 'package:shopi/model/address/getaddress.dart';
import 'package:shopi/utils/app_exception.dart';
import 'package:shopi/utils/interceptor.dart';

class AddressService {
  Future<String?> addAddress(AddAddressModel model) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
        ApiUrl.apiUrl + ApiEndPoints.address,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final addressRes = response.data['message'];
        log(response.toString());
        return addressRes;
      }
    } on DioError catch (e) {
      log(e.message);
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<AddressGetModel>?> getAllAddress() async {
    // log("message3");
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiConstant.mainUrl + ApiEndPoints.address);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log("message4");
        final List<AddressGetModel> addressList = (response.data as List)
            .map((e) => AddressGetModel.fromJson(e))
            .toList();
        return addressList;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<AddressGetModel?> getSingleAddress(String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .get("${ApiConstant.mainUrl + ApiEndPoints.address}/$addressId");

      if (response.statusCode == 200) {
        final AddressGetModel model = AddressGetModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> updateAddress(AddAddressModel model, String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.patch(
        "${ApiConstant.mainUrl + ApiEndPoints.address}/$addressId",
        data: model.toJson(),
      );

      if (response.statusCode == 202) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> deleteAddress(String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .delete("${ApiConstant.mainUrl + ApiEndPoints.address}/$addressId");

      if (response.statusCode == 202) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
