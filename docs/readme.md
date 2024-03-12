# Telegram Client Docs

Telegram Client Adalah library untuk berinteraksi / menggunakan api telegram (TELEGRAM BOT API / MTPROTO / TDLIB) library memiliki tingkat kesulitan lumayan hal ini di lakukan agar bisa flexible di pasang di segala tempat dan bisa di extend ke skala besar / bisnis

Untuk menambahkan di project anda anda harus mengerti basic program (DART / FLUTTER)

Pertama kalian install dahulu melalui ini

## DART / FLUTTER PROJECT

dart pub add telegram_client


## IMPORT / LIBRARY

import 'package:telegram_client/telegram_client.dart';


Library ini di bagi menjadi banyak jenis api

1. Telegram Client
   Telegram Client merupakan api untuk menghubungkan antara program tdlib dan bot api sehingga anda bisa mengontrol bot dan userbot sekaligus anda dapat membuat app dengan mudah menggunakan api ini.
2. TDLIB
   TDLIB merupakan api TDLIB untuk kamu yang ingin menggunakan semuat fitur tdlib api ini lumayan sulit karena kami gk menyediakan / mempermudah rest api hal ini di lakukan agar kamu bisa memakai api paling update dari tdlib tanpa kami update library ini.
3. TELEGRAM BOT API
   TELEGRAM BOT API merupakan api TELEGRAM BOT API untuk kamu yang ingin menggunakan semuat fitur TELEGRAM BOT API api ini lumayan sulit karena kami gk menyediakan / mempermudah rest api hal ini di lakukan agar kamu bisa memakai api paling update dari tdlib tanpa kami update library ini
4. MTPROTO
   MTPROTO merupakan api telegram resmi api ini memiliki fitur yang lebih luas dan kompleks tapi rentan banned karena anda harus mengatur flood wait sendiri kami tidak menyarankan anda untuk menggunakan ini jika anda membuat userbot / bot jika anda ingin membuat bot / userbot sebaiknya tdlib, namun jika anda ingin membuat app lebih baik menggunakan ini karena tidak terlalu berat pada penggunaan memori ram