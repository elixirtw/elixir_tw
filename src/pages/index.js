import React from "react"
//import { Link } from "gatsby"

import Layout from "../components/layout"
import SEO from "../components/seo"

const externalLink = (text, link) => (<a href={link} target="_blank" rel="noopener noreferrer">{text}</a>);

const IndexPage = () => (
  <Layout>
    <SEO title="Home" keywords={[`elixir`, `taiwan`, `erlang`, `homepage`]} />
    <div className="content">
      <h1>Elixir |> Taiwan</h1>

      <div class="tile is-ancestor is-vertical">
        <div class="tile is-parent">
          <div class="tile is-child box">
            <h2>官網</h2>
            <ul>
              <li>{externalLink("Elixir 官網", "https://elixir-lang.org/")}</li>
              <li>{externalLink("Hex 套件管理", "https://hex.pm/")}</li>
              <li>{externalLink("Phoenix 官網", "https://phoenixframework.org/")}</li>
              <li>{externalLink("Nerves 官網", "https://nerves-project.org/")}</li>
            </ul>
          </div>

          <div class="tile is-child box">
            <h2>中文學習資源</h2>
            <ul>
              <li>{externalLink("Elixir 台灣 Slack", "http://elixirtw.herokuapp.com/")}</li>
              <li>{externalLink("Elixir 台灣 Meetup", "https://www.meetup.com/elixirtw-taipei/")}</li>
              <li>{externalLink("Elixir School 繁體中文", "https://elixirschool.com/zh-hant/")}</li>
              <li>{externalLink("Elixir 台灣臉書群組", "https://www.facebook.com/groups/elixir.tw")}</li>
            </ul>
          </div>

          <div class="tile is-child box">
            <h2>英文學習資源</h2>
            <ul>
              <li>{externalLink("Elixir 官方教學", "https://elixir-lang.org/getting-started/introduction.html")}</li>
              <li>{externalLink("Elixir 官方文件", "https://hexdocs.pm/elixir/Kernel.html")}</li>
              <li>{externalLink("Phoenix 官方教學", "https://hexdocs.pm/phoenix/overview.html")}</li>
              <li>{externalLink("Phoenix 官方文件", "https://hexdocs.pm/phoenix/Phoenix.html")}</li>
              <li>{externalLink("官方 Slack", "https://elixir-slackin.herokuapp.com/")}</li>
              <li>{externalLink("官方討論版", "https://elixirforum.com/")}</li>
              <li>{externalLink("推薦 Elixir 套件", "https://github.com/h4cc/awesome-elixir")}</li>
            </ul>
          </div>
        </div>

        <div class="tile is-parent">
          <div class="tile is-child box">
            <h2>書籍</h2>
            <ul>
              <li>{externalLink("Programing Elixir 1.6", "https://pragprog.com/book/elixir16/programming-elixir-1-6")}</li>
              <li>{externalLink("Elixir in Action, Second Ed.", "https://www.manning.com/books/elixir-in-action-second-edition")}</li>
              <li>{externalLink("Programing Phoenix 1.4", "https://pragprog.com/book/phoenix14/programming-phoenix-1-4")}</li>
              <li>{externalLink("Designing for Scalability with Erlang/OTP", "http://shop.oreilly.com/product/0636920024149.do")}</li>
              <li>{externalLink("Metaprogramming Elixir", "https://pragprog.com/book/cmelixir/metaprogramming-elixir")}</li>
              <li>{externalLink("The Little Elixir and Otp Handbook", "https://www.manning.com/books/the-little-elixir-and-otp-guidebook")}</li>
              <li>{externalLink("Craft GraphQL APIs in Elixir with Absinthe", "https://pragprog.com/book/wwgraphql/craft-graphql-apis-in-elixir-with-absinthe")}</li>
            </ul>
          </div>

          <div class="tile is-child box">
            <h2>Podcast</h2>
            <ul>
              <li>{externalLink("Elixir Mix", "https://devchat.tv/elixir-mix/")}</li>
              <li>{externalLink("Elixir Outlaws", "https://elixiroutlaws.com/")}</li>
            </ul>
          </div>

          <div class="tile is-child box">
            <h2>研討會</h2>
            <ul>
              <li>{externalLink("ElixirConf US", "https://elixirconf.com")}</li>
              <li>{externalLink("ElixirConf EU", "http://www.elixirconf.eu/")}</li>
              <li>{externalLink("Lone Star Elixir", "https://www.lonestarelixir.com/")}</li>
              <li>{externalLink("全部的 Elixir 研討會的 Talk", "https://everyelixirvideo.page/")}</li>
            </ul>
          </div>
        </div>

        <div class="tile is-parent">
          <div class="tile is-child box">
            <h2>社群友站</h2>
            <ul>
              <li>{externalLink("五倍紅寶石", "https://5xruby.tw/")}</li>
              <li>{externalLink("Ruby Taiwan", "https://ruby.tw/")}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </Layout>
)

export default IndexPage
