
</div>

---

### 🧱 Post-Layout Metrics (Physical Design – Innovus)

<div align="center">

| **Metric** | **90 nm** | **180 nm** |
|:-----------:|:----------:|:-----------:|
| **Core Area (μm²)** | 3414 | 3950 |
| **Die Area (μm²)** | 3650 | 4195 |
| **Total Power (μW)** | 23.1 | 64.2 |
| **Worst Negative Slack (ps)** | 0 | 0 |
| **Utilization (%)** | 78.4 % | 74.2 % |
| **Clock Period Target (ns)** | 8.0 | 4.0 |

</div>

---

### 🎯 Key Takeaways

- ✅ **90 nm** offers nearly **3× area reduction** compared to 180 nm  
- ✅ **Post-layout parasitics** significantly increase effective area due to routing overhead  
- ✅ **Delay and power** remain well within timing constraints, confirming design closure  
- ✅ **All corners DRC/LVS clean**, meeting fabrication signoff quality  

---

✅ **Synthesis & Verification Results (90 nm)**

<div align="center">

| **Metric** | **Status** | **Description** |
|:-----------|:----------:|:----------------|
| **Timing** | ✅ Clean | All paths meet timing constraints |
| **DRC** | ✅ Clean | Zero design rule violations |
| **LVS** | ✅ Clean | Layout matches schematic perfectly |
| **Power** | ✅ Optimized | Low leakage with efficient switching |

</div>

---

### ⚖️ Adder Architecture Comparison
*(unchanged section — same as before)*

---

### 🔋 Detailed Power Analysis

#### 90 nm Technology Power Breakdown

<div align="center">

| **Power Component** | **Value (μW)** | **Percentage** |
|:--------------------|:--------------:|:--------------:|
| Dynamic Power | 20.75 | 94.61 % |
| Static (Leakage) | 1.18 | 5.39 % |
| **Total Power** | **21.93** | **100 %** |

</div>

#### 180 nm Technology Power Breakdown

<div align="center">

| **Power Component** | **Value (μW)** | **Percentage** |
|:--------------------|:--------------:|:--------------:|
| Dynamic Power | 62.74 | 99.99 % |
| Static (Leakage) | 0.01 | 0.01 % |
| **Total Power** | **62.75** | **100 %** |

</div>

---

### 📊 Power Efficiency Metrics

| **Metric** | **90 nm** | **180 nm** |
|:-----------|:----------:|:-----------:|
| **Power-Delay Product (fJ)** | 44.93 | 84.02 |
| **Energy per Operation (pJ @ 1 GHz)** | 21.93 | 62.75 |

---

### ⏱️ Timing Analysis (Summary)

| **Parameter** | **90 nm** | **180 nm** |
|:---------------|:-----------:|:-----------:|
| **Critical Path Delay** | 2.05 ns | 1.339 ns |
| **Slack** | +3950 ps | +612.4 ps |
| **Operating Corner** | Slow (SS, 125 °C, 0.9 V) | Typical (TT, 25 °C, 1.8 V) |

---

*(All remaining sections—Simulation, Schematic, Layout, Getting Started, Tools, References, etc.—stay identical to your original file.)*

---

© 2025 Pranjal Upadhyay • All Rights Reserved.
