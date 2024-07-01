import 'package:flutter/material.dart';

import '../../Model/chracter_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.chracter});

  final Chracter chracter;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.chracter.name ?? ""),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.width,
                width: size.width,
                child: Hero(
                  tag: widget.chracter.id!,
                  child: Image(
                    image: NetworkImage(widget.chracter.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.chracter.name!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                        ),
                      ],
                    ),
                    Text(
                      "also known as",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      widget.chracter.alternateNames!.join(",\n"),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.black54,
                              height: 2,
                              width: double.maxFinite,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.person),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.black54,
                              height: 2,
                              width: double.maxFinite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Species: ${widget.chracter.species}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Gender: ${widget.chracter.gender}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "House: ${widget.chracter.house}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "DOB: ${widget.chracter.dateOfBirth}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Eye Color: ${widget.chracter.eyeColour}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Hair Color: ${widget.chracter.hairColour}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Ancestry: ${widget.chracter.ancestry}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.black54,
                              height: 2,
                              width: double.maxFinite,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.sign_language),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.black54,
                              height: 2,
                              width: double.maxFinite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Wand: ${widget.chracter.wand?.wood ?? ""}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Core: ${widget.chracter.wand?.core ?? ""}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Wand Length: ${widget.chracter.wand?.length ?? ""}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
