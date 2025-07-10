# Q2
CREATE DATABASE IF NOT EXISTS blog;

SHOW DATABASES;

USE blog;

CREATE TABLE IF NOT EXISTS users (
    firstName varchar(50),
    middleName varchar(50),
    lastName varchar(50),
    mobile varchar(15) UNIQUE,
    email varchar(75) UNIQUE NOT NULL,
    passwordHash varchar(128) NOT NULL,
    registeredAt datetime NOT NULL DEFAULT NOW(),
    lastLogin datetime,
    intro tinytext,
    profile text,
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS posts (
    authorId int UNIQUE NOT NULL,
    title varchar(75) NOT NULL,
    metaTitle varchar(100),
    slug varchar(100) UNIQUE NOT NULL,
    summary tinytext NOT NULL,
    published tinyint(1) NOT NULL,
    createdAt datetime NOT NULL,
    updatedAt datetime,
    publishedAt datetime,
    content text,
    id int UNIQUE NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    CONSTRAINT fk_1
        FOREIGN KEY (authorId) references users (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS post_meta (
    postId int UNIQUE NOT NULL,
    `key` varchar(50) UNIQUE NOT NULL,
    content text,
    id int UNIQUE NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    CONSTRAINT fk_2
        FOREIGN KEY (postId) references posts (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS post_comments (
    postId int UNIQUE NOT NULL,
    title varchar(100) NOT NULL,
    published tinyint(1) NOT NULL,
    createdAt datetime NOT NULL,
    publishedAt datetime,
    content text,
    id int UNIQUE NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    CONSTRAINT fk_3
        FOREIGN KEY (postId) REFERENCES posts (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tags (
    title varchar(75) NOT NULL,
    metaTitle varchar(100),
    slug varchar(100) NOT NULL,
    content text,
    id int UNIQUE NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS post_tags (
    postId int UNIQUE NOT NULL,
    tagId int UNIQUE NOT NULL,
    PRIMARY KEY (postId, tagId),
    CONSTRAINT fk_4
        FOREIGN KEY (postId) references posts (id) ON UPDATE CASCADE,
    CONSTRAINT fk_5
        FOREIGN KEY (tagId) references tags (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
    title varchar(75) NOT NULL,
    metaTitle varchar(100),
    slug varchar(100) NOT NULL,
    content text,
    id int UNIQUE NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS post_categories (
    postId int UNIQUE NOT NULL,
    categoryId int UNIQUE NOT NULL,
    PRIMARY KEY (postId, categoryId),
    CONSTRAINT fk_6
        FOREIGN KEY (postId) references posts (id) ON UPDATE CASCADE,
    CONSTRAINT fk_7
        FOREIGN KEY (categoryId) references categories (id) ON UPDATE CASCADE ON DELETE CASCADE
);

# Q3
# a, insert 4 users
INSERT INTO users (firstName, middleName, lastName, mobile, email, passwordHash, intro, profile)
VALUES ('Charles', 'Raymond', 'Schatmeyer', '7167131492', 'schatmeyer.c@northeastern.edu',
        'sdfjkhasdlf', 'Hello!', 'This is my profile!');

INSERT INTO users (firstName, middleName, lastName, mobile, email, passwordHash, intro, profile)
VALUES ('John', 'J', 'Smith', '1231234123', 'jjsmith@northeastern.edu',
        'fhfhfh', 'Howdy!', 'This profile!');

INSERT INTO users (firstName, middleName, lastName, mobile, email, passwordHash, intro, profile)
VALUES ('Alice', 'B', 'Claire', '9999999991', 'abc@northeastern.edu',
        'urernceu', 'Hello There!', 'My name is Alice!');

INSERT INTO users (firstName, middleName, lastName, mobile, email, passwordHash, intro, profile)
VALUES ('Jane', 'O', 'Austen', '4444444545', 'JaneO@northeastern.edu',
        'pspspspspspspsp', 'Welcome!', 'Profile!');

# b, insert 2 tags
INSERT INTO tags (title, metaTitle, slug, content)
VALUES ('Comedy', 'metaComedy', 'sluug', 'Haha! That is funny!');

INSERT INTO tags (title, metaTitle, slug, content)
VALUES ('Drama', 'metaDrama', 'sluuuug', 'Wow! That is dramatic!');

# c, insert 2 categories
INSERT INTO categories (title, metaTitle, slug, content)
VALUES ('Pics', 'metaPics', 'sluuuuuug', 'The best pictures!');

INSERT INTO categories (title, metaTitle, slug, content)
VALUES ('Vids', 'metaVids', 'sluuuuuuuug', 'The best videos!');

# d, insert 6 posts
INSERT INTO posts (authorId, title, metaTitle, slug, summary, published, createdAt, content)
VALUES (1, 'Post 1', 'metaP1', 'slug', 'Post about Post 1', 1, NOW(), 'Just setting up my blog');

INSERT INTO post_tags (postId, tagId)
VALUES (1, 1), (1, 2);

INSERT INTO post_categories (postId, categoryId)
VALUES (1, 1);

INSERT INTO posts (authorId, title, metaTitle, slug, summary, published, createdAt, content)
VALUES (3, 'Post 2', 'metaP2', 'slug', 'Post about Post 2', 1, NOW(), 'Setting up my blog but for the second time');

INSERT INTO post_tags (postId, tagId)
VALUES (2, 1), (2, 2);

INSERT INTO post_categories (postId, categoryId)
VALUES (2, 1);

INSERT INTO posts (authorId, title, metaTitle, slug, summary, published, createdAt, content)
VALUES (2, 'Post 3', 'metaP3', 'slug', 'Joke', 1, NOW(), 'Chicken cross rode LOL');

INSERT INTO post_tags (postId, tagId)
VALUES (3, 1), (3, 2);

INSERT INTO post_categories (postId, categoryId)
VALUES (3, 1);

INSERT INTO posts (authorId, title, metaTitle, slug, summary, published, createdAt, content)
VALUES (3, 'Post 4', 'metaP4', 'slug', 'Fit Check', 1, NOW(), 'Imagine reading this');

INSERT INTO post_tags (postId, tagId)
VALUES (4, 1), (4, 2);

INSERT INTO post_categories (postId, categoryId)
VALUES (4, 1);

INSERT INTO posts (authorId, title, metaTitle, slug, summary, published, createdAt, content)
VALUES (1, 'Post 5', 'metaP5', 'slug', 'Poem', 1, NOW(), 'two roads i take less');

INSERT INTO post_tags (postId, tagId)
VALUES (5, 1), (5, 2);

INSERT INTO post_categories (postId, categoryId)
VALUES (5, 1);

INSERT INTO posts (authorId, title, metaTitle, slug, summary, published, createdAt, content)
VALUES (3, 'Post 6', 'metaP6', 'slug', 'Big News', 1, NOW(), 'I saw a deer outside earlier');

INSERT INTO post_tags (postId, tagId)
VALUES (6, 1), (6, 2);

INSERT INTO post_categories (postId, categoryId)
VALUES (6, 1);

# e, insert 2 comments on 3 blog posts
INSERT INTO post_comments (postId, title, published, createdAt, content)
VALUES (1, 'Comment 1', 1, NOW(), 'This is comment 1');

INSERT INTO post_comments (postId, title, published, createdAt, content)
VALUES (1, 'Nice Work', 1, NOW(), 'I liked this');

INSERT INTO post_comments (postId, title, published, createdAt, content)
VALUES (2, 'Bad Work', 1, NOW(), 'I did not like this');

INSERT INTO post_comments (postId, title, published, createdAt, content)
VALUES (2, 'Hello', 1, NOW(), 'We should talk');

INSERT INTO post_comments (postId, title, published, createdAt, content)
VALUES (3, 'What is up', 1, NOW(), 'How are you doing');

INSERT INTO post_comments (postId, title, published, createdAt, content)
VALUES (3, 'Oh my gosh', 1, NOW(), 'What a post!');

# 4, add admin field to users table
ALTER TABLE users
ADD admin tinyint(1) NOT NULL DEFAULT 0;
