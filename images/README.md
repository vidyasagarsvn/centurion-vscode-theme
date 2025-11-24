Preview images for Marketplace

- `images/icon.png` — extension icon. Recommended size: 128×128 PNG.
- `images/screenshot-1.png`, `images/screenshot-2.png` — screenshots shown in the Marketplace gallery.
  Recommended size: 1280×800 (or 1000–1400px width with ~16:10 or 16:9 aspect ratio). PNG or JPG are acceptable.

Notes
- Produce real screenshots (no placeholders) showing the theme applied in editors with different file types (JS/TS, Java, Go, Rust, YAML).
- When publishing, `vsce` will include the files referenced in `package.json`. Make sure these paths are correct.
