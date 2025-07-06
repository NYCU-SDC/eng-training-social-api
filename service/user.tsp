import "@typespec/http";
import "./follow.tsp";

using Http;

@tag("User")
namespace EngTrainingSocial.User {
  model User {
    @doc("Unique identifier for the user")
    id: uuid;

    @doc("Title of the user")
    username: string;

    @doc("Timestamp of when the post was created")
    createdAt: string;

    @doc("Timestamp of when the post was last updated")
    updatedAt: string;

    @doc("The following status of the user to the user")
    followMe: Follow.Follow;
  }

  @route("/user/{id}")
  @get
  op getUser(@path id: uuid): {
    @statusCode statusCode: 200;
    @body user: User;
  } | {
    @statusCode statusCode: 404;
  };

  @route("/user/{id}/follow")
  @get
  op followUser(@path id: uuid): {
    @statusCode statusCode: 200;
    @body user: User;
  } | {
    @statusCode statusCode: 404;
  };

  @route("/user/{id}/unfollow")
  @get
  op unfollowUser(@path id: uuid): {
    @statusCode statusCode: 200;
    @body user: User;
  } | {
    @statusCode statusCode: 404;
  };
}
