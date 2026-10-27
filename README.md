# brentc22/homebrew-tap

Homebrew formulae and casks for the tools I build.

```sh
brew tap brentc22/tap
brew trust brentc22/tap
brew install brentc22/tap/catchbox          # the command line
brew install --cask brentc22/tap/catchbox   # the Mac app
brew install --cask brentc22/tap/glint      # screenshots that blur your secrets
brew install --cask brentc22/tap/portside   # your dev servers in the menu bar
```

Current Homebrew no longer taps a third-party repository on its own, and refuses to load from one you have not trusted, hence the first two lines. You only run them once.

## What's in here

| | |
|---|---|
| [**catchbox**](https://github.com/brentc22/catchbox) | Disposable inboxes for developers. One mailbox per flow, with the one-time code and the action link pulled out for you. Installs as both `catchbox` and `testmail`. The cask is the same inbox as a Mac app, with a menu bar tray and the code in your notifications. |
| [**Glint**](https://github.com/brentc22/glint) | A screenshot tool that finds emails, IBANs, card numbers and API keys with on-device OCR and pixelates them before you share. Capture, scroll-capture, record, annotate, pin. macOS 14+. |
| [**Portside**](https://github.com/brentc22/portside) | Every dev server on your Mac in the menu bar, grouped by repo and git worktree, with the branch that started it and a stop button. macOS 14+. |

[**Stash**](https://github.com/brentc22/stash), the menu bar hider for macOS 27, lives in a tap of its own:

```sh
brew tap brentc22/stash
brew trust brentc22/stash
brew install --cask brentc22/stash/stash
```

## Updating

```sh
brew update && brew upgrade catchbox
brew upgrade --cask catchbox   # then: xattr -dr com.apple.quarantine /Applications/Catchbox.app
```

Glint and Portside update themselves from inside the app, so `brew upgrade` leaves them alone.

## License

Each tool keeps its own license; the formulae here are MIT.
