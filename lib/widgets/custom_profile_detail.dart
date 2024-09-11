import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomProfileDetail extends StatelessWidget {
  final storage = const FlutterSecureStorage();
  CustomProfileDetail({Key? key}) : super(key: key);

  Future<Map<String, String?>> _readProfileData() async {
    String? nim = await storage.read(key: 'nim');
    String? name = await storage.read(key: 'name');
    String? email = await storage.read(key: 'email');

    return {
      'nim': nim,
      'name': name,
      'email': email,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
        future: _readProfileData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading profile data'));
          }

          var profileData = snapshot.data ??
              {
                'nim': 'Unknown',
                'name': 'Unknown',
                'email': 'Unknown',
              };

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfileDetailRow(
                    label: 'Nama', value: profileData['name'] ?? 'Unknown'),
                ProfileDetailRow(
                    label: 'NIM', value: profileData['nim'] ?? 'Unknown'),
                ProfileDetailRow(
                    label: 'Email', value: profileData['email'] ?? 'Unknown'),
                ProfileDetailRow(label: 'Status', value: 'Aktif'),
              ],
            ),
          );
        });
  }
}

class ProfileDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailRow({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Text(
              '$label ',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // const SizedBox(width: 3),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
