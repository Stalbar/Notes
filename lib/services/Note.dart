class Note {
  
  String noteTitle;
  String noteContent;

  Note({required this.noteTitle, required this.noteContent});

  Map toJson() => {
    'noteTitle': noteTitle,
    'noteContent': noteContent,
  };

  factory Note.fromJson(dynamic json) {
    return Note(noteTitle: json['noteTitle'] as String, noteContent: json['noteContent'] as String);
  }

}