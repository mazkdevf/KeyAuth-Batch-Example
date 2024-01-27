# KeyAuth Batch Example - If you think this is good please ⭐ Thanks!

- This example illustrates potential functionality but is not fully secure. It lacks checks for license authentication, login, or register operations, merely outputting messages from the API without verifying the json.success property.

- Exclusive to Windows and includes HWID check.


## Introduction

This repository contains a batch script and the jq.exe tool for working with KeyAuth. JQ is a lightweight and flexible command-line JSON processor.

- [JQ Official Website](https://jqlang.github.io/jq/)
- [JQ GitHub Repository](https://github.com/jqlang/jq)

## JQ Overview

JQ is a powerful tool for manipulating JSON data. Similar to sed for text, jq provides ease in slicing, filtering, mapping, and transforming structured data.

## Portability and Dependencies

- Written in portable C.
- Zero runtime dependencies.
- A single binary can be downloaded and executed on distant machines of the same type.

## Efficiency and Simplicity

- Enables easy conversion of data formats.
- Programs written with jq are often shorter and simpler than expected.
- Offers a concise way to achieve desired data transformations.

## Usage Instructions

1. Download the jq.exe tool:
   - [Download jq.exe (1.7.1) from this repository](https://github.com/mazkdevf/KeyAuth-Batch-Example/releases/tag/1.7.1)
   - OR [Download jq.exe (1.7.1) from JQ Official Website](https://jqlang.github.io/jq/download/) (choose "1.7.1 Windows 64-bit"), and rename it to `jq.exe`.

2. Place the downloaded `jq.exe` in the same directory as your batch script.

3. Open `main.bat` in a text editor and update the following lines:
```batch
set ver=<your application version default = 1.0>
set name=<your application name>
set ownerid=<your account ownerId>
```

4. Save the changes to `main.bat`.
5. You are ready to launch it!
   
For more information on jq, refer to the jq documentation.

**Note:** Ensure that the jq.exe version used matches the one specified (1.7.1) to guarantee compatibility with this example.
