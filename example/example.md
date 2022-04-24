Here the example of all method, enjoy coding 😃

```dart
import 'package:flutter/material.dart';
import 'package:smtpman/port.dart';
import 'package:smtpman/secure.dart';
import 'package:smtpman/smtpman.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  sendMyMail() async {
    SmtpMan smtpman = SmtpMan();
    smtpman.setServer(
      host: "smtp.rohitchouhan.com",
      username: "hello@crohitchouhan.com",
      password: "<<password>>",
      authentication: true,
      port: Port.to_587,
      secure: Secure.starttls,
    );

    smtpman.receipt(
      senderName: "Rohit Team",
      sendToEmail: "itsrohitofficial@gmail.com",
      subject: "How are you....",
      body: "Hey, <b>Bro</b>",
      html: true,
    );

    if (await smtpman.send() == true) {
      debugPrint("Email has been sent!");
    } else {
      debugPrint("Faild to send, please check smtp credential.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await sendMyMail();
            },
            child: const Text("Send Mail")),
      ),
    );
  }
}
```