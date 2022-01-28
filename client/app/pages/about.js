import Navbar from "../comps/Navbar"
const About = () => {
return (
  <div className="about">
  <h1 className="aboutHeader"> About </h1>
    <div className="faq">
      <div className="blocks">
    <p　className="question">なにをつくりましたか？</p>
    <p className="answer">
        いつも遊んでいるこのゲームがあります。
        いつも更新が頻繁で、追いかけるのが大変です。
        このゲームでは、あるヒーローが他のヒーローよりも有利になるようなアップデートが行われます。
        このゲームは学習曲線が難しいことで悪名高く、またヒーロープールの数も多いので（現在121ヒーローという驚異的な数）
        、どのヒーローをプレイするか決めるのが本当に難しくなっているんだ。ゲームを見つけても、どのヒーローが現在良いのか分からないので、
        ヒーローを選ぶだけでも緊張してしまうほど、事態を悪化させるタイマーがあります。現在のパッチで良いヒーローをチェックする方法もありますが、
        このゲームはランキングシステムで回っていて、ランキングシステムによって勝率やピック率も異なるので、とても面倒です。
        そこで、dota buffの公式ウェブサイトをスクレイピングして、あなたがいるTierに応じた現在の良いヒーローをスクレイピングするスクレイパーを開発しようとしました。自分のプレイしているヒーローが "Meta "に入っているかどうかを調べるためにウェブサイトを訪れるのではなく、追跡するだけでいいのです。
    </p>
    </div>
    <div className="blocks">
    <p className="question">何を使いましたか?</p>
    <p className="answer">
        このプロジェクトのREST APIはRubyで、フロントエンドはNext.jsで記述されています。
        Sinatra」という素晴らしいGemと、「HTTParty」（ターゲットURLにアクセスするため）、
        HTTParty」が返すHTMLコンテンツをスクレイピングする「NOKOGIRI」などのツールを使っています。
    </p>
    </div>
    <div className="blocks">
    <p className="question">誰がなにをやったか?</p>
    <p className="answer">
    <table className="teamsWorkTable">
    <tr>
      <th className="names">バラヒサビル</th>
      <th className="names">髙橋 亮太</th>
      <th className="names">石島 優</th>
      <th className="names">ﾌｧﾑ ﾌｨﾝ ﾛﾝ</th>
    </tr>
    <tr>
      <th calssName="responsibility">ココードの記述やリファクタリングを担当し、その他の問題にも対応しました。
          ードをリファクタリングし、読みやすくしました。そして、チームメイトを助けた。</th>
      <th calssName="responsibility">スクレイパーのベースコードを担当しました。</th>
      <th calssName="responsibility">APIをテストするための基本的なフロントエンドの開発を担当する。</th>
      <th calssName="responsibility">RubyでHTTPリクエストがどのように使われているかを検索・理解する役割を担った。</th>
    </tr> 
    </table>
    </p>
    </div>
    </div>
  </div>
      )

      }
export default About


