import 'package:flutter/material.dart';
import 'package:tripadvisor/constants.dart';

class Blog extends StatelessWidget {
  const Blog({super.key, required this.data, required this.title});
  final List<Widget> data;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlogAppBar(title: title),
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.4),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return data[index];
              }),
        ),
      ),
    );
  }
}

class BlogAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlogAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.chevron_left_rounded,
          size: 35,
        ),
      ),
      title: Text(
        title,
        maxLines: 2,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share_outlined,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
