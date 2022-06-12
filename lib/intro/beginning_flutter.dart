import 'package:flutter/material.dart';
import 'package:training/intro/pages/animation_controller.dart';
import 'package:training/intro/pages/choose_location.dart';
import 'package:training/intro/pages/loading.dart';
import 'package:training/intro/product_manager.dart';

/*main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      *//*theme: ThemeData(primarySwatch: Colors.deepOrange),*//*
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => const OrientationWidget(),
        '/location': (context) => const ChooseLocation(),
      },
    ));*/

class OrientationWidget extends StatelessWidget {
  const OrientationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Orientation"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    StaggeredAnimatedBalloonWidget(),
                    AnimatedBalloonWidget(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return _orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.school,
                size: 48,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.school,
                size: 48,
              ),
              Icon(
                Icons.brush,
                size: 48,
              ),
            ],
          );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 5.0,
      children: List.generate(
          8,
          (index) => Text(
                "Grid $index",
                textAlign: TextAlign.center,
              )),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait
            ? Container(
                alignment: Alignment.center,
                color: Colors.yellow,
                height: 100.0,
                width: 100.0,
                child: const Text("Portrait"),
              )
            : Container(
                alignment: Alignment.center,
                color: Colors.lightGreen,
                height: 100.0,
                width: 100.0,
                child: const Text("Landscape"),
              );
      },
    );
  }
}

class OrientationBuilderWidget2 extends StatelessWidget {
  const OrientationBuilderWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return _orientation == Orientation.portrait
        ? Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            height: 100.0,
            width: 100.0,
            child: const Text("Portrait"),
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.lightGreen,
            height: 100.0,
            width: 100.0,
            child: const Text("Landscape"),
          );
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  final double _height = 100;
  double _width = 100;

  _increaseWidth() {
    setState(() {
      _width = _width >= 300 ? 100.0 : _width + 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          color: Colors.amber,
          height: _height,
          width: _width,
          child: ElevatedButton(
              onPressed: () {
                _increaseWidth();
              },
              child: Text("Tap to\nGrow Width\n$_width")),
        ),
      ],
    );
  }
}

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = !_crossFadeStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCrossFade(
                crossFadeState: _crossFadeStateShowFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                sizeCurve: Curves.easeOut,
                firstChild: Container(
                  color: Colors.pink,
                  height: 100,
                  width: 100,
                ),
                secondChild: Container(
                  color: Colors.lightGreen,
                  height: 200,
                  width: 200,
                ),
                duration: const Duration(milliseconds: 500)),
            Positioned.fill(
                child: TextButton(
              child: const Text(
                'Tap to\nFade Color & Size',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _crossFade();
              },
            ))
          ],
        ),
      ],
    );
  }
}

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({Key? key}) : super(key: key);

  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 1.0;

  void _animateOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.3 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 1000),
          child: Container(
            color: Colors.amber,
            height: 100,
            width: 100,
            child: TextButton(
              child: const Text("Tap to Fade", style: TextStyle(color: Colors.black)),
              onPressed: () {
                _animateOpacity();
              },
            ),
          ),
        )
      ],
    );
  }
}

class FirstTraining extends StatelessWidget {
  const FirstTraining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Training"),
      ),
      body: const ProductManager("Emeka Ebeledike and Kosiso Ebeledike"),
    );
  }
}

class SecondTraining extends StatelessWidget {
  const SecondTraining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Runes myEmoji = Runes('\u{1f607}');

    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Tree" + String.fromCharCodes(myEmoji)),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const PopUpMenuButtonWidget()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text("Column 1"),
                Divider(),
                Text("Column 2"),
                Divider(),
                Text("Column 3"),
                ImagesAndIconWidget(),
                Divider(),
                DecorationWidget(),
                Divider(),
                InputDecorationWidget(),
                Divider(),
                FormValidationWidget(),
                Divider(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_circle_fill),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem(this.title, this.icon);
}

List<TodoMenuItem> foodMenuList = [
  TodoMenuItem("Fast Food", const Icon(Icons.fastfood)),
  TodoMenuItem("Remind me", const Icon(Icons.add_alarm)),
  TodoMenuItem("Flight", const Icon(Icons.flight)),
  TodoMenuItem("Music", const Icon(Icons.audiotrack)),
];

class PopUpMenuButtonWidget extends StatelessWidget {
  const PopUpMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodoMenuItem>(
      icon: const Icon(Icons.more_vert),
      onSelected: ((valueSelected) {
        print('valueSelected: ${valueSelected.title}');
      }),
      itemBuilder: (BuildContext context) {
        return foodMenuList
            .map((todoMenuItem) => PopupMenuItem(
                value: todoMenuItem,
                child: Row(
                  children: [
                    todoMenuItem.icon,
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(todoMenuItem.title)
                  ],
                )))
            .toList();
      },
    );
  }
}

class ImagesAndIconWidget extends StatelessWidget {
  const ImagesAndIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: const AssetImage("assets/siblings.jpg"),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
        const Icon(
          Icons.brush,
          color: Colors.lightBlue,
          size: 50.0,
        ),
        Image(
          image: const AssetImage("assets/siblings.jpg"),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
      ],
    );
  }
}

class DecorationWidget extends StatelessWidget {
  const DecorationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              offset: Offset(0, 10),
            )
          ]),
    );
  }
}

class InputDecorationWidget extends StatelessWidget {
  const InputDecorationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16.0),
          decoration: const InputDecoration(
              labelText: "Notes",
              icon: Icon(Icons.call_sharp),
              labelStyle: TextStyle(color: Colors.purple),
              // border: OutlineInputBorder()
              border: UnderlineInputBorder()),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: 'Enter your notes', icon: Icon(Icons.wifi_password)),
        )
      ],
    );
  }
}

class FormValidationWidget extends StatefulWidget {
  const FormValidationWidget({Key? key}) : super(key: key);

  @override
  State<FormValidationWidget> createState() => _FormValidationWidgetState();
}

class _FormValidationWidgetState extends State<FormValidationWidget> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Order _order = Order();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formStateKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            const Center(child: Text("Form Validation")),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Espresso", labelText: "Item"),
              validator: (value) => _validateItemRequired(value!),
              onSaved: (value) => _order.item = value!,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(hintText: "3", labelText: "Quantity"),
              validator: (value) => _validateItemCount(value!),
              onSaved: (value) => _order.quatity = int.parse(value!),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () => _submitOrder(), child: const Text("Save"))
          ],
        ));
  }

  String? _validateItemRequired(String value) {
    return value.isEmpty ? "Item Required" : null;
  }

  String? _validateItemCount(String value) {
    int _valueAnInteger = value.isEmpty ? 0 : int.parse(value);
    return _valueAnInteger == 0 ? "At least one item is Required" : null;
  }

  String? _submitOrder() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      print("Order Item: ${_order.item}");
      print("Order Quantity: ${_order.quatity}");
    }
  }
}

class Order {
  late String item;
  late int quatity;
}

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Ninja ID Card"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/siblings.jpg"),
                radius: 50,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[100],
            ),
            const Text(
              "NAME",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Frank Ebeledike",
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "CURRENT DEVELOPER RATING",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$rating",
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.email, size: 25, color: Colors.grey[400]),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "ebelfrank.dev@gmail.com",
                  style: TextStyle(
                      color: Colors.grey[400],
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rating++;
                    });
                  },
                  child: const Text(
                    "Add Stars",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
