#! /bin/sh

DATABASE_URL="postgresql://postgres:docker@localhost:54320/pi"
echo DATABASE_URL
pgsync --schema-first --defer-constraints --disable-integrity --from $PRODUCTION_DATABASE_URL --to $STAGING_DATABASE_URL --to-safe
pgsync --defer-constraints --disable-integrity --from $PRODUCTION_DATABASE_URL --to $STAGING_DATABASE_URL --to-safe