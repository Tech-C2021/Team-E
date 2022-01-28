import Link from 'next/link' 

const Navbar = () => {
  return (
    <nav>
      <div className="links">
      <Link href='/'>
        <a className="anchor">Top</a>
      </Link>

      <Link href='/about'>
        <a className="anchor">About</a>
      </Link>
      </div>
    </nav>
  )
}

export default Navbar
