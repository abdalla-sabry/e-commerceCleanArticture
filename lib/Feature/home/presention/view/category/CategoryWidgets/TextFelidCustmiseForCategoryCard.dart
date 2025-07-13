import 'package:flutter/material.dart';

class TextFeildCustmiseForCategorycard extends StatefulWidget {
  const TextFeildCustmiseForCategorycard({super.key});

  @override
  State<TextFeildCustmiseForCategorycard> createState() => _TextFeildCustmiseForCategorycardState();
}

class _TextFeildCustmiseForCategorycardState extends State<TextFeildCustmiseForCategorycard> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
          ),
          child: TextField(
            controller: _textEditingController,
            autofocus: false,
            onSubmitted: (val) {
            },
            onChanged: (val) => setState(() {
            }),
            decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.only(left: 20, bottom: 22, top: 22),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.search),
                ),
                suffixIcon: _textEditingController.text.isNotEmpty
                    ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _textEditingController.clear();
                        });
                      },
                      icon: const Icon(Icons.clear)),
                )
                    : null,
                border: const OutlineInputBorder(),
                hintText: "Search Category",
                fillColor: Colors.grey.shade100,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(26)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide:
                  const BorderSide(color: Colors.white, width: 3.0),
                )),
          ),
        ),
      ),
    );
  }
}
