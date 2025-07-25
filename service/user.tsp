import "@typespec/http";

using Http;

@tag("User")
namespace EngTrainingSocial.User {
    model User {
        @doc("Unique identifier for the user")
        id: uuid;

        @doc("Title of the user")
        username: string;

        @doc("Email of the user")
        email: string;

        @doc("Timestamp of when the post was created")
        createdAt: string;

        @doc("Timestamp of when the post was last updated")
        updatedAt: string;
    }

    @route("/user/{id}")
    @get
    op getUser(@path id: uuid): {
        @statusCode statusCode: 200;
        @body user: User;
    } | {
        @statusCode statusCode: 404;
    };
}
