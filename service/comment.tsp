import "@typespec/http";
import "./reaction.tsp";

using Http;

@tag("Comment")
namespace EngTrainingSocial.Comment {
  model Comment {
    @doc("Unique identifier for the comment")
    id: uuid;

    @doc("Title of the comment")
    title: string;

    @doc("Content of the comment")
    content: string;

    @doc("Timestamp of when the comment was created")
    createdAt: string;

    @doc("Timestamp of when the comment was last updated")
    updatedAt: string;

    @doc("The reaction of the login user to the comment")
    reactionMe: Reaction.Reaction;
  }

  model CommentRequest {
    @doc("Title of the comment")
    title: string;

    @doc("Content of the comment")
    content: string;
  }

  @route("/post/{id}/comments")
  @get
  op getComments(@path id: uuid): {
    @statusCode statusCode: 200;
    @body comments: Comment[];
  } | {
    @statusCode statusCode: 400;
  };

  @route("/comment/{id}")
  @get
  op getComment(@path id: uuid): {
    @statusCode statusCode: 200;
    @body comment: Comment;
  } | {
    @statusCode statusCode: 404;
  };

  @route("/post/{id}/comments")
  @post
  op createComments(@path id: uuid): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400;
  };

  @route("/comment/{id}")
  @put
  op updateComment(@path id: uuid): {
    @statusCode statusCode: 200;
    @body comment: Comment;
  } | {
    @statusCode statusCode: 404;
  };

  @route("/comment/{id}")
  @delete
  op deleteComment(@path id: uuid): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 404;
  };
}
