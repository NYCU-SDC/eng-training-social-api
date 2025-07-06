import "@typespec/http";
import "@typespec/versioning";

using Http;
using Versioning;

@service(#{ title: "Eng Training Social API", version: "1.0.0" })
@server("https://example.com", "Single server endpoint")
@versioned(Versions)
@route("/api")
namespace EngTrainingSocialAPI;

enum Versions {
  v1: "1.0.0",
}

@format("uuid")
scalar uuid extends string;

@format("email")
scalar email extends string;