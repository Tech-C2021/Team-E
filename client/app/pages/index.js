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

      { heroes.map(hero => (
        <div key = { hero.id }>
          <p>{ hero.name }</p>
        </div> 
      )) }
    </div>
      )
}
