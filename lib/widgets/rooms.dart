import 'package:flutter/material.dart';
import 'package:test/config/palette.dart';
import 'package:test/models/models.dart';
import 'package:test/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
          itemCount: 1 + onlineUsers.length,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => print("Create Room"),
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            side: BorderSide(color: Colors.blue, width: 2.0),
            textStyle: TextStyle(color: Palette.facebookBlue)),
        child: Row(
          children: [
            ShaderMask(
                shaderCallback: (rect) =>
                    Palette.createRoomGradient.createShader(rect),
                child: Icon(Icons.video_call, size: 35.0, color: Colors.white)),
            const SizedBox(
              width: 4.0,
            ),
            Text("Create\nRoom")
          ],
        ));
  }
}
