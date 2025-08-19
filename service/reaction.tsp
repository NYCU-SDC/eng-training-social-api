namespace EngTrainingSocial.Reaction;

enum ReactionType {
  like: "LIKE",
  dislike: "DISLIKE",
  none: "NONE",
}

model Reaction {
  @doc("The user reaction")
  reaction: ReactionType;
}
