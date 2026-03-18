# ML-KEM Zynq Accelerator

## 📌 Purpose

This repository contains RTL generated from HLS for the ML-KEM (Kyber) post-quantum cryptographic algorithm, targeting Zynq FPGA devices.

The goal of this project is to:

* Provide a hardware-ready ML-KEM accelerator (HLS → RTL)
* Enable easy Vivado project setup using TCL scripts
* Build a portable and reproducible FPGA workflow

---

## 📁 Project Structure

```
mlkem_pqc/
│
├── rtl/              # HLS-generated RTL (Verilog / VHDL)
├── tb/               # Testbench 
├── constraints/      # XDC files
├── scripts/          # Vivado automation scripts
│   ├── build_project.tcl
│   ├── add_constraints.tcl
│   ├── create_bd.tcl
│   ├── run_sim.tcl
│   ├── run_synth.tcl
│
├── master.tcl        # Entry point (runs project setup)
└── README.md
```

---

## 🚀 Clone & Setup

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/SiddGanapathy/MLKEM_PQC.git
cd MLKEM_PQC
```

---

### 2️⃣ Launch Vivado Using TCL

Run the following command from the project root:

```bash
vivado -mode tcl -source master.tcl
```

---

## ⚙️ What This Does

Running the above command will:

* Create a new Vivado project
* Add all RTL files from `rtl/`
* Add testbench files
* Add constraints 

> Note: Advanced steps like block design creation, synthesis, and simulation are included as scripts but are not enabled by default.

---

## 📚 Source / Credits

RTL generated using:

https://github.com/bsc-loca/PQC-Crystals-HLS-Accelerators

---


