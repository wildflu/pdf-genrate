import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField-fullname widget.
  FocusNode? textFieldFullnameFocusNode;
  TextEditingController? textFieldFullnameController;
  String? Function(BuildContext, String?)? textFieldFullnameControllerValidator;
  String? _textFieldFullnameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'field Full Name is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for TextField-cin widget.
  FocusNode? textFieldCinFocusNode;
  TextEditingController? textFieldCinController;
  String? Function(BuildContext, String?)? textFieldCinControllerValidator;
  String? _textFieldCinControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cin Is required';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for f-width widget.
  FocusNode? fWidthFocusNode;
  TextEditingController? fWidthController;
  String? Function(BuildContext, String?)? fWidthControllerValidator;
  // State field(s) for f-height widget.
  FocusNode? fHeightFocusNode;
  TextEditingController? fHeightController;
  String? Function(BuildContext, String?)? fHeightControllerValidator;
  // State field(s) for TextField-age widget.
  FocusNode? textFieldAgeFocusNode;
  TextEditingController? textFieldAgeController;
  String? Function(BuildContext, String?)? textFieldAgeControllerValidator;
  String? _textFieldAgeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'the age is required';
    }

    return null;
  }

  // State field(s) for f-descrip widget.
  FocusNode? fDescripFocusNode;
  TextEditingController? fDescripController;
  String? Function(BuildContext, String?)? fDescripControllerValidator;
  // State field(s) for Signature widget.
  SignatureController? signatureController;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  String uploadedSignatureUrl = '';
  // Stores action output result for [Custom Action - generatePdf] action in Button widget.
  String? theurlpdF;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldFullnameControllerValidator =
        _textFieldFullnameControllerValidator;
    textFieldCinControllerValidator = _textFieldCinControllerValidator;
    textFieldAgeControllerValidator = _textFieldAgeControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFullnameFocusNode?.dispose();
    textFieldFullnameController?.dispose();

    textFieldCinFocusNode?.dispose();
    textFieldCinController?.dispose();

    fWidthFocusNode?.dispose();
    fWidthController?.dispose();

    fHeightFocusNode?.dispose();
    fHeightController?.dispose();

    textFieldAgeFocusNode?.dispose();
    textFieldAgeController?.dispose();

    fDescripFocusNode?.dispose();
    fDescripController?.dispose();

    signatureController?.dispose();
    textFieldFocusNode?.dispose();
    textController7?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
