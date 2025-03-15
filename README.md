# Digital Implementation in FPGA (Spartan-6 and Zynq-7020)

<img src="https://download.logo.wine/logo/Xilinx/Xilinx-Logo.wine.png" alt="Alt Text">


This repository contains sample and example code for digital design implementation in FPGAs using **VHDL**. The examples are designed to work with **Xilinx Spartan-6** (using Xilinx ISE) and **Zynq-7020** (using Xilinx Vivado) FPGAs. The code demonstrates fundamental digital logic components and their implementation in hardware description languages (HDLs).

## Table of Contents
1. [Project Overview](#project-overview)
2. [Available Examples](#available-examples)
3. [Setup Instructions](#setup-instructions)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

---

## Project Overview

This repository is a collection of VHDL examples for digital design, focusing on basic and intermediate-level components. These examples are ideal for learning and implementing digital logic in FPGAs. The code is written in **VHDL** and is compatible with **Xilinx ISE** (for Spartan-6) and **Xilinx Vivado** (for Zynq-7020).

---

## Available Examples

Here is a list of the available examples in this repository:

1. **Comparator**: A VHDL implementation of a digital comparator.
2. **Encoder**: A basic encoder implementation in VHDL.
3. **Fulladder**: A full adder circuit implemented in VHDL.
4. **MUX2To1_Process**: A 2-to-1 multiplexer implemented using a `process` block.
5. **MUX4To1**: A 4-to-1 multiplexer implemented using conditional statements.
6. **MUX4To1_Process**: A 4-to-1 multiplexer implemented using a `process` block.
7. **MUX4To1_Whenelse**: A 4-to-1 multiplexer implemented using `when-else` statements.
8. **Priority_Encoder_Process**: A priority encoder implemented using a `process` block.
9. **Sign_FA16Bits**: A 16-bit signed full adder implemented in VHDL.
10. **Mux4to1_Process_Case** : A 4-to-1 multiplexer implemented using `Case` statements.
11. **Decoder2To4_Process_Case** : A priority decoder implemented using a `process & Case` block.
12. **ALU 74381** : The 74381 is a classic 4-bit Arithmetic Logic Unit (ALU) .
13. **ALU 74381** : The 74381 is a classic 4-bit Arithmetic Logic Unit (ALU) implemented using a `process & Case` block.
14. **Flip Flop ASynch_Reset** : A basic Async FlipFlop implementation in VHDL .
15. **Flip Flop Synch_Reset** : A basic Sync FlipFlop implementation in VHDL .
16. **Register nBits_Generic** : A basic nBits Register Generic implementation in VHDL .
17. **Shift Register** : A basic 8Bits Shift_Register implementation in VHDL .
18. **Shift Register For Loop** : A basic 16Bits Shift_Register With Foor Lopp implementation in VHDL .
19. **Up Down Counter 4Bits** : A basic Up Down Counter 4bits implementation in VHDL .
20. **Sequence Detector** : A basic Sequence Detector implementation in VHDL .
21. **BCD Counter 7Segment** : A basic Up Down Counter BCD implementation in VHDL And Display Number On 7Segment .
22. **Adder Use IPCore** : A basic Adder Use IPCore implementation in VHDL .
23. **DCM IPCore Test Segment Counter** : A basic Implementation DCM IPCore Test Segment Counter , Convert 50MHz Clock To 120MHz In VHDL .
24. **FFT 4Point** : A basic Implementation FFT Module 4Point In VHDL .
25. **Segment Counter Button** :Implementation Segment Counter With Out Debunce Button With Vhdl

Each example is contained in its own folder with the corresponding VHDL file(s).

---

## Setup Instructions

To use these examples, follow these steps:

### For Spartan-6 (Using Xilinx ISE):
1. **Install Xilinx ISE**:
   - Download and install [Xilinx ISE](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/design-tools.html) (if not already installed).
   - Ensure you have the necessary licenses for Spartan-6 devices.

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/Amin98Hosseini/FPGA-Project.git
   cd FPGA-Project

3. **Open the Project in Xilinx ISE**:
- Launch Xilinx ISE and create a new project.
- Add the VHDL files from the desired example folder to the project.
- Set the target FPGA device to **Spartan-6**.

4. **Synthesize and Implement**:
- Run synthesis and implementation for the design.
- Generate the bitstream and program the FPGA.

### For Zynq-7020 (Using Xilinx Vivado):
1. **Install Xilinx Vivado**:
- Download and install [Xilinx Vivado](https://www.xilinx.com/support/download.html) (if not already installed).
- Ensure you have the necessary licenses for Zynq-7020 devices.

2. **Clone the Repository**:
```bash
git clone https://github.com/Amin98Hosseini/FPGA-Project.git
cd FPGA-Project
```

3. **Open the Project in Vivado**:
- Launch Vivado and create a new project.
- Add the VHDL files from the desired example folder to the project.
- Set the target FPGA device to **Zynq-7020**.

4. **Synthesize and Implement**:
- Run synthesis and implementation for the design.
- Generate the bitstream and program the FPGA.

---

## Usage

Each example is self-contained and can be used as a starting point for your own designs. Here’s how to use them:

1. Navigate to the folder of the example you want to use.
2. Open the VHDL file in Xilinx ISE (for Spartan-6) or Vivado (for Zynq-7020).
3. Follow the setup instructions above to synthesize and implement the design.
4. Modify the code as needed for your specific application.

---

## Support Me
<a href="https://www.coffeebede.com/amin98hosseini">
  <img 
    class="img-fluid" 
    src="https://coffeebede.ir/DashboardTemplateV2/app-assets/images/banner/default-yellow.svg" 
    width="150" 
    height="50" 
    alt="Buy Me a Coffee" 
  />
</a>

## Contributing

Contributions are welcome! If you have additional examples, improvements, or bug fixes, feel free to open a pull request. Please ensure your code follows the same structure and style as the existing examples.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
