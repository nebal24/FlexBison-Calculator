# Flex Bison Calculator

This is a simple command-line calculator built using **Flex** and **Bison** in C.

The goal of the project is to demonstrate how input is processed step by step — from tokenizing expressions to parsing and evaluating them.

---

## 🚀 What it can do

* Perform basic arithmetic operations: `+`, `-`, `*`, `/`, `%`
* Handle parentheses correctly
* Store and use variables

  ```text
  a = 5
  a + 2 → 7
  ```
* Support comparisons: `<`, `>`, `<=`, `>=`, `==`, `!=`
* Use logical operators: `&&`, `||`
* Handle increment and decrement:

  * `++a`, `--a`
  * `a++`, `a--`

---

## 🛠️ Built with

* C
* Flex
* Bison
* GCC

---

## ⚙️ How to run it

### Linux / WSL

```bash
bison -d calc.y
flex calc.l
gcc calc.tab.c lex.yy.c -o calc
./calc
```

### Windows (PowerShell)

```powershell
bison -d calc.y
flex calc.l
gcc calc.tab.c lex.yy.c -o calc.exe
.\calc.exe
```

---

## 📌 Example

```text
a = 5
5

a + 3
8

++a
6

a > 3
1
```

---

## 📁 Project files

```text
calc.l        → Flex file (tokens)
calc.y        → Bison file (grammar + logic)
calc.tab.c    → generated parser
calc.tab.h    → header file
lex.yy.c      → generated lexer
```

---

## ⚠️ Notes

Some files are generated automatically (like `calc.tab.c` and `lex.yy.c`) and can always be recreated using Flex and Bison.

This project is intended for educational purposes to demonstrate parsing and evaluation concepts.
