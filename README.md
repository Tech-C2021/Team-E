あるwebsiteで使っているhero何人入力してもらってnerfed、buffedかrebalancedしてる情報取ってきて報告する。

ryota - scraping

isijima - html 


sabir - help, のこてるもの


# ワークフロー 
- 最初にmainのブランチからgit pullする
- 自分のブランチに切り替える  
`git checkout branch名`
- mainのブランチにpullしたものを自分のブランチにrebaseする
`git rebase main`





## レポート

`発表する事がありますと思いますから発表する時に使えるようにcommitを作る時自分で何をやったかレポートを書いて欲し。レポートのファイル名は＜自分の名前＿レポート＞.mdでお願いします`

https://dota2.fandom.com/wiki/Game_Versions



### Docker使い方
- 最初は ` source aliases.sh ` をscrapingProjectのrootフォルダに移動して起動する。
- ` s-build ` commandはdockerのcontainerをbuildします。
- ` scraper ` dockerのcontainerを立ち上がる。
- ` scrape ` scrapingプロジェクトを起動する。
