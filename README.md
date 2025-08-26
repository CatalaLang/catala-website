# The Catala language website

## Generating assets

The `assets` folder of the website is generated partially from the Catala
compiler. To generate these assets, please refer to the [dedicated
section of the Catala compiler `INSTALL.md`](https://github.com/CatalaLang/catala/blob/master/INSTALL.md#generating-website-assets).

## Run Project

```sh
# Install deps
yarn install

# Run the dev server
yarn start
```

View the app in the browser at http://localhost:5173. Running in this
environment provides hot reloading and support for routing; just edit and save
the file and the browser will automatically refresh.

To use a port other than 5173, run `yarn start --port 8080`.

## Build for Production

```sh
yarn clean
yarn build
```

This will replace the development artifact `src/Index.bs.js` for an optimized
version as well as copy `index.html` into `build/`. You can then deploy the
contents of the `build/` directory (`index.html` and `Index.js`).

## Current deployment

The website is currently served from catala-lang.paris.inria.fr, whose underlying
IP is also pointed to by catala-lang.org. The site contents are stored in the
home directory of Denis Merigoux, so to update the contents of the website
you would just need to issue a command like this:

    rsync -ah --delete --info=progress2 build/ demerigo@catala-lang.paris.inria.fr:/home/ROCQ/prosecco/demerigo/
