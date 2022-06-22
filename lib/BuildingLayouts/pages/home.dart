import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Nature> nature = [];
  int _currentIndex = 0;

  void update(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    nature
      ..add(Nature(
          title: "Stars",
          description: "star, any massive self-luminous celestial body of gas that shines by radiation derived from its internal energy sources. Of the tens of billions of trillions of stars composing the observable universe, only a very small percentage are visible to the naked eye. Many stars occur in pairs, multiple systems, or star clusters. The members of such stellar groups are physically related through common origin and are bound by mutual gravitational attraction. Somewhat related to star clusters are stellar associations, which consist of loose groups of physically similar stars that have insufficient mass as a group to remain together as an organization.",
          temp: "26 °C", // cloud white
          location: "The Galaxy, from a telescope",
          tags: ["stars", "space", "night", "photo", "astrology", "nature"],
          reference: "www.britannica.com",
          imgPath: "assets/dawn.jpg"))
      ..add(Nature(
          title: "Forest",
          description: "A forest is an area of land dominated by trees. Hundreds of definitions of forest are used throughout the world, incorporating factors such as tree density, tree height, land use, legal standing, and ecological function. The United Nations' Food and Agriculture Organization (FAO) defines a forest as, 'Land spanning more than 0.5 hectares with trees higher than 5 meters and a canopy cover of more than 10 percent, or trees able to reach these thresholds in situ. It does not include land that is predominantly under agricultural or urban use.' Using this definition, Global Forest Resources Assessment 2020 (FRA 2020) found that forests covered 4.06 billion hectares (10.0 billion acres; 40.6 million square kilometres; 15.7 million square miles), or approximately 31 percent of the world's land area in 2020",
          temp: "50 °F",
          location: "Amazon Forest",
          tags: ["green", "forest", "nature_photography", "outdoors", "astrology", "nature", "travel","trees"],
          reference: "en.wikipedia.org",
          imgPath: "assets/nature.jpg"))
      ..add(Nature(
          title: "Sea",
          description: "The sea, connected as the world ocean or simply the ocean, is the body of salty water that covers approximately 71 percent of the Earth's surface. The word sea is also used to denote second-order sections of the sea, such as the Mediterranean Sea, as well as certain large, entirely landlocked, saltwater lakes, such as the Caspian Sea. The sea moderates Earth's climate and has important roles in the water cycle, carbon cycle, and nitrogen cycle. Humans harnessing and studying the sea have been recorded since ancient times, and evidenced well into prehistory, while its modern scientific study is called oceanography. The most abundant solid dissolved in seawater is sodium chloride. The water also contains salts of magnesium, calcium, potassium, and mercury, amongst many other elements, some in minute concentrations. Salinity varies widely, being lower near the surface and the mouths of large rivers and higher in the depths of the ocean; however, the relative proportions of dissolved salts vary little across the oceans.",
          temp: "30 °C",
          location: "Caspian Sea",
          tags: ["beach", "sea", "photography", "photo", "vacation", "adventure", "waves", "explore", "hawaii"],
          reference: "en.wikipedia.org",
          imgPath: "assets/oceans.jpg"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nature",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Build Journal Header Image
          Image(
            image: AssetImage(nature[_currentIndex].imgPath),
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Build Journal Entry
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nature[_currentIndex].title,
                          style: const TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "From ${nature[_currentIndex].reference}",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Divider(),
                        ExpandableText(
                          nature[_currentIndex].description,
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 3,
                          linkColor: Colors.blue,
                          animation: true,
                          animationDuration: const Duration(milliseconds: 900),
                          style: const TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                    const Divider(),
                    // Build Journal Weather
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.wb_sunny,
                              color: Colors.orange,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  nature[_currentIndex].temp,
                                  style: const TextStyle(color: Colors.deepOrange),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  nature[_currentIndex].location,
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    const Text(
                      "Tags",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(height: 8,),
                    // Build Journal Tags
                    Wrap(
                      spacing: 8.0,
                      children: List.generate(
                          nature[_currentIndex].tags.length,
                              (index) =>
                              Chip(
                                label: Text(
                                  nature[_currentIndex].tags[index],
                                  style: const TextStyle(fontSize: 10),
                                ),
                                backgroundColor: Colors.grey.shade300,
                              )),
                    ),
                    const Divider(),
                    const Text(
                      "Gallery",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(height: 10,),
                    // Build Journal Footer Images
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            update(0);
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(nature[0].imgPath),
                            radius: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            update(1);
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(nature[1].imgPath),
                            radius: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            update(2);
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(nature[2].imgPath),
                            radius: 40,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    //
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}

class Nature {
  final String title, description, temp, location, reference, imgPath;
  List<String> tags;

  Nature({required this.title, required this.description, required this.temp, required this.location,
    required this.tags, required this.reference, required this.imgPath});
}
