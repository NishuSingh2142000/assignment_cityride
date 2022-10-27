import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String locationName;
  final String date;
  final String text;
  final String? imagePath;
  final int likesCount;
  final int commentsCount;
  final String profilePath;

  const PostWidget({
    Key? key,
    required this.name,
    required this.locationName,
    required this.date,
    required this.text,
    this.imagePath,
    required this.likesCount,
    required this.commentsCount,
    required this.profilePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    int likes = likesCount;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipOval(
                  child: CircleAvatar(
                child: Image.asset(profilePath),
                backgroundColor: Colors.white,
              )),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '@$name',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' in $locationName',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ],
          ),
          verticalSpace,
          Text(
            text,
            // st
          ),
          verticalSpace,
          if (imagePath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath!,
                fit: BoxFit.cover,
              ),
            ),
          if (imagePath != null) verticalSpace,
          const Divider(
            color: Colors.black54,
          ),
          StatefulBuilder(
            builder: (context, setState) => Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      setState(() {
                        if (isLiked) {
                          likes--;
                          isLiked = !isLiked;
                        } else {
                          likes++;
                          isLiked = !isLiked;
                        }
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.red,
                    ),
                    label: Text(
                      '$likes likes',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )),
                TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: (context),
                        builder: (ctx) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            color: Colors.white,
                            child: const TextField(
                              decoration: InputDecoration(
                                  hintText: 'Type a comment...'),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.blue,
                    ),
                    label: Text(
                      '$commentsCount comments',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Share.share('check out my post http://samplelink.com',
                        subject: 'Look what I shared!');
                  },
                  icon: const Icon(
                    Icons.share,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border_rounded,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const verticalSpace = SizedBox(
  height: 8,
);
