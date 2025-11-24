# Centurion VS Code Theme

Centurion is a Visual Studio Code color theme contributed via this extension.

Included files

- `package.json` — VS Code extension manifest (name, publisher, contributes, scripts)
- `themes/centurion-color-theme.json` — the theme JSON used by the extension

Quick start

1. Edit `themes/centurion-color-theme.json` to adjust colors.
2. Install `vsce` locally or use `npx` to package the extension:

```powershell
# install globally (optional)
npm install -g vsce

# or use npx (no global install required)
npx vsce package
```

3. Install the generated `.vsix` in VS Code:

```powershell
code --install-extension ./centurion-vscode-theme-<version>.vsix
```

Publishing

Set the `publisher` field in `package.json` to your Marketplace publisher ID and run:

```powershell
npx vsce publish
```

Notes

- The theme file lives at `themes/centurion-color-theme.json`.
- This repository contains tooling and sample artifacts used during development; those files are not required in the published `.vsix` and are excluded by the `.vscodeignore` file.
- If you'd like a release branch with only the minimal theme files, I can create it and push on your behalf.

Contributing

- Open a pull request with any color or metadata updates.
- Run the coverage checker (`scripts/check_theme_coverage.py`) to verify TextMate scope fallbacks before packaging.

License

This project is provided under the terms of the included `LICENSE` file.
