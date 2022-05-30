import 'package:flutter/material.dart';

import 'customer_chat_screen.dart';

class VisitorPersonImageChatTime extends StatefulWidget {
  final String userName;
  final String userEmail;
  //final String userImageUrl;
  const VisitorPersonImageChatTime({
    required this.userName,
    required this.userEmail,
    //required this.userImageUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<VisitorPersonImageChatTime> createState() =>
      _VisitorPersonImageChatTimeState();
}

class _VisitorPersonImageChatTimeState
    extends State<VisitorPersonImageChatTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VisitorChatContactsScreen(
                userName: widget.userName,
                userEmail: widget.userEmail,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
          //backgroundImage: NetworkImage(widget.userImageUrl),
          backgroundImage: NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/hfv-app-2f84e.appspot.com/o/images.jpg?alt=media&token=37606c3b-870f-43ef-b5a1-1b13505ae1e1"),
        ),
        title: Text(widget.userName),
        // trailing: Text(
        //   '4 minutes ago',
        //   style: TextStyle(
        //     color: Colors.grey,
        //     fontSize: 15,
        //   ),
        // ),
      ),
    );
  }
}

class NoRecentChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No recent chats'),
    );
  }
}
