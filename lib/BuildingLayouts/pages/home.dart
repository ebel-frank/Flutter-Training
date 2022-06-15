import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Layouts",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.cloud_queue))],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Build Journal Header Image
          Image(
            image: AssetImage("assets/dawn.jpg"),
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Build Journal Entry
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Birthday",
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                      "It's going to be a great birthday. We are going out for dinner at my favourite place, then watch a moview after we got to the galateria for ice cream and espresso. ",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
                Divider(),
                // Build Journal Weather
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.orange,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "81º Clear",
                              style: TextStyle(color: Colors.deepOrange),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "4500 San Alpho Drive, Dallas, TX United States",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Divider(),
                // Build Journal Tags
                Wrap(
                  spacing: 8.0,
                  children: List.generate(
                      7,
                      (index) => Chip(
                            label: Text(
                              "Gift ${index + 1}",
                              style: TextStyle(fontSize: 10),
                            ),
                            avatar: Icon(
                              Icons.card_giftcard,
                              color: Colors.blue.shade300,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: Colors.grey)),
                            backgroundColor: Colors.grey.shade100,
                          )),
                ),
                Divider(),
                // Build Journal Footer Images
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/siblings.jpg"),
                      radius: 40,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/siblings.jpg"),
                      radius: 40,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/siblings.jpg"),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(Icons.cake),
                          Icon(Icons.star_border),
                          Icon(Icons.music_note),
                          // Icon(Icons.movie),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(),
                //
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
