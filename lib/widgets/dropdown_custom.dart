import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<Widget> items;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.5, 1, 1, 0.5),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color.fromARGB(255, 43, 43, 43)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.title,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isOpen)
          Card(
            color: const Color.fromARGB(255, 43, 43, 43),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              children: widget.items,
            ),
          )
      ],
    );
  }
}
