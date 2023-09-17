import 'package:flutter/material.dart';
import 'package:rezbot/screens/classscreen.dart';

import '../api/cohere.dart';

class HomeScreen extends StatefulWidget {
//   final Camera camera;
//   final StreamClient client;
//   final ResourceName resourceName;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentindex = 0;
  late String prompt = "";
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Rezbot",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text('Home'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Camera View",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassScreen()));
                      },
                      child: Text('Upload Media'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassScreen()));
                      },
                      child: Text('Voiceflow'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassScreen()));
                      },
                      child: Text('Cohere'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width) -
                      ((MediaQuery.of(context).size.width) / 3),
                  height: (MediaQuery.of(context).size.height) - 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(3.0, 6.0),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Text("Hi"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) -
                            ((MediaQuery.of(context).size.width) / 1.4),
                        height: (MediaQuery.of(context).size.height) -
                            ((MediaQuery.of(context).size.height) / 1.5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(3.0, 6.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Ask a Question",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 16),
                                      child: Container(
                                        height: 50,
                                        width: 300,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Required';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            this.prompt = value;
                                          },
                                          controller: myController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Ask a question',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          myController.clear();
                                          //PromtAsk().searchCohere(context, prompt);
                                        },
                                        child: Icon(Icons.arrow_right),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) -
                            ((MediaQuery.of(context).size.width) / 1.4),
                        height: (MediaQuery.of(context).size.height) -
                            ((MediaQuery.of(context).size.height) / 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(3.0, 6.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Ask a Question",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 16),
                                      child: Container(
                                        height: 50,
                                        width: 300,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Required';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            this.prompt = value;
                                          },
                                          controller: myController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Ask a question',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          myController.clear();
                                          PromtAsk()
                                              .searchCohere(context, prompt);
                                        },
                                        child: Icon(Icons.arrow_right),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
