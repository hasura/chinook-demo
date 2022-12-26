# Chinook Demo (PostgreSQL)
The Chinook demo is comprised of the following services:
- hge-orders: providing a GrapQL API for the `Invoice` & `InvoiceLines` tables, in the chinook_corp database
- hge-crm: providing a GrapQL API for the `Customer` table, in the chinook_corp database
- hge-hr: providing both GrapQL & REST APIs for the `Employee` table, in the chinook_corp database
- hge-main: providing a federated GrapQL API for:
    - the `Album`, `Artist`, `Genre`, `MediaType` & `Track` tables, in the chinook_music database
    - the `Playlist`, `PlaylistTrack` tables, in the chinook_playlist database
    - the `hge-orders` GraphQL sub-graph (via Remote Schemas)
    - the `hge-crm` GraphQL sub-graph (via Remote Schemas)
    - the `hge-hr` REST API (via Actions)
    - DB-to-DB, DB-to-Remote Schemas, Remote Schemas-to-DB & Remote Schemas-to-Remote Schema joins (via relationships)

This Chinook demo uses data stored in PostgreSQL.

## Dependencies
### Container Runtime 
An OCI-complian container runtime is required to run the Hasura GraphQL engines.
A docker compose file is supplied to run the demo locally.
### PostgreSQL
One database is required per distinct metadata instance. The `hdb_catalog` schema is created within each database.
The `HASURA_GRAPHQL_METADATA_DATABASE_URL` environment variable points to the database instance to be used to store the Hasura GraphQL Engine (HGE) metadata.