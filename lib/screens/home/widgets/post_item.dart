import 'package:flutter/material.dart';

import '../../../models/post_model.dart';
import 'video_player_widget.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  final VoidCallback onLike;

  const PostItem({super.key, required this.post, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,

      children: [
        if (post.mediaType == "image")
          Image.network(
            post.imageUrl.isNotEmpty ? post.imageUrl.first : "",

            fit: BoxFit.cover,

            errorBuilder: (_, __, ___) {
              return Container(color: Colors.black);
            },
          ),

        if (post.mediaType == "video")
          VideoPlayerWidget(videoUrl: post.videoUrl),

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,

              end: Alignment.bottomCenter,

              colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
            ),
          ),
        ),

        Positioned(
          left: 15,

          bottom: 80,

          right: 80,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,

                    backgroundImage: post.profileImage.isNotEmpty
                        ? NetworkImage(post.profileImage)
                        : null,
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      post.userName,

                      style: const TextStyle(
                        color: Colors.white,

                        fontSize: 16,

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                post.caption,

                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),

        Positioned(
          right: 15,

          bottom: 120,

          child: Column(
            children: [
              IconButton(
                onPressed: onLike,

                icon: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,

                  color: post.isLiked ? Colors.red : Colors.white,

                  size: 34,
                ),
              ),

              Text(
                "${post.totalLikes}",

                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 20),

              const Icon(Icons.comment, color: Colors.white, size: 34),
            ],
          ),
        ),
      ],
    );
  }
}
