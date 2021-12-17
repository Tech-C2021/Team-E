- データベースのテーブルを作りました。

## 設定？？

### 2021-12-16

- Heros table

``` 
create table heroes (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT  NOT NULL,
status TEXT NOT NULL,
infoDate DATETIME NOT NULL
); 
```

- Changes table 

``` 
create table changes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    heroId INTEGER NOT NULL,
    version TEXT NOT NULL,
    description VARCHAR(256) NOT NULL,
    FOREIGN KEY(heroId) REFERENCES heroes(id)
) 
```


**NOTE**

changesテーブルのところにある` FOREIGNKEY(heroId) REFERENCES heroes(id) `
のところ意味わからなかった場合に声をかけてください。

### 2021-12-17

Heroesテーブルに画像ようなコラム無かった事に気づいて追加しました.
今のHeroesテーブルは下記の感じ。
```
CREATE TABLE heroes (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
status TEXT NOT NULL,
infoDate DATETIME NOT NULL
, heorIcon TEXT);
```
