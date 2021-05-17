import React from "react"
//import { Link } from "gatsby"

import Layout from "../components/Layout"
import SEO from "../components/SEO"

const externalLink = (text, link) => (
  <a href={link} title={text} target="_blank" rel="noopener noreferrer">{text}</a>
);

const Tiles = ({ items }) => (
  items.map(
    (item, index) => (
      <div className="tile is-parent">
        <div key={index} className="tile is-child box">
          <h2>{item.title}</h2>
          <ul>
            {item.links.map(
              (link, index) =>
                <li key={index}>{externalLink(link.title, link.url)}</li>
            )}
          </ul>
        </div>
      </div>
    )
  )
)

const TileContainer = ({ items }) => (
  <div className="tile">
    <Tiles items={items} />
  </div>
)

const IndexContainer = props => (
  <section className="section content">
    <div className="container">
      <h1>{props.title}</h1>
    </div>

    <div className="tile is-ancestor is-vertical">
      {props.children}
    </div>
  </section>
)

const IndexPage = () => (
  <Layout>
    <SEO keywords={[`elixir`, `taiwan`, `erlang`, `homepage`]} />
    <IndexContainer title={'Elixir |> Taiwan'}>
      <TileContainer items={data.slice(0, 3)} />
      <TileContainer items={data.slice(3, 6)} />
      <TileContainer items={data.slice(6, 9)} />
    </IndexContainer>
  </Layout>
)
export default IndexPage

const data =
  [
    {
      title: '官網',
      links: [
        { title: 'Elixir 官網', url: 'https://elixir-lang.org/' },
        { title: 'Hex 套件管理', url: 'https://hex.pm/' },
        { title: 'Phoenix 官網', url: 'https://phoenixframework.org/' },
        { title: 'Nerves 官網', url: 'https://nerves-project.org/' },
      ]
    },
    {
      title: '中文學習資源',
      links: [
        { title: 'Elixir 台灣 Slack', url: 'https://ln.elixir.tw/join-slack' },
        { title: 'Elixir 台灣 Meetup', url: 'https://www.meetup.com/elixirtw-taipei/' },
        { title: 'Elixir School 繁體中文', url: 'https://elixirschool.com/zh-hant/' },
        { title: 'Elixir 台灣臉書群組', url: 'https://www.facebook.com/groups/elixir.tw' }
      ]
    },
    {
      title: '英文學習資源',
      links: [
        { title: 'Elixir 官方教學', url: 'https://elixir-lang.org/getting-started/introduction.html' },
        { title: 'Elixir 官方文件', url: 'https://hexdocs.pm/elixir/Kernel.html' },
        { title: 'Phoenix 官方教學', url: 'https://hexdocs.pm/phoenix/overview.html' },
        { title: 'Phoenix 官方文件', url: 'https://hexdocs.pm/phoenix/Phoenix.html' },
        { title: '官方 Slack', url: 'https://elixir-slackin.herokuapp.com/' },
        { title: '官方討論版', url: 'https://elixirforum.com/' },
        { title: '推薦 Elixir 套件', url: 'https://github.com/h4cc/awesome-elixir' }
      ]
    },
    {
      title: '書籍',
      links: [
        { title: 'Programing Elixir 1.6', url: 'https://pragprog.com/book/elixir16/programming-elixir-1-6' },
        { title: 'Elixir in Action, Second Ed.', url: 'https://www.manning.com/books/elixir-in-action-second-edition' },
        { title: 'Programing Phoenix 1.4', url: 'https://pragprog.com/book/phoenix14/programming-phoenix-1-4' },
        { title: 'Designing for Scalability with Erlang/OTP', url: 'http://shop.oreilly.com/product/0636920024149.do' },
        { title: 'Metaprogramming Elixir', url: 'https://pragprog.com/book/cmelixir/metaprogramming-elixir' },
        { title: 'The Little Elixir and Otp Handbook', url: 'https://www.manning.com/books/the-little-elixir-and-otp-guidebook' },
        { title: 'Craft GraphQL APIs in Elixir with Absinthe', url: 'https://pragprog.com/book/wwgraphql/craft-graphql-apis-in-elixir-with-absinthe' }
      ]
    },
    {
      title: 'Podcast',
      links: [
        { title: 'Elixir Mix', url: 'https://devchat.tv/elixir-mix/' },
        { title: 'Elixir Outlaws', url: 'https://elixiroutlaws.com/' }
      ]
    },
    {
      title: '研討會',
      links: [
        { title: 'ElixirConf US', url: 'https://elixirconf.com' },
        { title: 'ElixirConf EU', url: 'http://www.elixirconf.eu/' },
        { title: 'Lone Star Elixir', url: 'https://www.lonestarelixir.com/' },
        { title: '全部的 Elixir 研討會的 Talk', url: 'https://everyelixirvideo.page/' }
      ]
    },
    {
      title: '社群友站',
      links: [
        { title: '五倍紅寶石', url: 'https://5xruby.tw/' },
        { title: 'Ruby Taiwan', url: 'https://ruby.tw/' }
      ]
    }
  ]
