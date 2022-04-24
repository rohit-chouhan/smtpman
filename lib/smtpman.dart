library smtpman;

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SmtpMan {
  ///SMTP Server
  static String? host_;

  ///SMTP Username
  static String? username_;

  ///SMTP Email/Username
  static String? password_;

  ///SMTP Port Number
  static int? port_;

  ///SMTP Sender Name
  static String? name_;

  ///SMTP Authentication
  static bool? authentication_;

  ///Secure tls or ssl
  static String? secure_;

  ///Receiver Email
  static String? mailto_;

  ///Email Subject
  static String? subject_;

  ///Email Body
  static String? body_;

  ///Email HTML true or false
  static bool? html_;

  ///[setServer] create connection to SMTP Server
  setServer({host, username, password, authentication, port, secure}) {
    host_ = host;
    username_ = username;
    password_ = password;
    authentication_ = authentication;
    port_ = port;
    secure_ = secure;
  }

  ///[receipt] Email content body
  receipt({senderName, sendToEmail, subject, body, html}) {
    name_ = senderName;
    mailto_ = sendToEmail;
    subject_ = subject;
    body_ = body;
    html_ = html;
  }

  ///[send] will return email status
  Future<bool> send() async {
    Map<String, String> data = new Map();
    data['host'] = host_.toString();
    data['username'] = username_.toString();
    data['password'] = password_.toString();
    data['port'] = port_.toString();
    data['name'] = name_.toString();
    data['auth'] = authentication_.toString();
    data['secure'] = secure_.toString();
    data['mailto'] = mailto_.toString();
    data['subject'] = subject_.toString();
    data['body'] = body_.toString();
    data['html'] = html_.toString();

    debugPrint("mail send process started...");
    var url = Uri.parse('http://smtpman-sender.herokuapp.com');
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
