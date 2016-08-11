import vibe.d;

shared static this()
{
    auto settings = new HTTPServerSettings;
    settings.port = 8080;
    settings.bindAddresses = ["::1", "127.0.0.1"];
    listenHTTP(settings, &handleRequest);
}

void handleRequest(HTTPServerRequest req, HTTPServerResponse res)
{
    if (req.path == "/")
        res.render!"index.dt";
    else
        res.writeBody("Hello, World!", "text/plain");
}
