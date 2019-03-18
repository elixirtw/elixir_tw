import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"

const Header = ({ siteTitle }) => (
  <header className="navbar is-primary" id="header">
    <div className="container"
      style={{ maxWidth: 960 }}
    >
      <div className="navbar-brand">
        <div className="navbar-item">
          {siteTitle}
        </div>
      </div>
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
