import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractsRecord extends FirestoreRecord {
  ContractsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "contrat" field.
  String? _contrat;
  String get contrat => _contrat ?? '';
  bool hasContrat() => _contrat != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _contrat = snapshotData['contrat'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('contracts')
          : FirebaseFirestore.instance.collectionGroup('contracts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('contracts').doc();

  static Stream<ContractsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContractsRecord.fromSnapshot(s));

  static Future<ContractsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContractsRecord.fromSnapshot(s));

  static ContractsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContractsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContractsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContractsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContractsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContractsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContractsRecordData({
  String? contrat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contrat': contrat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContractsRecordDocumentEquality implements Equality<ContractsRecord> {
  const ContractsRecordDocumentEquality();

  @override
  bool equals(ContractsRecord? e1, ContractsRecord? e2) {
    return e1?.contrat == e2?.contrat;
  }

  @override
  int hash(ContractsRecord? e) => const ListEquality().hash([e?.contrat]);

  @override
  bool isValidKey(Object? o) => o is ContractsRecord;
}
