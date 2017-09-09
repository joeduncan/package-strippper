# Package Stripper
### Clean-up excess baggage in node_modules to reduce used disk space in Docker-like environments

When run, this package will attempt to remove all unwanted files in node_modules to create smaller Docker images.

***Use with caution! This may break your production environment.***

# Usage

1: Install
```
npm install package-stripper
```

2: Add to your package.json:
```json
{
    "scripts": {
        "stripper": "package-stripper"
    }
}
```

3: Add to your production `Dockerfile`:
```
RUN npm install && npm run stripper
```

Make sure it is executed in the same `RUN` command as `npm install` - otherwise it won't work (Docker layers)
https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/#sharing-promotes-smaller-images

### How it works
Files are deleted (that's why it can be risky) ;)

Folders removed:
- test, docs, doc, gh-pages, lcov-report

Files removed: everything, except:
- image files, sass, css, .node, .woff, .js
