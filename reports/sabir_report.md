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

### 2021-12-18

 - user interfaceを作りました。user interfaceにまだlogicが足りないけど少しずつ追加して行きます。
  今はinsertとshowのlogicしかないです。あるlogicにもまだ確認するっ事がいっぱいある例えば同じhero名入ってるかどかとか
  入力したhero名は本当のheroかどうかとか。
- Databaseと関するlogicは全部./Repositories/<ファイル名＋Repository>.rbにしました。
これはどいう事だと言えば` SELECT * FROM heroes `見たいなstatementは全部./Repositoryに住むます
- Databaseから返るDataは全部ここでUserに出せる形にして関数で返す。
- MainはUserのinterfaceみたいな物ですControllerから返るDataは全部ここで表示します。