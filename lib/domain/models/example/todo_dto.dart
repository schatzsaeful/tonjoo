class ExampleTodoDto {
  int userId;
  int id;
  String title;
  bool completed;

  ExampleTodoDto({
    this.userId = 0,
    this.id = 0,
    this.title = "",
    this.completed = false,
  });
}
