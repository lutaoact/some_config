create table user(
    id INT,
    name VARCHAR(255),
    primary key (id)
);

create table item(
    id INT,
    name VARCHAR(255),
    primary key (id)
);

create table card(
    id INT,
    name VARCHAR(255),
    primary key (id)
);

create table user_item(
    user_id INT,
    item_id INT,
    num INT
);

create table user_card(
    user_id INT,
    card_id INT,
    num INT
);

create table trade(
    id INT,
    user_id INT,
    card_id INT,
    card_name VARCHAR(255),
    object_type INT,
    object_id INT,
    object_num INT,
    primary key (id)
);

create table user_gift(
    id INT,
    user_id INT,
    object_type INT,
    object_id INT,
    object_num INT,
    primary key (id)
);

create table growl(
    id INT,
    message VARCHAR(255),
    primary key (id)
);
