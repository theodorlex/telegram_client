import 'package:telegram_client_documentation/scheme/scheme.dart';

List<DocData> docDatas = [
  DocData.create(
    doc_id: "mtproto",
    title: "Mtproto",
    description: """
Mtproto adalah library yang paling ringan cepat tidak memerlukan ffi namun jika menggunakan ini harap jangan flood / mencoba call api
berkali kali karena api ini direct ke telegram langsung sehingga akan sangat mudah di banned jika menggunakan ini (api ini di gunakan jika anda sudah mahir coding + perhitungan limitasi api)
""".trim(),
  ),
  DocData.create(
    doc_id: "tdlib",
    title: "Telegram Database Library (TDLIB)",
    description: """
Tdlib adalah library cross platform cpp, kami menggunakan ffi agar bisa mengakses tdlib, tdlib sangat di rekomendasikan karena
sangat mudah di gunakan, namun jika untuk skala bisnis lebih besar tidak cocok karena tdlib boros memory, cpu, walaupun nanti
kode anda sudah efficient akan terjadi lag / bottleneck
""".trim(),
  ),
  DocData.create(
    doc_id: "telegram_bot_api",
    title: "Telegram Bot Api",
    description: """
Telegram Bot Api adalah library + api official dari telegram yang menggunakan tdlib sebagai dasar, api
ini sangat mudah di gunakan jika anda punya public ip sangat di rekomendasikan menggunakan ini karena tidak boros memory, cpu
""".trim(),
  ),
  DocData.create(
    doc_id: "telegram_client",
    title: "Telegram Client",
    description: """
Telegram Client merupakan library resmi yang saya buat, metode ini saya gunakan di semua project saya,
metode ini sangat flexible dan customizable sehingga anda bisa mengintegrasikan (tdlib / mtproto / telegram bot api),
metode ini tidak hanya untuk membuat bot melainkan userbot, saya menggunakan style code telegram bot api hal ini 
di karenakan agar mudah di gunakan
""".trim(),
  ),
];
