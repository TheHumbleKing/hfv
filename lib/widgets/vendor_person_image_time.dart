import 'package:flutter/material.dart';

import '../VendorChat/vendor_chat_screen.dart';

class VendorPersonImageChatTime extends StatefulWidget {
  final String userName;
  final String userEmail;
  //final String userImageUrl;
  const VendorPersonImageChatTime({
    required this.userName,
    required this.userEmail,
    //required this.userImageUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<VendorPersonImageChatTime> createState() =>
      _VendorPersonImageChatTimeState();
}

class _VendorPersonImageChatTimeState extends State<VendorPersonImageChatTime> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorChatContactsScreen(
              userName: widget.userName,
              userEmail: widget.userEmail,
            ),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 25,
        // backgroundImage: NetworkImage(widget.userImageUrl),
        backgroundImage: NetworkImage(
            "https://firebasestorage.googleapis.com/v0/b/hfv-app-2f84e.appspot.com/o/images.jpg?alt=media&token=37606c3b-870f-43ef-b5a1-1b13505ae1e1"),
      ),
      title: Text(widget.userName),
    );
  }
}

// class NoRecentChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('No recent chats'),
//     );
//   }
//}
