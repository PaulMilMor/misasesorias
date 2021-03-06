import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatsPage extends StatefulWidget {
  const chatsPage({Key? key}) : super(key: key);

  @override
  _chatsPageState createState() => _chatsPageState();
}

class _chatsPageState extends State<chatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => SafeArea(
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text('Chats',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 12, top: 30, right: 12, bottom: 6),
                        ),
                        _chat("Alberto Singleton"),
                        const Divider(
                          color: Colors.grey,
                        ),
                        _chat("Lausa Mayor"),
                        const Divider(
                          color: Colors.grey,
                        ),
                        _chat("Luis Miguel")
                      ],
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _chat(String username) {
    return Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
              width: 350,
              height: 80,
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle_rounded,
                    size: 60,
                  ),
                  TextButton(
                    child: Text(username,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/chatscreen',
                          arguments: username);
                      ;
                    },
                  ),
                ],
              )),
        ]));
  }
}
