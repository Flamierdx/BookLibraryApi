--liquibase formatted sql

--changeset flamierd:1
CREATE TABLE roles
(
    authority VARCHAR(255) NOT NULL,
    CONSTRAINT pk_roles PRIMARY KEY (authority)
);
--rollback drop table roles;

--changeset flamierd:2
CREATE TABLE users
(
    id         BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    email      VARCHAR(255)                            NOT NULL,
    password   VARCHAR(255)                            NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_users PRIMARY KEY (id)
);
--rollback drop table users;

--changeset flamierd:3
CREATE TABLE users_roles
(
    role    VARCHAR(255) NOT NULL,
    user_id BIGINT       NOT NULL,
    CONSTRAINT pk_users_roles PRIMARY KEY (role, user_id)
);
--rollback drop table users_roles;

--changeset flamierd:4
ALTER TABLE users
    ADD CONSTRAINT uc_users_email UNIQUE (email);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_user FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_user_role FOREIGN KEY (role) REFERENCES roles (authority);
--rollback alter table users drop constraint uc_users_email;
--rollback alter table users_roles drop constraint fk_userol_on_user;
--rollback alter table users_roles drop constraint fk_userol_on_user_role;