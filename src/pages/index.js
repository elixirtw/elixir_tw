import React from "react"
//import { Link } from "gatsby"

import Layout from "../components/layout"
import SEO from "../components/seo"

const IndexPage = () => (
  <Layout>
    <SEO title="Home" keywords={[`elixir`, `taiwan`, `erlang`, `homepage`]} />
    <div className="content">
      <h1>Elixir |> Taiwan</h1>

      <h2>官網</h2>
      // Elixir
      // Hex.pm
      // Phoenix
      // Nerves

      <h2>中文學習資源</h2>
      // Slack
      // Elixir School 繁體
      // Facebook group

      <h2>英文學習資源</h2>
      <ul>
        <li><a href="https://elixir-lang.org/getting-started/introduction.html" target="_blank" rel="noopener noreferrer"> Elixir 官方教學</a></li>
        <li><a href="https://hexdocs.pm/elixir/Kernel.html" target="_blank" rel="noopener noreferrer"> Elixir 官方文件</a></li>
        <li><a href="https://hexdocs.pm/phoenix/overview.html" target="_blank" rel="noopener noreferrer"> Phoenix 官方教學</a></li>
        <li><a href="https://hexdocs.pm/phoenix/Phoenix.html" target="_blank" rel="noopener noreferrer"> Phoenix 官方文件</a></li>
        // Elixir Slack
        // Forum
        // Awesome Elixir
      </ul>

      <h2>書籍</h2>
      // Programing Elixir
      // Elixir in Action
      // Programing Phoenix
      // Designing for Scalability with Erlang/OTP
      // Metaprogramming Elixir https://pragprog.com/book/cmelixir/metaprogramming-elixir
      // The Little Elixir and Otp Handbook https://www.manning.com/books/the-little-elixir-and-otp-guidebook

      <h2>Podcast</h2>
      // Elixir Mix
      // Elixir Outlaws

      <h2>研討會</h2>
      // Elixir Conf
      // Elixir Conf EU
      // Lonestar Elixir Conf

      <h2>社群友站</h2>
      // 五倍紅寶石
      // Ruby Taiwan
    </div>
  </Layout>
)

export default IndexPage
