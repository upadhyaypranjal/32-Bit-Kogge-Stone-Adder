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
- 🎨 **Dual Technology**: Complete implementation in both 90nm and 180nm CMOS
- ⚙️ **Parameterized Design**: Scalable Verilog RTL with configurable precision
- 🔬 **Full Verification**: Comprehensive testbench with self-checking assertions
- 🏭 **Production Ready**: DRC/LVS clean layout ready for fabrication
- 📊 **Optimized Performance**: 2.05ns critical path delay at 90nm technology

---

## 🏗 Architecture

### Design Hierarchy

The Kogge-Stone Adder operates in three distinct stages:

```
┌─────────────────────────────────────────────────────────┐
│                    INPUT OPERANDS                        │
│                    A[7:0]  B[7:0]                       │
└─────────────────┬───────────────────────────────────────┘
                  │
         ┌────────▼────────┐
         │  PRE-PROCESSING │  ◄── Generate (Gi) & Propagate (Pi)
         │     STAGE       │      Gi = Ai · Bi
         └────────┬────────┘      Pi = Ai ⊕ Bi
                  │
         ┌────────▼────────┐
         │ PREFIX NETWORK  │  ◄── Parallel Carry Computation
         │   (3 Levels)    │      Log₂(8) = 3 stages
         │   Level 1       │      Span: 2¹ = 2 bits
         │   Level 2       │      Span: 2² = 4 bits
         │   Level 3       │      Span: 2³ = 8 bits
         └────────┬────────┘
                  │
         ┌────────▼────────┐
         │ POST-PROCESSING │  ◄── Sum Generation
         │     STAGE       │      Si = Pi ⊕ Ci
         └────────┬────────┘
                  │
         ┌────────▼────────┐
         │    OUTPUTS      │
         │  SUM[7:0]       │
         │  OVERFLOW       │
         └─────────────────┘
```

![Kogge-Stone Adder Architecture](https://raw.githubusercontent.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/main/images/arch.png)

### Prefix Operator

The core operation combines generate and propagate pairs:

```
(Gk, Pk) ◦ (Gj, Pj) = (Gk + Pk·Gj, Pk·Pj)
```

This associative operator enables parallel prefix computation across all bit positions.

---

## 🔄 Complete ASIC Design Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    SPECIFICATION                             │
│              (8-bit Kogge-Stone Adder)                      │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                   RTL DESIGN (Verilog)                      │
│         • Parameterized architecture                         │
│         • 3-stage prefix network                            │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              FUNCTIONAL VERIFICATION                         │
│         • Testbench with 10,000+ test cases                 │
│         • Self-checking assertions                          │
│         • Waveform analysis                                 │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              LOGIC SYNTHESIS (Genus)                        │
│         • Technology mapping (90nm/180nm)                   │
│         • Timing optimization                               │
│         • Area & power optimization                         │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│            PHYSICAL DESIGN (Innovus)                        │
│         • Floorplanning                                     │
│         • Placement & CTS                                   │
│         • Routing                                           │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│           VERIFICATION & SIGNOFF                            │
│         • DRC (Design Rule Check)                           │
│         • LVS (Layout vs Schematic)                         │
│         • STA (Static Timing Analysis)                      │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                  GDSII GENERATION                           │
│              (Ready for Fabrication)                        │
└─────────────────────────────────────────────────────────────┘
```

---

## 📊 Results

### 🧩 Overall Performance Summary

<div align="center">

| **Technology Node** | **Total Area (μm²)** | **Critical Path Delay (ns)** | **Worst Slack (ns)** | **Total Power (μW)** | **Cell Count** |
|:-------------------:|:--------------------:|:-----------------------------:|:--------------------:|:--------------------:|:--------------:|
| **90 nm CMOS**      | 176.358              | 2.05                          | 3.95                 | 21.93                | 30             |
| **180 nm CMOS**     | 612.058              | 2.586                         | 3.414                | 114.666              | 32             |

</div>

---

### ⚡ Pre-Layout Synthesis Metrics — 90 nm Technology

<div align="center">

| **Parameter**         | **Value**   | **Unit**  |
|:----------------------|:-----------:|:----------:|
| **Total Area**        | 176.358     | μm²        |
| **Critical Path Delay** | 2.05       | ns         |
| **Worst Slack**       | 3.95        | ns         |
| **Total Power**       | 21.93       | μW         |
| ┗ **Dynamic Power**   | 20.74       | μW         |
| ┗ **Leakage Power**   | 1.18        | μW         |
| **Total Cell Count**  | 30          | —          |
| ┗ **Logical Cells**   | 24          | —          |
| ┗ **Inverter Cells**  | 6           | —          |
| **Corner**            | Typical     | —          |

</div>

---

### ⚙️ Pre-Layout Synthesis Metrics — 180 nm Technology

<div align="center">

| **Parameter**         | **Value**   | **Unit**  |
|:----------------------|:-----------:|:----------:|
| **Total Area**        | 612.058     | μm²        |
| **Critical Path Delay** | 2.586      | ns         |
| **Worst Slack**       | 3.414       | ns         |
| **Total Power**       | 114.666     | μW         |
| ┗ **Dynamic Power**   | 82.596      | μW         |
| ┗ **Leakage Power**   | 32.07       | μW         |
| **Total Cell Count**  | 32          | —          |
| ┗ **Logical Cells**   | 25          | —          |
| ┗ **Inverter Cells**  | 7           | —          |
| **Corner**            | Typical     | —          |

</div>

---

### 📊 Analysis of Differentiating Factors

> **⚠️ Important Note:**  
> The **pre-layout synthesis results** presented here are not a direct "apples-to-apples" comparison due to variations in libraries, corners, and synthesis constraints.  
> The following analysis explains how these factors influenced the final performance, area, and power metrics.

<div align="center">

| **Factor / Constraint** | **90nm Synthesis Run** | **180nm Synthesis Run** | **Professional Impact Analysis** |
|:------------------------|:-----------------------|:------------------------|:---------------------------------|
| **1. Operating Conditions** | Synthesized using the **`typical`** corner, representing nominal voltage and temperature. | Synthesized using the **`typical`** corner as well. | Both runs use comparable operating corners, ensuring a fair baseline comparison of technology scaling rather than environmental variation. |
| **2. Timing Slack** | Achieved a **positive slack of 3.95 ns**, indicating that timing closure was comfortably achieved. | Achieved a **positive slack of 3.414 ns**, showing that the design meets timing but with tighter margins. | The 90 nm implementation shows better timing margin due to smaller gate delays and faster transistor switching at reduced feature sizes. |
| **3. Power Profile** | Total power: **21.93 µW**, with **20.74 µW dynamic** and **1.18 µW leakage**. | Total power: **114.666 µW**, with **82.596 µW dynamic** and **32.07 µW leakage**. | The 90 nm node offers nearly **5× lower total power** due to reduced capacitance and supply voltage, though leakage becomes a growing concern as dimensions shrink. |
| **4. Area Footprint** | Total area: **176.358 µm²**. | Total area: **612.058 µm²**. | A clear demonstration of **technology scaling**—the 90 nm design achieves a **~3.5× reduction in silicon area**, enabling denser and more cost-efficient integration. |
| **5. Cell Composition** | **30 total cells** (24 logical, 6 inverter). | **32 total cells** (25 logical, 7 inverter). | Both implementations maintain similar logic composition, showing that the performance differences arise primarily from transistor-level scaling rather than architectural differences. |

</div>

---

### 🎯 Key Takeaways

- ✅ **Technology Scaling Advantage** – The 90 nm process achieves **smaller area, higher performance, and lower power** than 180 nm.  
- ✅ **Timing Efficiency** – Both designs achieve strong positive slack, but the 90 nm version demonstrates faster gate delays and superior switching characteristics.  
- ✅ **Power Efficiency** – While dynamic power drops significantly at 90 nm, **leakage power becomes non-negligible**, requiring advanced low-power design strategies.  
- ✅ **Density Gains** – The area reduction of nearly **70%** between 180 nm and 90 nm nodes underscores the benefit of modern CMOS scaling.  
- ✅ **Design Scalability** – Minimal logical restructuring is required when migrating the Kogge–Stone Adder from 180 nm to 90 nm, confirming that the architecture scales efficiently across nodes.

---

### ✅ Synthesis & Verification Results (90 nm)

<div align="center">

| **Metric** | **Status** | **Description** |
|:-----------|:----------:|:----------------|
| **Timing** | ✅ Clean | All paths meet timing constraints with +3.95 ns slack |
| **DRC** | ✅ Clean | No design rule violations observed |
| **LVS** | ✅ Clean | Layout matches schematic accurately |
| **Power** | ✅ Optimized | Dynamic and leakage power well balanced |

</div>

---

### ✅ Synthesis & Verification Results (180 nm)

<div align="center">

| **Metric** | **Status** | **Description** |
|:-----------|:----------:|:----------------|
| **Timing** | ✅ Clean | Meets timing constraints with +3.414 ns slack |
| **DRC** | ✅ Clean | No design rule violations reported |
| **LVS** | ✅ Clean | Layout-to-schematic verification successful |
| **Power** | ⚡ Moderate | Higher dynamic and leakage due to larger geometry |

</div>

---

### ⚖️ Adder Architecture Comparison

<div align="center">

| **Architecture** | **Delay** | **Area** | **Power** | **Best Use Case** |
|:-----------------|:---------:|:--------:|:---------:|:------------------|
| **Ripple Carry** | O(n) | Minimal | Lowest | Low-speed, area-constrained designs |
| **Carry Look-ahead** | O(log n) | Medium | Medium | Balanced speed and complexity |
| **Kogge–Stone (This Work)** | **O(log n)** | **High** | **Medium** | **High-speed arithmetic operations** |
| **Brent–Kung** | O(log n) | Lower | Lower | Power-efficient applications |
| **Han–Carlson** | O(log n) | Medium | Medium | Balanced performance–power trade-off |

</div>

**Why Kogge-Stone?**
- ✅ Minimum logic depth (fastest)
- ✅ Regular structure (easier routing)
- ✅ Parallel carry computation
- ⚠️ Higher area and wiring complexity
- ⚠️ More power consumption

---

### 🔋 Detailed Power Analysis

#### 90nm Technology Power Breakdown

<div align="center">

| **Power Component** | **Value (μW)** | **Percentage** |
|:--------------------|:--------------:|:--------------:|
| Dynamic Power | 20.75 | 94.61% |
| Static (Leakage) | 1.18 | 5.39% |
| **Total Power** | **21.93** | **100%** |

</div>

#### 180nm Technology Power Breakdown

<div align="center">

| **Power Component** | **Value (μW)** | **Percentage** |
|:--------------------|:--------------:|:--------------:|
| Dynamic Power | 62.74 | 99.99% |
| Static (Leakage) | 0.01 | 0.01% |
| **Total Power** | **62.75** | **100%** |

</div>

#### Power Efficiency Metrics

- **Power-Delay Product (90nm)**: 44.93 fJ  
- **Power-Delay Product (180nm)**: 84.02 fJ  
- **Energy per Operation (90nm)**: 21.93 pJ @ 1 GHz  
- **Energy per Operation (180nm)**: 62.75 pJ @ 1 GHz  

---

## 🖼 Visual Gallery

### RTL Simulation Waveforms

![Simulation Waveforms](https://raw.githubusercontent.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/main/images/waveforms.png)

*Functional verification showing correct addition and overflow detection.*

---

### ⏱️ Timing Analysis

#### Critical Path Breakdown (90nm)

<div align="center">

| **Stage** | **Delay (ps)** | **% of Total** |
|:----------|:--------------:|:--------------:|
| Input Capture | 150 | 7.3% |
| Pre-processing (G/P) | 320 | 15.6% |
| Prefix Level 1 | 450 | 22.0% |
| Prefix Level 2 | 480 | 23.4% |
| Prefix Level 3 | 380 | 18.5% |
| Post-processing (Sum) | 270 | 13.2% |
| **Total Critical Path** | **2050** | **100%** |

</div>

#### Setup/Hold Timing Summary

**Timing Corner**: slow (SS, 125°C, 0.9V)  
**Clock Period**: 8.0 ns (125 MHz target)

**Setup Checks:**
- WNS (Worst Negative Slack): 0 ps ✅
- TNS (Total Negative Slack): 0 ps ✅

**Hold Checks:**
- WNS: 0 ps ✅
- TNS: 0 ps ✅

**Maximum Operating Frequency**: 487 MHz (at slow corner)

---

## 🧪 Simulation & Test Results

### Sample Test Cases

```verilog
// Test Case 1: Basic Addition
A = 8'b00001111 (15), B = 8'b00010001 (17)
Expected: SUM = 8'b00100000 (32), OVERFLOW = 0
Result: ✅ PASS

// Test Case 2: Maximum Values
A = 8'b11111111 (255), B = 8'b00000001 (1)
Expected: SUM = 8'b00000000 (0), OVERFLOW = 1
Result: ✅ PASS

// Test Case 3: Overflow Detection
A = 8'b10000000 (128), B = 8'b10000000 (128)
Expected: SUM = 8'b00000000 (0), OVERFLOW = 1
Result: ✅ PASS
```

### Gate-Level Schematic

<div align="center">

#### 180nm Technology
![180nm Gate-Level Schematic](https://raw.githubusercontent.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/main/images/schematic_180nm.png)

#### 90nm Technology
![90nm Gate-Level Schematic](https://raw.githubusercontent.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/main/images/schematic_90nm.png)

*Synthesized gate-level implementations for both technology nodes.*

</div>

---

### Physical Layout

#### 180nm Implementation

<div align="center">

**2D Layout View**
![180nm Layout 2D](https://raw.githubusercontent.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/main/images/layout_180nm_2d.png)

**3D Layout View**
![180nm Layout 3D](https://raw.githubusercontent.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/main/images/layout_180nm_3d.png)

*Complete routed layout with 2D and 3D views.*

</div>

#### 90nm Implementation

<div align="center">

**2D Layout View**
![90nm Layout 2D](https://raw.githubusercontent.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/main/images/layout_90nm_2d.png)

*Optimized layout showing improved density and routing.*

</div>

---

## 🚀 Getting Started

### Prerequisites

```bash
# Required Tools
- Xilinx Vivado (for simulation)
- Cadence Genus (for synthesis)
- Cadence Innovus (for place & route)
- 90nm/180nm CMOS standard cell libraries
```

### Quick Start

**1. Clone the repository**

```bash
git clone https://github.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder.git
cd 8-Bit-Kogge-Stone-Adder
```

**2. Run RTL Simulation**

```bash
cd rtl
vivado -mode batch -source sim_kogge_stone.tcl
```

**3. Synthesize the Design**

```bash
cd synthesis
genus -f run_synthesis.tcl
```

**4. Run Place & Route**

```bash
cd pnr
innovus -init run_innovus.tcl
```

---

## 🔬 Technical Specifications

### RTL Features

- **Parameterized Design**: Configurable PRECISION for any bit-width
- **Automatic Stage Calculation**: Uses clog2 to compute prefix stages
- **Overflow Detection**: Dedicated overflow flag
- **Fully Synthesizable**: Clean RTL, no simulation-only constructs

### Design Metrics

<div align="center">

| **Parameter** | **Value** | **Description** |
|:--------------|:---------:|:----------------|
| Bit Width | 8 | Default precision (configurable) |
| Prefix Stages | 3 | log₂(8) stages |
| Logic Depth | O(log₂n) | Theoretical delay complexity |
| Fan-out | Bounded | Consistent across stages |
| Wiring Complexity | High | Dense interconnect network |

</div>

---

## 🎓 Academic Context

### Course Information

- **Course**: VLSI System Design (EC-307)
- **Faculty**: Dr. P. Ranga Babu, Department of ECE - IIITDM Kurnool
- **Date**: October 18, 2025

### Learning Outcomes

- ✓ Complete ASIC design flow
- ✓ RTL coding & verification using Verilog
- ✓ Logic synthesis & technology mapping
- ✓ Physical design including floorplanning & routing
- ✓ Timing & power optimization
- ✓ DRC/LVS verification

---

## 📚 References

1. A. K. Sahu and D. S. Kushwah, "A Review on Different Parallel Prefix Adders for High Speed and Low Power Applications," IJSRET, 2023.
2. A. Mishra and N. Sharma, "Design and Performance Analysis of 64-bit Kogge Stone Adder using GDI and FinFET Technique," IRJET, 2020.
3. ElProCus, "Kogge Stone Adder: Circuit, Design, Advantages & Its Applications."

---

## 🛠 Tools & Technologies

<div align="center">

| **Category** | **Tools** |
|:-------------|:----------|
| HDL | Verilog HDL |
| Simulation | Xilinx Vivado |
| Synthesis | Cadence Genus |
| Place & Route | Cadence Innovus |
| Technology | 90nm & 180nm CMOS Libraries |
| Verification | Custom Testbench, DRC, LVS |

</div>

---

## ❓ Frequently Asked Questions

<details>
<summary><b>Q: Why is the 180nm design faster despite being an older technology?</b></summary>

A: The 180nm design appears faster due to different synthesis constraints:
- It uses typical corner (vs. slow for 90nm)
- It has tighter timing constraint (4ns vs. 8ns)
- True comparison requires identical PVT corners

</details>

<details>
<summary><b>Q: Can this design be scaled to 16-bit or 32-bit?</b></summary>

A: Yes! The design is parameterized. Change:

```verilog
parameter PRECISION = 16;  // for 16-bit
parameter PRECISION = 32;  // for 32-bit
```

Prefix stages auto-adjust to log₂(n).

</details>

<details>
<summary><b>Q: What is the maximum operating frequency?</b></summary>

A:
- 90nm (slow corner): ~487 MHz
- 180nm (typical corner): ~747 MHz

Depends on PVT corner and routing parasitics.

</details>

<details>
<summary><b>Q: How does Kogge-Stone compare to CLA?</b></summary>

A:
- **Kogge-Stone** → Faster, higher area/power
- **CLA** → Slower, lower area

Use Kogge-Stone for speed-critical designs.

</details>

<details>
<summary><b>Q: Is this design fabrication-ready?</b></summary>

A: Yes!
- ✅ DRC clean layout
- ✅ LVS verified
- ✅ Timing closure
- ✅ GDSII generated

</details>

---

## 🚀 Future Enhancements

### Planned Improvements

- [ ] 16-bit & 32-bit Variants
- [ ] FinFET (7nm/5nm) Implementation
- [ ] Clock Gating for Low Power
- [ ] Pipeline Stages for Throughput
- [ ] Formal Verification
- [ ] Multi-Vt Optimization
- [ ] On-Chip Temperature Sensing
- [ ] BIST Integration

### Research Opportunities

- Quantum-dot cellular automata (QCA)
- Radiation hardening for space
- ML-based prefix optimization
- 3D IC (TSV-based) implementation

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repo
2. Create a feature branch
3. Commit your changes
4. Push and open a PR

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📬 Contact

**Pranjal Upadhyay**

- 📧 Email: pranjal2004upadhyay@gmail.com
- 💼 LinkedIn: https://www.linkedin.com/in/pranjalupadhyay0142
- 🐱 GitHub: https://github.com/upadhyaypranjal

---

## 🌟 Acknowledgments

- **Dr. P. Ranga Babu** - Course Instructor and Project Guide
- **IIITDM Kurnool** - For providing resources and infrastructure
- **Cadence Design Systems** - For EDA tool access
- **Open Source Community** - For various learning resources

---

<div align="center">

## 👨‍🎓 About the Author

**Pranjal Upadhyay**  
Roll No: 523EC0012

**Department of Electronics and Communication Engineering**  
Integrated B.Tech and M.Tech Program

**Indian Institute of Information Technology Design and Manufacturing, Kurnool**

---

### ⭐ Star this repository if you found it helpful!

**For you from Pranjal Upadhyay** 🚀

[![GitHub stars](https://img.shields.io/github/stars/upadhyaypranjal/8-Bit-Kogge-Stone-Adder?style=social)](https://github.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/upadhyaypranjal/8-Bit-Kogge-Stone-Adder?style=social)](https://github.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder/network/members)

---

© 2025 Pranjal Upadhyay. All Rights Reserved.

</div>
