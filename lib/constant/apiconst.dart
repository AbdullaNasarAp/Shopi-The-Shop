class ApiConstant {
  static const mainUrl = "http://172.16.1.180:5005/api/v1/";
}

class ApiEndPoints {
  static const signUp = 'auth/signup';
  static const verifyOrSendOtp = 'auth/otp';
  static const login = 'auth/login';
  static const usercheck = 'users/';
  static const forgetPassword = 'auth/password';
  static const googleSignIn = 'auth/google';
  static const carousal = 'carousal';
  static const categories = 'category';
  static const product = 'products';
  static const refreshToken = 'auth/refresh';
  static const wishList = 'wishlist';
  static const cart = 'cart';
  static const address = 'address';
}

class ApiQueryParameter {
  static const queryParameter = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}

class ApiUrl {
  static const apiUrl = 'http://172.16.1.180:5005/api/v1/';
  static const url = '172.16.1.180';
}
