//import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"
import { Link } from 'gatsby'

const Header = ({ siteTitle }) => (
  <header className="navbar is-primary" id="header">
    <div className="container"
      style={{ maxWidth: 960 }}
    >
      <Link to="/" className="navbar-brand">
        <div className="navbar-item">
          {siteTitle}
        </div>
      </Link>
    </div>
  </header>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
