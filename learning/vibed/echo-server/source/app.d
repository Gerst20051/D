import vibe.d;

shared static this()
{
    listenTCP(7000, (conn) { conn.write(conn); });
}
