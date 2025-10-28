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

![Simulation Waveforms](./images/arch.png)

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

## 📊 Results
## 🔬 Performance Comparison (Post-Synthesis)

### Overall Performance Summary

<div align="center">

| **Technology Node** | **Area (μm²)** | **Delay (ns)** | **Power (μW)** | **Cell Count** |
|:-------------------:|:--------------:|:--------------:|:--------------:|:--------------:|
| **90nm CMOS**       | 176.36         | 2.05           | 21.93          | 30             |
| **180nm CMOS**      | 542.203        | 1.339          | 62.75          | 24             |

</div>

---

### ⚡ Post-Synthesis Metrics - 90nm Technology

<div align="center">

```
╔══════════════════════════════════════════════╗
║       POST-SYNTHESIS METRICS - 90nm           ║
╠══════════════════════════════════════════════╣
║  🎯 Core Area      : 176.36 μm²               ║
║  ⚡ Critical Path  : 2.05 ns                   ║
║  🔋 Total Power    : 21.93 μW                  ║
║  🔢 Cell Count     : 30                        ║
║  ✅ Timing Slack   : +3950 ps                  ║
║  🔧 Corner         : Slow                      ║
╚══════════════════════════════════════════════╝
```

</div>

---

### 🔧 Post-Synthesis Metrics - 180nm Technology

<div align="center">

```
╔══════════════════════════════════════════════╗
║      POST-SYNTHESIS METRICS - 180nm           ║
╠══════════════════════════════════════════════╣
║  🎯 Core Area      : 542.203 μm²              ║
║  ⚡ Critical Path  : 1.339 ns                  ║
║  🔋 Total Power    : 62.75 μW                  ║
║  🔢 Cell Count     : 24                        ║
║  ✅ Timing Slack   : +612.4 ps                 ║
║  🔧 Corner         : Typical                   ║
╚══════════════════════════════════════════════╝
```

</div>

---

### 📊 Analysis of Differentiating Factors

> **⚠️ Important Note:** The synthesis results are not a direct "apples-to-apples" comparison due to significant differences in the environment and constraints for each run. This analysis explains how these settings led to the final outcomes.

<div align="center">

| **Factor / Constraint** | **90nm Synthesis Run** | **180nm Synthesis Run** | **Professional Impact Analysis** |
|:------------------------|:-----------------------|:------------------------|:---------------------------------|
| **1. Operating Conditions** | Synthesized using the **`slow`** library, modeling a worst-case scenario (low voltage, high temp). | Synthesized using the **`typical`** library, modeling nominal operating conditions. | This is the **primary reason** for the slower delay in the 90nm design. A `slow` corner uses pessimistic timing values, leading to longer calculated delays. For a true speed comparison, both should use the same corner. |
| **2. Timing Aggressiveness** | The timing constraint was very loose at **8.0 ns**. The tool easily met this goal, leaving a huge positive slack of **3.95 ns**. | The timing constraint was much tighter at **4.0 ns**. This forced the tool to optimize heavily for speed, resulting in a much smaller slack. | The 180nm synthesis was **"timing-driven"**, prioritizing speed to meet a difficult goal. The 90nm run was not; its goal was so easy that the tool likely optimized for area or power after the loose timing was met. |
| **3. Power Profile** | Total power was low at **21.93 μW**. Static leakage power accounted for a significant **5.39%** of this total. | Total power was higher at **62.75 μW**. Static leakage power was negligible at only **0.01%**. | This highlights a key trade-off in smaller nodes. While the 90nm design has lower overall power, its smaller transistors are **"leakier"**, making static power a more relevant part of the budget, especially at the high temperatures of a `slow` corner. |
| **4. Area Footprint** | The total cell area was **176.36 μm²**. | The total cell area was **542.203 μm²**. | This clearly shows the main benefit of **technology scaling**. The 90nm design occupies approximately **one-third** of the silicon area of the 180nm design, enabling much higher integration density. |

</div>

---

### 🎯 Key Takeaways

- ✅ **Technology Scaling Benefits**: 90nm technology provides ~3× area reduction, enabling higher integration density
- ✅ **Power Trade-offs**: Smaller nodes offer lower dynamic power but increased leakage, requiring careful power management strategies
- ✅ **Design Constraints Matter**: Timing goals and PVT corners significantly impact synthesis results; fair comparisons require identical constraints
- ✅ **Optimization Focus**: Aggressive timing constraints drive performance optimization, while relaxed constraints allow area/power optimization

---

</div>
### ✅ Synthesis & Verification Results (90nm)

<div align="center">

| **Metric** | **Status** | **Description** |
|:-----------|:----------:|:----------------|
| **Timing** | ✅ Clean | All paths meet timing constraints |
| **DRC** | ✅ Clean | Zero design rule violations |
| **LVS** | ✅ Clean | Layout matches schematic perfectly |
| **Power** | ✅ Optimized | Low leakage with efficient switching |

</div>

---

## 🖼 Visual Gallery

### RTL Simulation Waveforms

![Simulation Waveforms](./images/waveforms.png)

*Functional verification showing correct addition and overflow detection*

---

### Gate-Level Schematic

<div align="center">

| **180nm Technology** | **90nm Technology** |
|:--------------------:|:-------------------:|
| ![180nm Schematic](./images/genus_schematic.png) | ![90nm Schematic](./images/genus_schematic_90.png) |

*Synthesized gate-level implementations for both technology nodes*

</div>

---

### Physical Layout

#### 180nm Implementation

<div align="center">

![180nm Layout](./images/layout_180.png)

![180nm Layout 3D](./images/layout_180_3d.png)

*Complete routed layout with 2D and 3D views*

</div>

---

#### 90nm Implementation

<div align="center">

![90nm Layout](./images/layout_90.png)

*Optimized layout showing improved density and routing*

![90nm Layout 3D](./images/lay_90_3d.png)

*Complete routed layout with 2D and 3D views*
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

1. **Clone the repository**
   ```bash
   git clone https://github.com/upadhyaypranjal/8-Bit-Kogge-Stone-Adder.git
   cd 8-Bit-Kogge-Stone-Adder
   ```

2. **Run RTL Simulation**
   ```bash
   cd rtl
   # Open Vivado and source the simulation script
   vivado -mode batch -source sim_kogge_stone.tcl
   ```

3. **Synthesize the Design**
   ```bash
   cd synthesis
   genus -f run_synthesis.tcl
   ```

4. **Run Place & Route**
   ```bash
   cd pnr
   innovus -init run_innovus.tcl
   ```

---

## 🔬 Technical Specifications

### RTL Features

- **Parameterized Design**: Configurable PRECISION parameter for any bit-width
- **Automatic Stage Calculation**: Uses clog2 function to compute prefix stages
- **Overflow Detection**: Dedicated overflow flag for arithmetic operations
- **Fully Synthesizable**: Clean RTL without simulation-only constructs

### Design Metrics

<div align="center">

| **Parameter** | **Value** | **Description** |
|:--------------|:---------:|:----------------|
| Bit Width | 8 | Default precision (configurable) |
| Prefix Stages | 3 | log₂(8) stages for 8-bit operation |
| Logic Depth | O(log₂n) | Theoretical delay complexity |
| Fan-out | Bounded | Consistent across all stages |
| Wiring Complexity | High | Dense interconnect network |

</div>

---

## 🎓 Academic Context

### Course Information

- **Course**: VLSI System Design (EC-307)
- **Faculty**: Dr. P. Ranga Babu, Department of ECE - IIITDM Kurnool
- **Date**: October 18, 2025

### Learning Outcomes

✓ Complete ASIC design flow from specification to layout  
✓ RTL coding and functional verification using Verilog  
✓ Logic synthesis and technology mapping  
✓ Physical design including floorplanning and routing  
✓ Timing analysis and power optimization  
✓ Design rule checking and layout versus schematic verification  

---

## 📚 References

1. **A. K. Sahu and D. S. Kushwah**, "A Review on Different Parallel Prefix Adders for High Speed and Low Power Applications," *International Journal of Scientific Research and Engineering Trends (IJSRET)*, vol. 9, no. 4, pp. 317-321, Jul.-Aug. 2023.

2. **A. Mishra and N. Sharma**, "Design and Performance Analysis of 64-bit Kogge Stone Adder using GDI and FinFET Technique," *International Research Journal of Engineering and Technology (IRJET)*, vol. 7, no. 3, pp. 4185-4190, Mar. 2020.

3. **ElProCus**, "Kogge Stone Adder: Circuit, Design, Advantages & Its Applications," [Online]. Available: https://www.elprocus.com/kogge-stone-adder/

---

## 🛠 Tools & Technologies

<div align="center">

| **Category** | **Tools** |
|:------------:|:----------|
| **HDL** | Verilog HDL |
| **Simulation** | Xilinx Vivado |
| **Synthesis** | Cadence Genus |
| **Place & Route** | Cadence Innovus |
| **Technology** | 90nm & 180nm CMOS Libraries |
| **Verification** | Custom Testbench, DRC, LVS |

</div>

---

## 🤝 Contributing

Contributions are welcome! If you'd like to improve this project:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

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
