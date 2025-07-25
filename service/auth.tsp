import "@typespec/http";

using Http;

@tag("Auth")
namespace EngTrainingSocial.Auth {
    enum OAuthProvider {
        google: "google",
    }

    @route("/login/oauth/{provider}")
    @get
    op loginWithOAuth(
        @doc("The OAuth provider to use for login.")
        @path
        provider: OAuthProvider,

        @doc("The callback URL of the Oauth login. [See details](https://clustron.atlassian.net/wiki/spaces/cd/pages/18219016/Backend+OAuth+JWT+Manual)")
        @query
        c: string,

        @doc("The redirect URL to return to after login.")
        @query
        r?: string,
    ): {
        @statusCode statusCode: 302;
    } | {
        @statusCode statusCode: 404;
    };

    @route("/logout")
    @get
    op logout(
        @doc("The redirect URL to return to after logout.")
        @query
        r?: string,
    ): {
        @statusCode statusCode: 302;
    } | {
        @statusCode statusCode: 404;
    };
}
