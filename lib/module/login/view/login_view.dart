import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://i.ibb.co/Y20L5Mr/photo-1502899576159-f224dc2349fa-ixlib-rb-4-0.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black45,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon/icon.png",
                    width: Get.width / 1.6,
                    height: Get.width / 1.6,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48.0,
                    child: ElevatedButton.icon(
                      icon: const Icon(MdiIcons.google),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CurrentTheme.mainColor,
                      ),
                      label: const Text("Login as Member"),
                      onPressed: () => controller.doLoginAsMember(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48.0,
                    child: ElevatedButton.icon(
                      icon: const Icon(MdiIcons.google),
                      label: const Text("Login as Vendor"),
                      onPressed: () => controller.doLoginAsVendor(),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "Term of service",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
