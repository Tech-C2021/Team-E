export const getStaticProps = async () => {
  const res = await fetch("http://scraping:4567")
  const data = await res.json()


  return {
    props: { heroes: data }
  }
}
export default function Home({ heroes }) {
return (
    <div className="about">
      <h1> 2022Ruby - Test Scraper </h1>
      <form className="trackerForm">
        <input placeholder="Enter the hero you want to track" className="trackerInput"></input>
        <button className="trackerButton">Track</button>
      </form>
      <div className="grid">      { heroes.map(hero => (
        <div key = { hero.id } className="trackedHeroes">
          <img src={ hero.icon } className="icon"></img>
          <p className="name">{ hero.name }</p>
          <p>Tier 1 Pick Rate: { hero.lowTierPickRate }%</p>
          <p>Tier 1 Win Rate: { hero.lowTierWinRate }%</p>
          <p>Tier 2 Pick Rate: { hero.beginnerTierPickRate }%</p>
          <p>Tier 2 Win Rate: { hero.beginnerTierPickRate }%</p>
          <p>Tier 3 Pick Rate: { hero.intermediateTierPickRate }%</p>
          <p>Tier 3 Win Rate: { hero.intermediateTierPickRate }%</p>
          <p>Tier 4 Pick Rate: { hero.topTierPickRate }%</p>
          <p>Tier 4 Win Rate: { hero.topTierPickRate }%</p>


        </div> 
      )) }
    </div>

    </div>
      )
}
