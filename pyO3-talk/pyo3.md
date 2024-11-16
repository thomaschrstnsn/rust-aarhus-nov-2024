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


# Agenda
- Motivation
- - Python
- - Efficiency
- - Comparison with Rust
---
- Examples from the Python ecosystem
- Introduction to `PyO3` / `maturin`
---
- Demo (getting started)
- - "What do we get 'out of the box'?"
---
- Examples
- - returning values from Rust: todo: https://pyo3.rs/v0.23.0/conversions/tables.html
- - `struct` from Rust
- - `dict` from Python
- - `callable` from Python

TODO: https://pyo3.rs/v0.23.0/performance.html#extract-versus-downcast

---
- Integration:
- - Static vs dynamic typing
- - Borrow checking vs garbage collection
- - logging: todo: https://pyo3.rs/v0.23.0/ecosystem/logging.html#logging


<!-- end_slide -->
# Python is Great!

- Python is very widely used, especially in "data" contexts
- Easy to use and get started with
- Dynamically typed


<!-- end_slide -->

# Comparison with Rust


```python +exec
def my_function(x: int, y: int) -> int:
    return x + y

from dataclasses import dataclass
@dataclass
class MyData:
    a: int
    b: int

def main():
    print("applying a function:", my_function(2, 3))
    data = MyData(a = 42, b = 0)
    print(f"data: a: {data.a} b: {data.b}")

main()

```


```rust +exec
fn my_function(x: i64, y: i64) -> i64 {
    x + y
}

struct MyData {
    a: i64,
    b: i64,
}

fn main() {
    println!("applying a function: {}", my_function(2,3));
    let data = MyData{a: 42, b: 0};
    println!("data: a: {} b: {}", data.a, data.b);
}


```


Python Efficiency
---
- Pure Python can be 75x slower than "native" (`C`/`C++`/`Rust`)
- TODO: cloud bill, datacenter, environment

<!-- pause -->

![performance/energy](./pics/perf.png)

> Source: [It's Not Easy Being Green: On the Energy Efficiency of Programming Languages](https://arxiv.org/abs/2410.05460)

> Their experiments leverage Intel’s Running Average Power Limit (RAPL) interface to measure energy consumption, and
> GNU time or Python’s memory_profiler to measure peak or “total” memory usage, respectively.
> The programs used for comparison are from the Computer Language Benchmark Game (CLBG)

Notable examples of Python libraries implemented in more efficient languages
---

# Popular libraries in the Python ecosystem
<!-- pause -->

## [`NumPy`](https://numpy.org/) 
> The fundamental package for scientific computing with Python.
- Implemented in C & Python

<!-- pause -->

## [`pandas`](https://pandas.pydata.org/) - `DataFrames`
> `pandas` is a fast, powerful, flexible and easy to use data analysis and manipulation tool
- Critical paths are written in Cython or C

<!-- pause -->
## [`Polars`](https://pola.rs/) 
- "`pandas` in Rust", 50x speedup

<!-- pause -->
## [`bytewax`](https://bytewax.io/)
>  Stream processing as easy as Py
- Implemented in Python and Rust 
- - Utilizing the Rust crate [`timely`](https://github.com/TimelyDataflow/timely-dataflow)


What is PyO3?
---

- Rust bindings for Python. Allowing you to write Rust modules to be consumed in a Python application.
- And vice versa (Rust calling into Python), although not covered here...




