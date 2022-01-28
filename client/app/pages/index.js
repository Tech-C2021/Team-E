import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import Link from 'next/link'
import Navbar from '../comps/Navbar'
export default function Home() {
return (
    <div className="header">
      <h1> 2022Ruby - Test Scraper </h1>
        <ul>
          <li><Link href='/about'>
                <a>About</a>
               </Link>
                 </li>
                  <li>
                    <a>Your Heroes</a>
                      </li>
                        
        </ul>
    </div>
      )
}
