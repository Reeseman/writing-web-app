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

## Database

- Standalone PostgreSQL, ActiveRecord

## Code Conventions

#### Vue

1. Components must be MultiwordCamelCase, along with their file names
2. Component `data` must be a function. 
3. Prop definitions must include at least `type`, `required`, and `validator` fields
4. v-for must include :key
5. Don't ever use v-for on the same element as v-if
6. Always use scoped style attributes
7. Base components must always start with the word `Base`
8. Single-instance components must start with `The`
9. Tightly-coupled components must start with the same base
10. Prop names should always use camelCase during declaration, but kebab-case in templates and JSX.

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
