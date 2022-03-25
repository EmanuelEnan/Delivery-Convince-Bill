import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  // static const _keyNo = 'phone';
  // static const _keyOTP = 'OTP';

  // Future writeSecureData(String phone) async {
  //   await _storage.write(key: _keyNo, value: phone);
  // }

  // Future readSecureData() async {
  //   await _storage.read(key: _keyNo);
  // }

  // Future writeSecureOTP(String otp) async {
  //   await _storage.write(key: _keyOTP, value: otp);
  // }

  // Future readSecureOTP() async {
  //   await _storage.read(key: _keyOTP);
  // }

  Future write1SecureData(String key, String value) async {
    var deleteData1 = await _storage.write(key: key, value: value);
    return deleteData1;
  }

  Future read1SecureData(String key) async {
    var deleteData2 = await _storage.read(key: key);
    return deleteData2;
  }

  Future deleteSecureData(String key) async {
    var deleteData3 = await _storage.delete(key: key);
    return deleteData3;
  }
}
