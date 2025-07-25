import "@typespec/http";

using Http;

@tag("Post")
namespace EngTrainingSocial.Post {
    model Post {
        @doc("Unique identifier for the post")
        id: uuid;

        @doc("Title of the post")
        title: string;

        @doc("Content of the post")
        content: string;

        @doc("The id of the author of the post")
        authorId: uuid;

        @doc("Timestamp of when the post was created")
        createdAt: string;

        @doc("Timestamp of when the post was last updated")
        updatedAt: string;
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
    op getPost(@path id: uuid): {
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
    op updatePost(@path id: uuid): {
        @statusCode statusCode: 200;
        @body post: Post;
    } | {
        @statusCode statusCode: 404;
    };

    @route("/post/{id}")
    @delete
    op deletePost(@path id: uuid): {
        @statusCode statusCode: 204;
    } | {
        @statusCode statusCode: 404;
    };
}
