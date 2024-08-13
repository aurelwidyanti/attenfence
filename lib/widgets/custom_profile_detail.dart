import 'package:attendance_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomProfileDetail extends StatelessWidget {
  const CustomProfileDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(191, 191, 191, 1),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProfileDetailRow(label: 'Nama Mahasiswa', value: 'Lumine'),
          ProfileDetailRow(label: 'NIM', value: 'A11.2022.14494'),
          ProfileDetailRow(label: 'Status', value: 'Aktif'),
          ProfileDetailRow(label: 'Dosen Wali', value: 'FARUZAN S.Kom, M.Kom'),
        ],
      ),
    );
  }
}
