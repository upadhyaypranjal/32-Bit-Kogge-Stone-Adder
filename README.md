<div align="center">

# ⚡ 8-Bit Kogge-Stone Adder: RTL to GDSII

</div>

<div align="center">

![VLSI](https://img.shields.io/badge/VLSI-System%20Design-blue?style=for-the-badge)
![Technology](https://img.shields.io/badge/Tech-90nm%20%7C%20180nm-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)

*A high-performance parallel prefix adder implementing complete ASIC design flow*

[Overview](#-overview) • [Architecture](#-architecture) • [Results](#-results) • [Getting Started](#-getting-started) • [Documentation](#-documentation)

---

</div>

## 🎯 Overview

This project presents a **complete RTL-to-GDSII implementation** of an 8-bit Kogge-Stone Adder, one of the fastest parallel prefix adder architectures used in modern high-performance computing systems. The design achieves **logarithmic delay complexity O(log₂n)** compared to linear delay O(n) in conventional ripple carry adders.

### ✨ Key Highlights

- 🚀 **Ultra-Fast Addition**: Logarithmic carry propagation with only 3 prefix stages  
- 🎨 **Dual Technology**: Complete implementation in both 90 nm and 180 nm CMOS  
- ⚙️ **Parameterized Design**: Scalable Verilog RTL with configurable precision  
- 🔬 **Full Verification**: Comprehensive testbench with self-checking assertions  
- 🏭 **Production Ready**: DRC/LVS clean layout ready for fabrication  
- 📊 **Optimized Performance**: 2.05 ns critical path delay at 90 nm technology  

---

## 🏗 Architecture
*(same as before)*

---

## 📊 Results

## 🔬 Performance Comparison (Post-Synthesis and Post-Layout)

### Overall Performance Summary

<div align="center">

| **Technology Node** | **Pre-Layout Area (μm²)** | **Post-Layout Area (μm²)** | **Delay (ns)** | **Power (μW)** | **Slack (ps)** |
|:-------------------:|:--------------------------:|:---------------------------:|:---------------:|:---------------:|:---------------:|
| **90 nm CMOS**      | 176.36                    | 3414                        | 2.05            | 21.93           | +3950           |
| **180 nm CMOS**     | 542.203                   | 3950                        | 1.339           | 62.75           | +612.4          |

</div>

---

### ⚡ Post-Synthesis Metrics – 90 nm Technology

<div align="center">

