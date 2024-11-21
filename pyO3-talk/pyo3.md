---
title: Unlocking Performance
sub_title: A Beginner's Guide to Python-Rust Integration with PyO3
authors:
  - Thomas Fisker Christensen (tfc@lindcapital.com / thomas@chrstnsn.dk)
theme:
  name: catppuccin-latte
  override:
    footer:
      style: template
      left: "Thomas Christensen"
      # center: "Python 🐍 + Rust 🦀 = PyO3 ❤️"
      # center: "Python  + Rust  = PyO3 ❤️"
      center: " +  = PyO3 ❤️"
      right: "{current_slide} / {total_slides}"
---

`whoami`
---


<!-- column_layout: [1,1] -->

<!-- column: 0 -->
## First paid software -> 2004
## Professional: 󰙲     
## Hobby:   

## Business domains:
*Mobile OS* - public job centres - *agriculture* - classifieds - *energy trading* - proprietary trading


<!-- column: 1 -->
```bash +exec_replace +no_background
url="https://github.com/thomaschrstnsn/rust-aarhus-nov-2024/"
echo "$url"| qrencode -t utf8i
```

<!-- reset_layout -->
```
https://github.com/thomaschrstnsn/rust-aarhus-nov-2024/
```

<!-- pause -->

# Feel free to ask questions as we go on

Agenda
---
# Intended Audience
Some Rust experience (or a burning desire to make you Python faster)
<!-- pause -->

# Comparing Python to Rust
Motivation for writing Python packages in other languages ⚡️
<!-- pause -->

# PyO3
Rust crate that can be used to generate a native Python module 

No Rust tool chain required when consuming the package!

<!-- pause -->
## How does it work?

<!-- pause -->

## How to get started?

<!-- pause -->

## Tips and Tricks


Comparing Python   with Rust  - Syntax
---

<!-- column_layout: [1,1] -->

<!-- column: 0 -->

```python {1-2|4-8|11-12|14-15} +exec
def my_function(x: int, y: int) -> int:
    return x + y

from dataclasses import dataclass
@dataclass
class MyData:
    a: int
    b: int

def main():
    result = my_function(2, 3)
    print(f"result {result}")

    data = MyData(a = 42, b = 0)
    print(f"a: {data.a} b: {data.b}")

main()

```

<!-- column: 1 -->

```rust {1-3|5-8|11-12|14-16} +exec
fn my_function(x: i64, y: i64) -> i64 {
    x + y
}

struct MyData {
    a: i64,
    b: i64,
}

fn main() {
    let result = my_function(2,3);
    println!("result {result}");

    let data = MyData{a: 42, b: 0};
    println!("a {} b: {}", 
        data.a, data.b);
}

```

Comparing Python   with Rust  - High level
---

<!-- column_layout: [1,1] -->

<!-- column: 0 -->

# Python

<!-- incremental_lists: true -->
## interpreted
## dynamically typed
<!-- pause -->
- static typing with [`mypy`](https://github.com/python/mypy)
<!-- new_lines: 1 -->
<!-- pause -->
<!-- incremental_lists: true -->

## Selling points
<!-- pause -->
- - one of the most popular programming languages
- - focus on code readability
- - significant indentation (!)
- - widespread use in the machine learning community
<!-- pause -->
<!-- incremental_lists: false -->
## TIOBE most popular language (22%)
## Stack Overflow 2024 Survey
- Desired 42% 
- Admired 68%

<!-- pause -->

<!-- column: 1 -->

# Rust
<!-- pause  -->
<!-- incremental_lists: true -->
## compiled
## statically typed
<!-- new_lines: 4 -->
<!-- pause -->
<!-- incremental_lists: true -->
## Selling points
<!-- pause -->
- - performance
- - type and memory safety
- - borrow checker (no garbage collector)
- - immutability is the default
- - concurrency


<!-- pause -->

<!-- incremental_lists: false -->
## TIOBE number 14 (1.17%)
## Stack Overflow 2024 Survey
-  Desired 29% 
- Admired 83%




Comparing Python   with Rust  - Efficiency
---
![image:width:40%](./pics/perf.png)

> Source: [It's Not Easy Being Green: On the Energy Efficiency of Programming Languages](https://arxiv.org/abs/2410.05460)

> Their experiments leverage Intel’s Running Average Power Limit (RAPL) interface to measure energy consumption, and
> GNU time or Python’s memory_profiler to measure peak or “total” memory usage, respectively.
> The programs used for comparison are from the Computer Language Benchmark Game (CLBG)

<!-- pause -->

# Pure Python is ~75x slower than "native" languages (`C`/`C++`/`Rust`)

<!-- pause -->
<!-- incremental_lists: true -->
- Impacts: 
- - hosting bills 💸
- - environment 🌍 🔌

Python libraries implemented in more efficient languages
---

# [Popular libraries in the Python ecosystem](https://pypistats.org)
<!-- pause -->

## [`NumPy`](https://numpy.org/) 
> The fundamental package for scientific computing with Python.
- Implemented in C & Python
- Downloads last month: 319,934,331

<!-- pause -->

## [`pandas`](https://pandas.pydata.org/) - `DataFrames`
> pandas is a fast, powerful, flexible and easy to use data analysis and manipulation tool
- Critical paths are written in Cython or C
- Downloads last month: 253,891,605

<!-- pause -->
## [`Polars`](https://pola.rs/) 
- "`pandas` in Rust", 50x speedup
- Downloads last month: 9,275,321


Python tools implemented in more efficient languages
---

# [Rust tools in the Python ecosystem](https://pypistats.org)

<!-- pause -->

## [`ruff`](https://docs.astral.sh/ruff/)
> An extremely fast Python linter and code formatter, written in Rust.
> ⚡️ 10-100x faster than existing linters (like Flake8) and formatters (like Black)
- Downloads last month: 30,524,476

<!-- pause -->

## [`uv`](https://docs.astral.sh/uv/)
> An extremely fast Python package and project manager, written in Rust.
> ⚡️ 10-100x faster than pip.
- Downloads last month: 18,159,832


Rust   Impact on PyPI
---

![image:width:100%](./pics/pypi_rust.png)
> [PyCon US 2024: David Hewitt - How Python Harnesses Rust through PyO3](https://www.youtube.com/watch?v=UilujdubqVU&t=733s)

What is PyO3?
---

- Rust bindings for Python. Allowing you to write Rust modules to be consumed in a Python application.


```bash +exec_replace +no_background
cat << EOF | graph-easy --as=boxart
digraph {
    rankdir=LR;
    compound=true;
    splines=true;
    node [fontname="Handlee"];
    
    subgraph python {
        label=" Python Program";
        rust_code [label=" Rust code"];
    }
    
}
EOF
```

```bash +exec_replace +no_background
cat << EOF | graph-easy --as=boxart
digraph {
    rankdir=LR;
    compound=true;
    splines=true;
    node [fontname="Handlee"];
    
    subgraph rust {
        label=" Rust Program";
        python_code [label=" Python code"];
    }
}
EOF
```

How PyO3 works
---

```rust {1}
#[pyfunction]
fn rust_function() { ... }
```

- Proc Macro which adds Rust code that targets Python's C API

<!-- pause -->

```rust
unsafe extern "C" fn __wrap() { ... }

PyMethodDef {
    ml_meth: __wrap as *mut c_void,
    ...
}
```

<!-- pause -->

- `Maturin` handles the task of compiling the Rust code to a library placed where Python can consume it.

```
┌−−−−−−−−−−−−−−−−┐                ┌−−−−−−−−−−−−−−−−−−−−−−−−−−┐
╎   Rust crate  ╎                ╎   Python C API Library  ╎
╎                ╎                ╎                          ╎
╎ ┌────────────┐ ╎  compilation   ╎ ┌──────────────────────┐ ╎
╎ │    b.rs    │ ╎ ─────────────▶ ╎ │       b.pyd 󰨡        │ ╎
╎ └────────────┘ ╎                ╎ └──────────────────────┘ ╎
╎                ╎                ╎ ┌──────────────────────┐ ╎
└−−−−−−−−−−−−−−−−┘                ╎ │  b.so              │ ╎
                                  ╎ └──────────────────────┘ ╎
                                  └−−−−−−−−−−−−−−−−−−−−−−−−−−┘
```


How PyO3 works - Python side
---

```python
import b
```
<!-- pause -->

- Can tell Python to:
<!-- new_lines: 1 -->
- - import `b.py` and import classes and functions

<!-- new_lines: 1 -->
<!-- pause -->

- - import `b/__init__.py`
<!-- new_lines: 1 -->

<!-- pause -->


- - import a correctly named compiled library

<!-- pause -->
```bash +exec_replace +no_background
cat << EOF | graph-easy --as=boxart
digraph {
    rankdir=LR;
    compound=true;
    splines=true;
    node [fontname="Handlee"];

    source [label=" b.rs"];
    python_capi [label=" Python C API Library"];
    python [label=" Python\nimport b"];

    source -> python_capi [label="1. compilation"]
    python -> python_capi [label="2. import"]
}
EOF
```


Demo (getting started)
---

# Ensuring we have `maturin`, `cargo` and `python` installed

```bash +exec
maturin --version
cargo --version
python --version
```

<!-- end_slide -->

Demo (getting started)
---
# Create a new PyO3 `cargo` project

```bash +exec
maturin new --mixed -b pyo3 demo-project
```

Demo (getting started)
---
# See what we got

```bash +exec
tree -a demo-project
```

Demo (getting started) - `Cargo.toml`
---
# The `Cargo.toml` project file

```file {1-4|6-8|10-11}
path: frozen-demo-project/Cargo.toml
language: rust
```

Demo (getting started) - `lib.rs`
---
# The Rust code

```file {1|3-7|9-14}
path: frozen-demo-project/src/lib.rs
language: rust
```

Demo (getting started) - `test_all.py`
---
# The  Python code

```file +line_numbers
path: frozen-demo-project/python/tests/test_all.py
language: python
```

Demo (getting started) - Building and Running
---
# Building the  Rust code into a  Python module

<!-- pause -->

## Setup Python Virtual Env as destination 
```bash
cd demo-project
python -m venv .venv --prompt demo-py
source .venv/bin/activate
```

<!-- pause -->

## Building
```bash
maturin develop
```

<!-- pause -->

## Testing
```bash
pip install pytest
pytest
```

Adding your own Rust data types
---

<!-- column_layout: [1,1] -->

<!-- column: 0 -->
# Types (shapes of data)

```rust
#[pyclass]
struct MyClass {
    inner: i32,
}

// A "tuple" struct
#[pyclass]
struct Number(i32);

#[pyclass]
enum MyEnum {
    Variant,
    OtherVariant
}
```

<!-- pause -->
<!-- column: 1-->

# Methods (Behaviour)

```rust
#[pymethods]
impl Number {
    #[new]
    fn new(value: i32) -> Self {
        Self(value)
    }
}
```

```rust
#[pymodule]
fn my_module(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_class::<Number>()?;
    Ok(())
}
```

Using from Python
---

```python
from my_module import Number

n = Number(5)
print(n)
```

```
<builtins.Number object at 0x000002B4D185D7D0>
```

<!-- pause -->

Implenting Python protocols
---

# We can implement `__repr__` and `__str__`

```rust {5-7|10-12}
#[pymethods]
impl Number {
    // For `__repr__` we want to return a string that Python code could use to recreate
    // the `Number`, like `Number(5)` for example.
    fn __repr__(&self) -> String {
        format!("Number({})", self.0)
    }
    // `__str__` is generally used to create an "informal" representation, so we
    // just forward to `i32`'s `ToString` trait implementation to print a bare number.
    fn __str__(&self) -> String {
        self.0.to_string()
    }
}
```

[PyO3 user guide - Class customizations](https://pyo3.rs/v0.23.1/class/protocols.html)


Tips and Tricks
---

# Seamless integration with Python `dict`s (object literals)


```python
my_object = {"name": "Odin", "title": "God", "eyes": 1}
```

<!-- pause -->


[crate `dict_derive`](https://github.com/gperinazzo/dict-derive)

```rust
use dict_derive::{FromPyObject, IntoPyObject};
```
<!-- pause -->


```rust
#[derive(FromPyObject, IntoPyObject)]
struct User {
    name: String,
    email: String,
    age: u32,
}
```

Using `FromPyObject` and `IntoPyObject`
---

```rust
// Requires FromPyObject to receive a struct as an argument
#[pyfunction]
fn get_contact_info(user: User) -> PyResult<String> {
    Ok(format!("{} - {}", user.name, user.email))
}
```
<!-- pause -->

```rust
// Requires IntoPyObject to return a struct
#[pyfunction]
fn get_default_user() -> PyResult<User> {
    Ok(User {
        name: "Default".to_owned(),
        email: "default@user.com".to_owned(),
        age: 27,
    })
}
```

`dict`s from Python
---

```python
import mylib

mylib.get_contact_info({"name": "Thor", "email": "thor@asgard.com", "age": 23})
```

```python
'Thor - thor@asgard.com'
```

<!-- pause -->

```python
mylib.get_default_user()
```

```python
{'name': 'Default', 'email': 'default@user.com', 'age': 27}
```


The End 🔚
---
<!-- column_layout: [1,1] -->
<!-- column: 0 -->

# Thanks for listening

# Questions?

# Slides are here

<!-- column: 1 -->

```bash +exec_replace +no_background
url="https://github.com/thomaschrstnsn/rust-aarhus-nov-2024/"
echo "$url"| qrencode -t utf8i
```

<!-- reset_layout -->

```
https://github.com/thomaschrstnsn/rust-aarhus-nov-2024/
```

