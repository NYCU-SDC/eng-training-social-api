namespace EngTrainingSocial.Reaction;

enum ReactionType {
  like: "LIKE",
  dislike: "DISLIKE",
}

model Reaction {
  @doc("The user reaction")
  reaction: ReactionType;
}
