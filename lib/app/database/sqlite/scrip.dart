//@dart=2.9

// ignore_for_file: prefer_const_declarations

final createTable = '''
CREATE TABLE contact (
  id INTEGER NOT NULL PRIMARY KEY
  ,nome VARCHAR(200) NOT NULL
  ,telefone CHAR(16) NOT NULL
  ,email VARCHAR(150) NOT NULL
  ,url_avatar VARCHAR(300) NOT NULL
)
''';
