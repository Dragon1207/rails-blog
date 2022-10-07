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

Or

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/jarydkrish/nicks-blog)

## How to deploy on heroku

First, add these environment values on your heroku settings
RAILS_MASTER_KEY (you can get it from master.key file, you need to make it. refer this - https://gist.github.com/db0sch/19c321cbc727917bc0e12849a7565af9)
AWS_ACCESS_KEY
AWS_BUCKET
AWS_SECRET_ACCESS_KEY

After that, go to the project root directory on your local and run command line or terminal.

```bash
heroku login
heroku buildpacks:add --index 1 heroku-community/apt
heroku buildpacks:add --index 4 https://github.com/brandoncc/heroku-buildpack-vips
heroku git:remote -a nerd-out
git push heroku main
```

Enjoy heroku!