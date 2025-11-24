# Centurion VS Code Theme

This repository contains the Centurion color theme for Visual Studio Code.

Files added by the extension scaffold:

- `package.json` — VS Code extension manifest (name, publisher, contributes, scripts)
- `themes/centurion-color-theme.json` — the theme JSON used by the extension

Quick start
1. Replace or edit `themes/centurion-color-theme.json` if you want to tweak colors.
2. Install `vsce` (packager) if you want to create a .vsix:

```bash
npm install -g vsce
```

3. Package the extension:

```bash
cd /Users/vidyasagar/Documents/code/centurion-vscode-theme
npx vsce package
```

4. Install the generated VSIX in VS Code:

```bash
code --install-extension centurion-vscode-theme-0.1.0.vsix
```

Publishing

Set `publisher` in `package.json` to your marketplace publisher id, then use `vsce publish` to publish.

Notes

- The `themes/centurion-color-theme.json` file was copied from the root `centurion-color-theme.json`.
- If you want me to commit and push these new files to the `development` branch, say "commit and push".
