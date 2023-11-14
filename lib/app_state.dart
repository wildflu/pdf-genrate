import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _gender = ['male', 'Female'];
  List<String> get gender => _gender;
  set gender(List<String> _value) {
    _gender = _value;
  }

  void addToGender(String _value) {
    _gender.add(_value);
  }

  void removeFromGender(String _value) {
    _gender.remove(_value);
  }

  void removeAtIndexFromGender(int _index) {
    _gender.removeAt(_index);
  }

  void updateGenderAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _gender[_index] = updateFn(_gender[_index]);
  }

  void insertAtIndexInGender(int _index, String _value) {
    _gender.insert(_index, _value);
  }

  List<String> _city = ['Safi', 'Raba', 'Marrakech', 'tanger'];
  List<String> get city => _city;
  set city(List<String> _value) {
    _city = _value;
  }

  void addToCity(String _value) {
    _city.add(_value);
  }

  void removeFromCity(String _value) {
    _city.remove(_value);
  }

  void removeAtIndexFromCity(int _index) {
    _city.removeAt(_index);
  }

  void updateCityAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _city[_index] = updateFn(_city[_index]);
  }

  void insertAtIndexInCity(int _index, String _value) {
    _city.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
