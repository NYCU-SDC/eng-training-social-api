import "@typespec/http";
import "@typespec/versioning";
import "./service/post.tsp";

using Http;
using Versioning;

@service(#{ title: "Eng Training Social API" })
@server("https://example.com", "Single server endpoint")
@versioned(Versions)
@route("/api")
namespace EngTrainingSocial;

enum Versions {
  v1: "1.0.0",
}

@format("uuid")
scalar uuid extends string;

@format("email")
scalar email extends string;
