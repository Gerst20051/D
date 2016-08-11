import vibe.d;

shared static this()
{
    auto settings = new HTTPServerSettings;
    settings.port = 8080;
    settings.bindAddresses = ["::1", "127.0.0.1"];
    auto router = new URLRouter()
        .get("/", &hello)
        .get("/bye", staticTemplate!"bye.dt")
        .any("*", &handleRequest);
    listenHTTP(settings, router);
}

void handleRequest(HTTPServerRequest req, HTTPServerResponse res)
{
    if (req.path == "/index")
        res.render!"index.dt";
    else
        res.writeBody("Hello, World!", "text/plain");
}

void hello(HTTPServerRequest req, HTTPServerResponse res)
{
    res.render!"index.dt";
}
