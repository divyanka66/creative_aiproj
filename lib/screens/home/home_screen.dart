import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';
import 'widgets/post_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<HomeProvider>(context, listen: false).getPosts();
    });

    scrollController.addListener(() {
      final provider = Provider.of<HomeProvider>(context, listen: false);

      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 300 &&
          !provider.isPaginationLoading &&
          provider.hasMore) {
        provider.getPosts(pagination: true);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Consumer<HomeProvider>(
        builder: (_, provider, __) {
          if (provider.isLoading && provider.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.posts.isEmpty) {
            return const Center(
              child: Text(
                "No Posts Found",

                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            controller: scrollController,

            padding: EdgeInsets.zero,

            physics: const BouncingScrollPhysics(),

            scrollDirection: Axis.vertical,

            itemExtent: MediaQuery.of(context).size.height,

            itemCount:
                provider.posts.length + (provider.isPaginationLoading ? 1 : 0),

            itemBuilder: (_, index) {
              if (index == provider.posts.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final post = provider.posts[index];

              return PostItem(
                post: post,

                onLike: () {
                  provider.toggleLike(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
