# ILinOUProcess

This repository contains MATLAB scripts for simulating and analyzing **Ornstein-Uhlenbeck (OU) stochastic processes**, with a focus on investigating the relationship between **Integral Linear Processes** and **Increment Covariances**.

---

## 📁 Repository Contents

| File | Description |
|:-----|:------------|
| `OUILvsIC.m` | Script analyzing the relation between the OU process' integral linearity and increment covariances. |
| `OUprocessSS.m` | Computes steady-state properties of an Ornstein-Uhlenbeck process. |
| `mainnoplot.m` | Main script to run simulations without plotting. Useful for batch runs or data analysis. |
| `ornstein_uhlenbeck_euler_maruyama.m` | Implementation of the Euler-Maruyama method for simulating an Ornstein-Uhlenbeck process. |
| `LICENSE` | Project license file (MIT License). |

---

## 📚 Mathematical Background

The **Ornstein-Uhlenbeck (OU) process** is a classic stochastic process commonly used to model mean-reverting behaviors in physics, finance, and biology.

The project particularly investigates:
- Euler-Maruyama simulation of OU dynamics
- Steady-state statistics
- Integral linear properties versus incremental covariance

---

## 🛠 Requirements

- **MATLAB** R2020b or newer
- (No special toolboxes required)

---

## 🚀 How to Use

1. **Clone the repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/ILinOUProcess.git
   ```
2. **Add to MATLAB path**:
   ```matlab
   addpath(genpath('path_to_cloned_folder'))
   ```
3. **Run a simulation**, for example:
   ```matlab
   run('OUILvsIC.m')
   ```

---

## ✨ Highlights

- Simulate and visualize **Ornstein-Uhlenbeck processes**.
- Understand **increment properties** and **covariance structures**.
- Perform **steady-state analysis** of stochastic processes.

---

## 📜 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

Developed by Adrian Guel.
