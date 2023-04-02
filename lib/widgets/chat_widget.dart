import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.msg,
    required this.chatIdx,
    this.shouldAnimate = false,
  }) : super(key: key);

  final String msg;
  final int chatIdx;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: chatIdx == 0 ? scaffoldBg : cardColor,
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                chatIdx == 0 ? AssetsManager.userImage : AssetsManager.botImage,
                height: 30,
                width: 30,
              ),
              SizedBox(width: 8),
              Expanded(
                child: chatIdx == 0
                    ? TextWidget(label: msg)
                    : shouldAnimate
                        ? DefaultTextStyle(
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(msg.trim()),
                              ],
                            ),
                          )
                        : Text(
                            msg.trim(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
              ),
              chatIdx == 0
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.thumb_down_alt_outlined,
                          color: Colors.white,
                        ),
                      ],
                    )
            ],
          ),
        )
      ],
    );
  }
}
