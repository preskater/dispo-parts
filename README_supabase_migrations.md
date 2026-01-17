# Supabase migrations and seeding

## Workflow
- Install CLI: `npm i -g supabase`
- Link project once: `supabase link` (creates supabase/.temp/project-ref)
- Create migration: `supabase migration new <name>`
- Edit the generated SQL under supabase/migrations/<timestamp>_<name>.sql
- Run locally: `supabase db reset` (drops/recreates, applies migrations, runs seed)
- Push remote: `supabase db push --include-seed`

## Ordering and dependencies
- Ensure referenced tables exist earlier by timestamp naming (lexicographic order).
- If you hit lock timeouts on cloud, add `SET lock_timeout = '8s';` at top of a migration.
- Use `create table if not exists` for idempotent backfills when reconciling drift.

## Current seed
- Seeds lookup tables for part_conditions and system_categories.
- File: supabase/seed.sql

## Useful commands
- Show remote migrations: `supabase migration list`
- Diff dashboard changes to SQL: `supabase db diff -f <name>`
- Apply locally without reset: `supabase migration up`
- Reset local (apply migrations + seed): `supabase db reset`

## Notes for this project
- IDs are UUID with `gen_random_uuid()`; pgcrypto is available on the project.
- auth.users (Supabase) is the user source; seller_id references auth.users.id.
- Tables in order: car_brands → car_models → system_categories → system_subcategories → part_conditions → part_definitions → part_listings → listing_images → listing_compatibility.