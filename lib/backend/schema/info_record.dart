import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InfoRecord extends FirestoreRecord {
  InfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imgUrl" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "wigth" field.
  int? _wigth;
  int get wigth => _wigth ?? 0;
  bool hasWigth() => _wigth != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  // "cin" field.
  String? _cin;
  String get cin => _cin ?? '';
  bool hasCin() => _cin != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "sign" field.
  String? _sign;
  String get sign => _sign ?? '';
  bool hasSign() => _sign != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  void _initializeFields() {
    _imgUrl = snapshotData['imgUrl'] as String?;
    _name = snapshotData['name'] as String?;
    _wigth = castToType<int>(snapshotData['wigth']);
    _height = castToType<int>(snapshotData['height']);
    _cin = snapshotData['cin'] as String?;
    _city = snapshotData['city'] as String?;
    _sign = snapshotData['sign'] as String?;
    _gender = snapshotData['gender'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('info');

  static Stream<InfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InfoRecord.fromSnapshot(s));

  static Future<InfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InfoRecord.fromSnapshot(s));

  static InfoRecord fromSnapshot(DocumentSnapshot snapshot) => InfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInfoRecordData({
  String? imgUrl,
  String? name,
  int? wigth,
  int? height,
  String? cin,
  String? city,
  String? sign,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imgUrl': imgUrl,
      'name': name,
      'wigth': wigth,
      'height': height,
      'cin': cin,
      'city': city,
      'sign': sign,
      'gender': gender,
    }.withoutNulls,
  );

  return firestoreData;
}

class InfoRecordDocumentEquality implements Equality<InfoRecord> {
  const InfoRecordDocumentEquality();

  @override
  bool equals(InfoRecord? e1, InfoRecord? e2) {
    return e1?.imgUrl == e2?.imgUrl &&
        e1?.name == e2?.name &&
        e1?.wigth == e2?.wigth &&
        e1?.height == e2?.height &&
        e1?.cin == e2?.cin &&
        e1?.city == e2?.city &&
        e1?.sign == e2?.sign &&
        e1?.gender == e2?.gender;
  }

  @override
  int hash(InfoRecord? e) => const ListEquality().hash([
        e?.imgUrl,
        e?.name,
        e?.wigth,
        e?.height,
        e?.cin,
        e?.city,
        e?.sign,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is InfoRecord;
}
