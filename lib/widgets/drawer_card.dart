import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  final int? value;
  final String? texto;

  const DrawerCard({super.key, this.value, this.texto});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 0.8,
          ),
        ),
        margin: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
        color: Colors.blueGrey,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            texto!,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
