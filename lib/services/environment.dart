String apiUrl = "https://panel.kimiiservicios.com/api";
String paymentUrl = "https://panel.kimiiservicios.com/api";
Map<String, String>? headersToken(token) => {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };

Map<String, String>? get headers =>
    {'Accept': 'application/json', 'Content-Type': 'application/json'};
