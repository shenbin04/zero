import {GraphQLServer} from 'graphql-yoga'

let links = [
  {
    id: 'link-0',
    url: 'www.howtographql.com',
    description: 'Fullstack tutorial for GraphQL',
  },
]

let idCount = links.length
const resolvers = {
  Query: {
    info: () => `This is the API of a Hackernews Clone`,
    feed: () => links,
    link: (id) => links.find((link) => link.id === id),
  },
  Mutation: {
    post: (parent, args) => {
      const link = {
        id: `link-${idCount++}`,
        description: args.description,
        url: args.url,
      }
      links.push(link)
      return link
    },
    update: (id, url, description) => {
      const link = links.find((link) => link.id === id)
      if (link) {
        link.url = url || link.url
        link.description = description || link.description
        return link
      }
    },
    delete: (id) => {
      const linkIndex = links.findIndex((link) => link.id === id)
      if (linkIndex) {
        return links.splice(linkIndex, 1)[0]
      }
    },
  },
}

const server = new GraphQLServer({
  typeDefs: 'src/schema.graphql',
  resolvers,
})

server.start(() => console.log(`Server is running on http://localhost:4000`))
