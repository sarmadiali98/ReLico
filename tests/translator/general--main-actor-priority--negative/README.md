# General main-actor-priority rejection test

This translator test pins the historical single-main-actor payload frontend boundary. The annotated
main actor must be rejected, while otherwise identical input without the annotation and input
carrying local message-server priority must be accepted.

The runner fetches the source archive for the public Rebeca compiler 2.25 tag at commit
`94ca579e0f2e3528d8de608a9e86316ecb78d608`, verifies its SHA-256 digest, and caches it under
`~/.cache/relico/parser/2.25/`. Set `RELICO_PARSER_ARTIFACT` to a digest-identical local archive for
offline execution. Java 17 or later, Apache Maven, and initial network access or a populated cache
are required. The runner asserts the expected diagnostic and verifies that rejection produces no
JSON, decoded AST, translated LF, or runtime artifact.
