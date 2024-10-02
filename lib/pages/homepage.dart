import 'package:flutter/material.dart';
import 'package:coba3/dummy_menu.dart';

class Homepage extends StatelessWidget {
  final String username;
  final String? nickname;
  Homepage({Key? key, required this.username, this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Halo $username'),
            if (nickname != null) Text('Panggil saya $nickname'),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
            Expanded(
              child: menuMakan(),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuMakan() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: foodMenuList.length,
      itemBuilder: (context, index) {
        final FoodMenu makanan = foodMenuList[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  makanan.imageUrls[0],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      makanan.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(makanan.price),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
