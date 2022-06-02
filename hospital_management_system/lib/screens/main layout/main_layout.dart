import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.action, required this.child})
      : super(key: key);

  final bool action;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ThemeData().primaryColor,
              height: 103,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 99,
                    height: 25,
                    margin: const EdgeInsets.only(left: 70),
                    child: const Text(
                      'Logo Klinik',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  action == true
                      ? Container(
                          padding: const EdgeInsets.only(right: 60),
                          child: Row(
                            children: [
                              const Text(
                                'Manage Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 43,
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 16,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
