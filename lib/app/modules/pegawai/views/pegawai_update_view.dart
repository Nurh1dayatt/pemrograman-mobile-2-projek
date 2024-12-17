import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';

class KaryawanUpdateView extends GetView<PegawaiController> {
  const KaryawanUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Karyawan'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.GetDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNoKaryawan.text = data['No karyawan'];
            controller.cNamaKaryawan.text = data['nama karyawan'];
            controller.cJabatanKaryawan.text = data['jabatan karyawan'];

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNoKaryawan,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Id Pegawai"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNamaKaryawan,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Nama"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cJabatanKaryawan,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Jabatan"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField(
                  //   controller: controller.cAlamat,
                  //   textInputAction: TextInputAction.done,
                  //   decoration: InputDecoration(labelText: "Alamat"),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.Update(
                      controller.cNoKaryawan.text,
                      controller.cNamaKaryawan.text,
                      controller.cJabatanKaryawan.text,
                      // controller.cAlamat.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
