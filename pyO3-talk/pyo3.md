---
theme:
  override:
    footer:
      style: template
      left: "Thomas Christensen"
      # center: "Python 🐍 + Rust 🦀 = PyO3 ❤️"
      # center: "Python  + Rust  = PyO3 ❤️"
      center: " +  = PyO3 ❤️"
      right: "{current_slide} / {total_slides}"
---

Introduction slide
---

# What is PyO3?

- Rust bindings for Python. Allowing you to write Rust modules to be consumed in a Python application.
- And vice versa (Rust calling into Python), although not covered here...


# Why

- Python is very widely used in "data" contexts
- Pure Python can be 75x slower than "native" (C/C++/Rust)


