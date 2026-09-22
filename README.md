# brentc22/homebrew-tap

Homebrew formulae for the tools I build.

```sh
brew install brentc22/tap/catchbox
```

That is the whole setup — `brew` taps this repository for you the first time you name it.

## What's in here

| | |
|---|---|
| [**catchbox**](https://github.com/brentc22/catchbox) | Disposable inboxes for developers. One mailbox per flow, with the one-time code and the action link pulled out for you. Installs as both `catchbox` and `testmail`. |

[**Stash**](https://github.com/brentc22/stash), the menu bar app, lives in its own tap because
it is a cask rather than a formula:

```sh
brew install --cask brentc22/stash/stash
```

## Updating

```sh
brew update && brew upgrade catchbox
```

## License

Each tool keeps its own license; the formulae here are MIT.
