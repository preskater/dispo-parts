create table if not exists brands (
    id bigint primary key generated always as identity,
    name varchar(32) not null,
    created_at timestamptz default now()
);
