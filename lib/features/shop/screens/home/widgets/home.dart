import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/features/shop/screens/home/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header

            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  THomeAppBar(),
                  //Searchbar

                  //Header
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
