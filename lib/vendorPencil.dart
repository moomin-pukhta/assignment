
import 'package:flutter/material.dart';

enum itemLabel {
  high('High', Colors.green),
  medium('Medium', Colors.amber),
  low('Low', Colors.red);

  const itemLabel(this.label, this.color);
  final String label;
  final Color color;
}

class vendorPencil extends StatefulWidget {
  const vendorPencil({super.key});

  @override
  State<vendorPencil> createState() => _vendorPencilState();
}

class _vendorPencilState extends State<vendorPencil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double? _deviceWidth;

  final TextEditingController itemController = TextEditingController();
  // final TextEditingController iconController = TextEditingController();
  itemLabel? selectedColor;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Landing Page'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: _deviceWidth! * .98,
              child: const Image(
                image: AssetImage('images/pencil.png'),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Particulars'),
                Text('Inventory'),
              ],
            ),
            SizedBox(
              width: _deviceWidth! * 0.9,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Pencil'),
                this._dropDown(),
              ],
            ),
             SizedBox(height: 60,),
            ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'login');
           
          },
          child: Text('Logout'),
            ),
          ],
        ),
      )),
    );
  }

  Widget _dropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownMenu<itemLabel>(
          initialSelection: itemLabel.medium,
          controller: itemController,
          requestFocusOnTap: true,
          label: const Text('Inventory'),
          onSelected: (itemLabel? item) {
            setState(() {
              selectedColor = item;
            });
          },
          dropdownMenuEntries: itemLabel.values
              .map<DropdownMenuEntry<itemLabel>>((itemLabel color) {
            return DropdownMenuEntry<itemLabel>(
              value: color,
              label: color.label,
              enabled: color.label != 'Grey',
              style: MenuItemButton.styleFrom(
                foregroundColor: color.color,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
