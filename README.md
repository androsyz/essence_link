# EssenceLink

EssenceLink is a simple URL shortener built with Elixir, Phoenix, and Absinthe.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/androsyz/essence_link.git
    cd essence_link
    ```
    
2.  **Create `.env` file:**

    Before running Docker Compose, you might need to create a `.env` file based on a `.env.example` file.

    ```bash
    cp .env.example .env
    ```

    **Note:** You might need to adjust the values in your `.env` file (like database credentials, API keys, etc.) to match your local setup or the defaults specified in the `.env.example` file.
3.  **Run Docker Compose:**

    ```bash
    docker compose up -d
    ```

### Usage

Once your Docker services are running, you can access the EssenceLink application through its GraphQL API.

**GraphQL API**

EssenceLink exposes a GraphQL API, which you can interact with using the GraphiQL playground.

Navigate to http://localhost:4000/graphiql in your browser. From here, you can execute queries and mutations.

**Mutation**
```graphql
mutation {
  shortenUrl(originalUrl:"http://your-url.com") {
    id
    originalUrl
    shortCode
  }
}
```

**Query**
```graphql
query {
  listLinks{
    id
    originalUrl
    shortCode
  }
}
```


