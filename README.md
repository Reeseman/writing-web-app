# writing-web-app

This is a work in progress. I'm exporing collaborative writing, improv, humor, and education all at once. This idea isn't well formed.

## Dependencies

- ruby-2.7.0
- Rails 6.1.1
- postgres (PostgreSQL) 13.1
- Vue 2.6.12
- Docker 20.10.2

## Frontend

- Vue.js

### Database

- Standalone PostgreSQL, ActiveRecord

## Games Product Roadmap (coming soon)

Assume two writers for each for now

#### Word

Using websockets, prompt each user in turn. User writes one word without spaces, may include any special characters. Have a finish button which both users must agree to.

#### Line (poem)

Using websockets, prompt each user in turn. User writes one line without spaces, hits enter to submit. Have a finish button which both users must agree to.

#### Short story (10 words minimum)

Users can view the story, and if it is their turn, make a contribution. A contribution has no max, but has a min of ten "words", whitespace-delimited strings. Have a finish button which presents itself after minimum short story length requirement has been reached, and  both users hit the button.

#### Novel (1 paragraph minimum)

Users can view the story, and if it is their turn, make a contribution. A contribution has no max, but has a min of two hundred "words", whitespace-delimited strings. Have a finish button which presents itself after minimum novel length requirement has been reached, and  both users hit the button.
