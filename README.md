# Nick's Blog

This repo contains the rails app used to render Nick's Blog.

## Developing
### Prerequisites
Please install the following:
- [Ruby](https://www.ruby-lang.org/en/downloads/)
  - Feel free to use [RVM](https://rvm.io/) or [Rbenv (recommended)](https://github.com/rbenv/rbenv) for version management
- [NodeJS](https://nodejs.org/en/)
  - Feel free to use [NVM](https://github.com/creationix/nvm) or [Nodenv (recommended)](https://github.com/nodenv/nodenv) for version management
- [Postgres.app](https://postgresapp.com/)
- [Optional] [Redis.app](https://jpadilla.github.io/redisapp/)
- [Optional] [Medis](http://getmedis.com/)

In order to run the project in development, you'll need to install the
required RubyGems, NPM modules, and set up your Postgres database:

```bash
bundle install
yarn install
rails db:setup
```

### Running in Development

We run the tailwind CLI alongside the ruby server, so to run your development environment, use:
```bash
bin/dev
```

## Initial Deployment

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/jarydkrish/nicks-blog)

[![Deploy to DO](https://www.deploytodo.com/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/jarydkrish/nicks-blog/tree/main)
