import 'package:flutter/material.dart';
import 'package:tugas_2/screens/profile_detail.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  final String name = 'Nama Kamu';
  final String desc =
      'Aute enim elit elit excepteur labore duis ea laboris dolor do tempor. Dolor ex sit magna minim officia pariatur sint ut sit proident aliqua. Ullamco magna minim elit veniam laborum et cupidatat fugiat deserunt';

  const ProfileScreen({Key? key}) : super(key: key);

  Widget buildIconData({
    required IconData icon,
    required String title,
    required int percentage,
  }) {
    return Column(children: [
      Icon(icon),
      Text(title),
      Text("$percentage%"),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star, size: 8),
                            Icon(Icons.star, size: 8),
                            Icon(Icons.star, size: 8),
                            Icon(Icons.star, size: 8),
                            Icon(Icons.star, size: 8),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildIconData(
                            icon: Icons.work, title: "data 1", percentage: 50),
                        buildIconData(
                            icon: Icons.star, title: "data 2", percentage: 40),
                        buildIconData(
                            icon: Icons.place, title: "data 3", percentage: 60),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: const Icon(Icons.person, color: Colors.white),
                      label: const Text('Profile Detail',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ProfileDetailScreen.routeName,
                          arguments: {
                            'name': name,
                            'desc': desc,
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.asset('assets/images/my_image.jpg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
