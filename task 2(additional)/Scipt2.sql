create table if not exists boss (
	boss_id serial primary key,
	name varchar(60) not null
);


create table if not exists department (
	department_id serial primary key,
	name varchar(60) not null,
	quantity integer check (quantity > 0),
	boss_id integer references boss(boss_id)
);

create table if not exists employee (
	employee_id serial primary key,
	name varchar(60) not null,
	department_id integer references department(department_id),
	boss_id integer references boss(boss_id)
);