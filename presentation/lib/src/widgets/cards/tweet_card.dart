import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/widgets/buttons/like_dislike_buttons.dart';

class TweetCard extends StatelessWidget {
  final ArticleModel tweet;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const TweetCard({Key? key, required this.tweet, required this.scaffoldMessengerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(color: Theme.of(context).canvasColor, offset: Offset(10, 10), blurRadius: 10.0)],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: InkWell(
              onTap: () => Navigator.of(context).pushNamed('/profile', arguments: 'tweet.user.username'),
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://source.unsplash.com/daily?code'),
                backgroundColor: Theme.of(context).cardColor,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  // onTap: () => Navigator.of(context)
                  //     .pushNamed('/profile', arguments: tweet.user.username),
                  child: Container(
                    width: size.width / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('tweet.us', style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis),
                        Text("@tweet.un", style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                ),
                Text(
                  // timeago.format(tweet.createdAt, locale: 'en_short'),
                  '5 min ago',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  color: Theme.of(context).textSelectionTheme.cursorColor,
                  onPressed: () {
                    // TweetActionsModal().mainBottomSheet(context, tweet)
                  },
                ),
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [TextSpan(text: tweet.body)]
                        // parseBody(tweet.body).map((body) => bodyTextSpan(body, context, Theme.of(context).textTheme.bodyText1)).toList(),
                        ),
                  ),
                  tweet.image != null
                      ? Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: InkWell(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => PhotoViewScreen(
                              //       title: '',
                              //       actionText: '',
                              //       imageProvider: NetworkImage(tweet.image),
                              //       onTap: () {},
                              //     ),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 200.0,
                              width: 320.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [BoxShadow(color: Theme.of(context).canvasColor, offset: Offset(0, 5), blurRadius: 10.0)],
                                image: DecorationImage(image: NetworkImage('https://source.unsplash.com/daily?code'), fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.fromLTRB(90.0, 0.0, 50.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(width: MediaQuery.of(context).size.width / 3, child: LikeDislikeButtons()),
                // AddReplyButton(child: AddReplyButtonWidget(tweet: tweet, scaffoldMessengerKey: scaffoldMessengerKey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
