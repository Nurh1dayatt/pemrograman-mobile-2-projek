import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pegawai_controller.dart';

class PegawaiView extends GetView<PegawaiController> {
  const PegawaiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PegawaiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PegawaiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
