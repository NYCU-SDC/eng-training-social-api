namespace EngTrainingSocial.Reaction;

enum ReactionType {
  like: "like",
  dislike: "dislike",
}

model Reaction {
  @doc("The user reaction")
  reaction: ReactionType;
}
