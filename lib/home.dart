import 'package:flutter/material.dart';
import 'package:Sahju/Createnew.dart';
import 'package:Sahju/Update.dart';
import 'package:Sahju/localDb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listValue = [];
  bool value = true;

  @override
  void initState() {
    super.initState();
    readDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('SAHJU'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 90, 216, 97),
      ),
      /////////////////////////////////////////////////////////////////////////
      body: ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: _listValue.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 70,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    color: Color.fromARGB(255, 169, 215, 120),
                    shadowColor: Colors.green.shade500,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () async {
                                var readVal = await LocalDatabase()
                                    .readSingleData(
                                        id: _listValue[index]['id']);
                                print(readVal[0]);

                                if (readVal != null) {
                                  // ignore: use_build_context_synchronously
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      var alertDialog = AlertDialog(
                                        //--------------------

                                        title: const Text(
                                          'Details Info.',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: SizedBox(
                                          height: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Website:',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      readVal[1],
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Email:',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      readVal[2],
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Password:',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      readVal[3],
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color.fromARGB(
                                                      255, 90, 216, 97)),
                                            ),
                                          ),
                                        ],

                                        //---------
                                      );
                                      return alertDialog;
                                    },
                                  );
                                }
                              },
                              child: Text(
                                _listValue[index]['Website'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                var readVal = await LocalDatabase()
                                    .readSingleData(
                                        id: _listValue[index]['id']);
                                if (readVal != null) {
                                  var result = await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Update(
                                          id: readVal[0],
                                          website: readVal[1],
                                          email: readVal[2],
                                          password: readVal[3]),
                                    ),
                                  );
                                  if (result == 'updated') {
                                    readDatabase();
                                    setState(() {});
                                  }
                                }
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                var result = await LocalDatabase()
                                    .deleteData(id: _listValue[index]['id']);
                                if (result == 'Deleted') {
                                  readDatabase();
                                  setState(() {});
                                }
                                // ignore: use_build_context_synchronously
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                      'Deleted',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: const Text(
                                      'An item was deleted.',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Color.fromARGB(
                                                255, 90, 216, 97),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      //     Column(
      //   children: [
      //     Card(
      //       color: Color.fromARGB(255, 169, 215, 120),
      //       shadowColor: Colors.green.shade500,
      //       elevation: 5,
      //       child: Padding(
      //         padding: const EdgeInsets.fromLTRB(5.0, 20, 5, 20),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: const [
      //             Expanded(
      //               flex: 6,
      //               child: Text(
      //                 'Title1',
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 2,
      //               child: Icon(
      //                 Icons.edit_outlined,
      //                 color: Colors.white,
      //                 size: 25,
      //               ),
      //             ),
      //             Expanded(
      //               flex: 2,
      //               child: Icon(
      //                 Icons.delete_outline,
      //                 color: Colors.white,
      //                 size: 25,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      /////////////////////////////////////////////////////////////////////////
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Createnew()));

          if (result == 'created') {
            readDatabase();
            setState(() {});
          }
        },
        backgroundColor: const Color.fromARGB(255, 90, 216, 97),
        child: const Icon(Icons.add),
      ),
    );
  }

  readDatabase() async {
    final testData = await LocalDatabase().readAllData();
    setState(() {
      _listValue = testData;
    });
  }

  readDetail({id}) async {
    var detailData = await LocalDatabase().readSingleData();
    print("readDetail function ------- ${detailData}");
    return detailData;
  }
}
