import React from 'react'
import { graphql } from 'gatsby'
import Layout from '../components/Layout'
import SEO from '../components/SEO'

const BlogPost = ({ data }) => {
  const post = data.markdownRemark

  return (
    <>
      <SEO title={post.frontmatter.title} />
      <Layout>
        <div className="section content">
          <div className="container">
            <h1> {post.frontmatter.title} </h1>
          </div>

          <div dangerouslySetInnerHTML={{ __html: post.html }} />
        </div>
      </Layout>
    </>
  )
}

export default BlogPost

export const query = graphql`
  query($slug: String!) {
    markdownRemark(fields: { slug: { eq: $slug }}) {
      html
      frontmatter{
        title
      }
    }
  }
`
