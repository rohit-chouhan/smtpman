A Fast & Light SMTP Mail Sender, with authentication support.
![](https://i.ibb.co/2yFHftV/carbon-1.png)
## Usage
#### 🚀 import package
```dart
import 'package:smtpman/port.dart';
import 'package:smtpman/secure.dart';
import 'package:smtpman/smtpman.dart';
```
#### 🚀 methods 
### ⭐setServer()
First create a connection with your SMTP server, using SetServer() method
```dart
smtpman.setServer(
    host: "smtp.rohitchouhan.com",
    username: "hello@crohitchouhan.com",
    password: "<<password>>",
    authentication: true,
    port: Port.to_587,
    secure: Secure.starttls,
);
```


| property  | desc  | ex   |
| ------------ | ------------ | ------------ |
| host  | Your SMTP Server Host Name   | smtp.rohitchouhan.com  |
| username  | Your Email Address  | flutter@rohitchouhan.com   |
| password  | Your Email Password  | XXXXXXXXX  |
| authentication  | To etablish your auth with smtp  | true / false   |
| port  | Your SMTP Port  | `Port.to_25`, `Port.to_587`,`Port.to_465`, or custom: `25, 465,587`   |
| secure | Your SMTP Secure  | `Secure.starttls`,`Secure.ssl`,`Secure.auto`, or custom: `tls,ssl`   |


### ⭐receipt()
then create receipt() method to add name, body, subject and all.
```dart
smtpman.receipt(
    senderName: "Rohit Team",
    sendToEmail: "itsrohitofficial@gmail.com",
    subject: "How are you....",
    body: "Hey, <b>Bro</b>",
    html: true,
);
```


| property  | desc  |
| ------------ | ------------ | 
| senderName  | Name of Sender   |
| sendToEmail  | Email Address where to send mail  |
| subject  | Subject of mail |
| body  | Body of mail |
| html | To enable html body use `true`,else `false` |


### ⭐send()
send method will return true if mail has send, else false.
```dart
if (await smtpman.send() == true) {
    debugPrint("Email has been sent!");
} else {
    debugPrint("Faild to send, please check smtp credential.");
}
```

## How its working?

![](https://i.ibb.co/g44s1vH/smtp.png)

Note: For those of you wondering, this package is not using any official library of Flutter. Email is sending from the third-party api using famous http package.

When you call the function from the app, its call the smtpman third-party api to the our server, then our server reads your email and sends it as a string.

The third-party api reads the string and uses it to send an email message on its own servers. Once it has done so (which could take several seconds or minutes), it sends an email back to our server with the subject and body of your message included in the body of the email.

Developed by <a href="https://linkedin.com/in/itsrohitchouhan">Rohit Chouhan ❤️</a>