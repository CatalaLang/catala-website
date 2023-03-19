# The Catala language website

## Generating assets

The `assets` folder of the website is generated partially from the Catala
compiler. To generate these assets, please refer to the [dedicated
section of the Catala compiler `INSTALL.md`](https://github.com/CatalaLang/catala/blob/master/INSTALL.md#generating-website-assets).

## Run Project

```sh
yarn
yarn start
# this may fail because tailwind.css is not yet generated, so you have to do it again
yarn start
# In another tab, launch the local dev server
yarn server
```

View the app in the browser at http://localhost:8000. Running in this environment provides hot reloading and support for routing; just edit and save the file and the browser will automatically refresh.

To use a port other than 8000 set the `PORT` environment variable (`PORT=8080 npm run server`).

## Build for Production

```sh
yarn clean
yarn build
# this may fail because tailwind.css is not yet generated, so you have to do it again
yarn build
yarn webpack:production
```

This will replace the development artifact `build/Index.js` for an optimized version as well as copy `src/index.html` into `build/`. You can then deploy the contents of the `build` directory (`index.html` and `Index.js`).

**To enable dead code elimination**, change `bsconfig.json`'s `package-specs` `module` from `"commonjs"` to `"es6"`. Then re-run the above 2 commands. This will allow Webpack to remove unused code.

## Current deployment

The website is currently served from catala-lang.paris.inria.fr, whose underlying
IP is also pointed to by catala-lang.org. The site contents are stored in the
home directory of Denis Merigoux, so to update the contents of the website
you would just need to issue a command like this:

    rsync -ah --delete build/ demerigo@catala-lang.paris.inria.fr:/home/ROCQ/prosecco/demerigo/
