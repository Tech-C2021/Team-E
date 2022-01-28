import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import Link from 'next/link'
import Navbar from '../comps/Navbar'
export default function Home() {
return (
    <div className="about">
      <h1> 2022Ruby - Test Scraper </h1>
      <form className="trackerForm">
        <input placeholder="Enter the hero you want to track" className="trackerInput"></input>
        <button className="trackerButton">Track</button>
      </form>
    </div>
      )
}
