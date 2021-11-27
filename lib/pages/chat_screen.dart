import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({Key? key}) : super(key: key);

  @override
  _ChatScreenPageState createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            //chatMessages(),

            Container(
              width: 350,
              alignment: const Alignment(0.1, -0.80),
              child: Row(children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  iconSize: 25,
                ),
                  const Icon(Icons.account_circle_rounded,size:50),
                const Text(" Nombre usuario",
                    style: TextStyle(
                      fontSize: 18.0,
                    )),
              ]),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Escribe lo que quieras decir",
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.6))),
                    )),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    /*return Scaffold(
      body: Builder(
        builder: (context) => SafeArea(
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Color.fromRGBO(0, 0, 0, 1.0),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              iconSize: 28,
                            ),
                            Wrap(children: const [
                              Icon(Icons.account_circle_rounded, size: 30),
                              Text(" Nombre persona",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  )),
                            ]),
                          ],
                        )),
                  ),
                  Container(
                      child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 12, top: 15, right: 12),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),

                    ],
                  )),

                ],
              ),
            ),
          ]),
        ),
      ),
      /*body: Container(
        child: Stack(
          children: [
            //chatMessages(),
            Container(
              padding: const EdgeInsets.only(left: 12, top: 36, right: 12, bottom: 6),
              alignment: Alignment.topLeft,
              child: const
              Text('Nombre usuario',
                  style:
                  TextStyle(color: Colors.black, fontSize: 20)),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Escribe lo que quieras decir ",
                              hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.6))),
                        )),
                    GestureDetector(
                      onTap: () {
                        //addMessage(true);
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),*/
    );*/
  }
}
