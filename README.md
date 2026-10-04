# brentc22/homebrew-tap

Homebrew formulae and casks for the tools I build.

```sh
brew install brentc22/tap/catchbox          # the command line
brew install --cask brentc22/tap/catchbox   # the Mac app
```

That is the whole setup — `brew` taps this repository for you the first time you name it.

## What's in here

| | |
|---|---|
| [**catchbox**](https://github.com/brentc22/catchbox) | Disposable inboxes for developers. One mailbox per flow, with the one-time code and the action link pulled out for you. Installs as both `catchbox` and `testmail`. The cask is the same inbox as a Mac app, with a menu bar tray and the code in your notifications. |

[**Stash**](https://github.com/brentc22/stash), the menu bar app, lives in its own tap because
it is a cask rather than a formula:

```sh
brew install --cask brentc22/stash/stash
```

## Updating

```sh
brew update && brew upgrade catchbox
brew upgrade --cask catchbox   # then: xattr -dr com.apple.quarantine /Applications/Catchbox.app
```

## License

Each tool keeps its own license; the formulae here are MIT.
