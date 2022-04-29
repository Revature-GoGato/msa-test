drop table if exists project3."users" cascade;
drop table if exists project3."posts" cascade;
drop table if exists project3."likes" cascade;
drop table if exists project3."family_map" cascade;

create table project3."users" (
	"id" serial primary key,
	"username" text not null,
	"password" text not null,
	"follower_count" integer default 0,
	"points" integer default 0,
	"first_name" text not null,
	"last_name" text not null,
	"email" text not null,
	"about_me" text
);

create table project3."posts" (
	"id" serial primary key,
	"contents" text not null,
	"likes" integer default 0,
	"post_time" timestamp with time zone default current_timestamp,
	"userid" integer not null references project3."users"(id),
	"parentid" integer default 0
);

create table project3."likes" (
	"id" serial primary key,
	"userid" integer not null references project3."users"(id),
	"postid" integer not null references project3."posts"(id),
	"like_state" integer not null default 0
);

create table project3."family_map" (
	"id" serial primary key,
	"parentid" integer default 0,
	"postid" integer not null references project3."posts"(id),
	"childid" integer default 0
);

CREATE OR REPLACE FUNCTION update_modified_column() 
RETURNS TRIGGER 
language 'plpgsql'
AS $$
BEGIN
    NEW.post_time := now();
    RETURN NEW; 
END;
$$;

CREATE TRIGGER update_customer_modtime BEFORE UPDATE ON project3."posts" FOR EACH ROW EXECUTE PROCEDURE  update_modified_column();




insert into project3."users" ("username", "password", "first_name", "last_name", "email") values ('asdf', 'asdf', 'asdf', 'asdf', 'asdf@asdf.com');

insert into project3."posts" ("contents", "userid") values ('second', 1);



