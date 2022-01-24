import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'dart:io';

import 'package:lettutor/models/booking.dart';
import 'package:lettutor/models/room.dart';

import 'dart:developer' as dev;

class VideoLearningUI extends StatefulWidget {
  VideoLearningUI({Key? key, required this.booking}) : super(key: key) {
    Uri studentLink = Uri.parse(booking.studentMeetingLink ?? "");
    String tokenS = studentLink.queryParameters["token"] ?? "";
    userToken = tokenS;
    String token = tokenS.split(".")[1];
    if (token.length % 4 > 0) {
      token += '=' * (4 - token.length % 4); // as suggested by Albert221
    }
    String decoded = utf8.decode(Base64Decoder().convert(token));
    room = RoomModel.fromRawJson(decoded);
  }

  final BookingModel booking;
  late RoomModel room;
  late String userToken;

  @override
  _VideoLearningUIState createState() => _VideoLearningUIState();
}

class _VideoLearningUIState extends State<VideoLearningUI> {
  bool? isAudioOnly = true;
  bool? isAudioMuted = true;
  bool? isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
    _joinMeeting();
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: SafeArea(
        child: Container(
          child: Center(
            child: Text("Lettutor"),
          ),
        ),
      ),
    );
  }

  _joinMeeting() async {
    String? serverUrl = widget.room.sub;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: widget.room.room!)
      ..serverURL = serverUrl
      ..subject = widget.room.roomName
      ..userDisplayName = widget.room.userCall!.name
      ..userEmail = widget.room.userCall!.email
      ..token = widget.userToken
      // ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      // ..audioOnly = isAudioOnly
      // ..audioMuted = isAudioMuted
      // ..videoMuted = isVideoMuted
      // ..featureFlags.addAll(featureFlags)

      ..webOptions = {
        "roomName": widget.room.roomName,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": widget.room.userCall!.name}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {

            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }

}
