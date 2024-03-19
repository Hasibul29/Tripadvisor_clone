import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../blog.dart';

class BlogBody extends StatelessWidget {
  const BlogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Blog(
      title:
          "Everything you need to know about cherry blossom season in Washington, D.C.",
      data: [
        const SizedBox(height: kDefaultPadding),
        Text(
          "Everything you need to know about cherry blossom season in Washington, D.C.",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kDefaultPadding),
        Text(
          "Find peak petal perfection this spring.",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Icon(Icons.account_circle_outlined, size: 30),
          title: Text("By Nicholas DeRenzo Mar 7, 2024 ..."),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Image.asset(
            "assets/images/image2.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          "View of the Washington Monument and cherry blossom along the Tidal Basin in Washington, D.C.",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ullamcorper ante in eros posuere condimentum. Quisque quis faucibus elit. Vestibulum bibendum eros ac mollis vestibulum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut a mauris nec turpis fermentum tristique et non libero. Ut eu porta purus. Nulla semper dignissim ultrices. Aliquam erat volutpat. In fringilla finibus suscipit. Aliquam varius diam vel arcu ullamcorper rhoncus. Nullam congue sapien sagittis sapien maximus, eu placerat turpis iaculis. Integer vulputate vel tortor ac pretium. Sed quis nibh in risus volutpat dapibus at eu libero. Donec facilisis lacus eget erat ornare, et sagittis justo euismod. Sed ornare dolor non neque congue faucibus. Morbi vitae cursus orci, sit amet suscipit elit.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: kDefaultPadding),
      ],
    );
  }
}
