import 'package:flutter/material.dart';

class AssessmentTask extends StatefulWidget {
  const AssessmentTask({Key? key}) : super(key: key);

  @override
  _AssessmentTaskState createState() => _AssessmentTaskState();
}

class _AssessmentTaskState extends State<AssessmentTask> {
  bool showScrollButton = false;
  bool isClicked = false;

  ScrollController _scrollController = ScrollController();
  final List<String> listItems = List.generate(20, (i) => "$i");

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            showScrollButton = true; // show the back-to-top button
          } else {
            showScrollButton = false; // hide the back-to-top button
          }
        });
      });
  }


  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: isClicked
              ? Stack(
                children: [
                  ListView.builder(
                  controller: _scrollController,
                  itemCount: listItems.length,
                  itemBuilder: (_, index){
                    return FittedBox(
                      fit: BoxFit.fill,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 100),
                        color: Colors.redAccent,
                        child: Text(
                          "HELLO-${listItems[index]}",
                          style: const TextStyle(color: Colors.white30, fontSize: 500),
                        ),
                      ),
                    );
                  }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(showScrollButton?Colors.green:Colors.grey),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            showScrollButton?"Enable":"Disable",
                            style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.white),
                          )),

                      TextButton(
                          onPressed: () {
                            setState(() {
                              isClicked = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.lightGreen),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Close",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.white),
                          )),
                    ],
                  )

                ],
              )
              : TextButton(
                  onPressed: () {
                    setState(() {
                      isClicked = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pinkAccent),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Click Here",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.white),
                  )),
        ),
      ),
    );
  }
}
