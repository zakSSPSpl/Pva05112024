-- Pro SQLite
DROP TABLE IF EXISTS News;
DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS AppliedTags;

CREATE TABLE News (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    news_name TEXT NOT NULL
);

CREATE TABLE Tags (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    tag_name TEXT NOT NULL
);

CREATE TABLE AppliedTags (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    news_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    
    FOREIGN KEY (news_id) REFERENCES News (id),
    FOREIGN KEY (tag_id) REFERENCES Tags (id)
);

SELECT News.id, News.news_name, Tags.tag_name
FROM News
JOIN AppliedTags ON News.id = AppliedTags.news_id
JOIN Tags ON AppliedTags.tag_id = Tags.id
GROUP BY News.id;
