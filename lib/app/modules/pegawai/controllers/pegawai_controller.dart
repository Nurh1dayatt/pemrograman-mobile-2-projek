import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  //TODO: Implement pegawaiController
  late TextEditingController cNoKaryawan;
  late TextEditingController cNamaKaryawan;
  late TextEditingController cJabatanKaryawan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan = firestore.collection('karyawan');
    return karyawan.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference karyawan = firestore.collection('karyawan');
    return karyawan.snapshots();
  }

// Bagian Tambah Data
  void add(
    String no_karyawan,
    String nama_karyawan,
    String jabatan_karyawan,
  ) async {
    CollectionReference karyawan = firestore.collection("karyawan");

    try {
      await karyawan.add({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data karyawan",
          onConfirm: () {
            cNoKaryawan.clear();
            cNamaKaryawan.clear();
            cJabatanKaryawan.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan pegawai.",
      );
    }
  }

// Bagian Update Data
  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("karyawan").doc(id);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan,
      String id) async {
    DocumentReference karyawanById = firestore.collection("karyawan").doc(id);

    try {
      await karyawanById.update({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data karyawan.",
        onConfirm: () {
          cNoKaryawan.clear();
          cNamaKaryawan.clear();
          cJabatanKaryawan.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan pegawai.",
      );
    }
  }

// Bagian Delete data
  void delete(String id) {
    DocumentReference docRef = firestore.collection("karyawan").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNoKaryawan = TextEditingController();
    cNamaKaryawan = TextEditingController();
    cJabatanKaryawan = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNoKaryawan.dispose();
    cNamaKaryawan.dispose();
    cJabatanKaryawan.dispose();

    super.onClose();
  }
}
