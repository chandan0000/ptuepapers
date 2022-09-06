import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptuepapers/controller/utilscontroller.dart';
import "package:velocity_x/velocity_x.dart";

class study extends StatelessWidget {
  const study({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "PTU Papers".text.bold.make().shimmer(
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
            ),
        elevation: 5.0,
        titleSpacing: 20.0,
        actions: [
          Consumer<UtilsController>(builder: (context, value, snapshot) {
            return Switch(
                value: value.tDark,
                onChanged: ((val) {
                  value.darkTheme(val);
                }));
          })
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 1.0,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 150,
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.date_range_outlined,
                              size: 50,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "Class Time Table",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //2nd
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 150,
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.login,
                              size: 50,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "Student Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 150,
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.announcement,
                              size: 50,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "Announcements",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 150,
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.star,
                              size: 50,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "Syllabus",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 150,
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.book,
                              size: 50,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "Books And References",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 150,
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.airplanemode_on_rounded,
                              size: 50,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "Sample papers & previous year papers",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
