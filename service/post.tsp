import "@typespec/http";
import "./reaction.tsp";
import "./follow.tsp";

using Http;

@tag("Post")
namespace EngTrainingSocial.Post {
  model Post {
    @doc("Unique identifier for the post")
    id: string;

    @doc("Title of the post")
    title: string;

    @doc("Content of the post")
    content: string;

    @doc("Timestamp of when the post was created")
    createdAt: string;

    @doc("Timestamp of when the post was last updated")
    updatedAt: string;

    @doc("The reaction of the login user to the post")
    reactionMe: Reaction.Reaction;
  }

  model PostRequest {
    @doc("Title of the post")
    title: string;

    @doc("Content of the post")
    content: string;
  }

  @route("/posts")
  @get
  op getPosts(): {
    @statusCode statusCode: 200;
    @body posts: Post[];
  } | {
    @statusCode statusCode: 400;
  };

  @route("/post/{id}")
  @get
  op getPost(@path id: string): {
    @statusCode statusCode: 200;
    @body post: Post;
  } | {
    @statusCode statusCode: 404;
  };

  @route("/posts")
  @post
  op createPosts(): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400;
  };

  @route("/post/{id}")
  @put
  op updatePost(@path id: string): {
    @statusCode statusCode: 200;
    @body post: Post;
  } | {
    @statusCode statusCode: 404;
  };

  @route("/post/{id}")
  @delete
  op deletePost(@path id: string): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 404;
  };
}
