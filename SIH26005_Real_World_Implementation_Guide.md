# SIH26005: Comprehensive Real-World Implementation & Engineering Guide

This document transitions from the conceptual architecture to a practical, real-world engineering and execution blueprint for building the 3-Stage Backup (Solar + Battery + PCM) Cold Storage System.

---

## 1. Thermodynamic Calculations & Sizing (1 Metric Ton Capacity)

To build a real-world system, we must first calculate the cooling load required for 1,000 kg of fresh vegetables in the North Eastern Region (NER).

**Assumptions:**
*   **Ambient Temperature (NER Summer):** ~35°C
*   **Target Internal Temperature:** 5°C
*   **Product:** 1,000 kg of mixed vegetables (Specific Heat Capacity $C_p$ $\approx$ 3.9 kJ/kg°C)
*   **Incoming Product Temperature:** 25°C
*   **Pull-down time (time to cool):** 12 hours
*   **Insulation:** 120mm PUF Panels (U-value $\approx$ 0.18 W/m²K)
*   **Cold Room Dimensions (Internal):** 2m x 2m x 2.5m = 10 $m^3$

**A. Product Cooling Load ($Q_{product}$)**
*   Energy = Mass $\times$ Specific Heat $\times$ $\Delta T$
*   Energy = $1000 \text{ kg} \times 3.9 \text{ kJ/kg°C} \times (25°C - 5°C) = 78,000 \text{ kJ} \approx 21.6 \text{ kWh}$
*   Cooling required over 12 hours: $21.6 \text{ kWh} / 12 \text{ h} = \mathbf{1.8 \text{ kW}}$

**B. Transmission Load (Heat leaking through walls) ($Q_{trans}$)**
*   Surface Area ($A$) $\approx$ $28 \text{ m}^2$
*   $Q_{trans} = U \times A \times \Delta T = 0.18 \times 28 \times (35 - 5) = \mathbf{0.15 \text{ kW}}$

**C. Total Cooling Load Capacity Required:**
Adding respiration heat, door openings, and a 20% safety factor, the compressor must provide approximately **2.5 kW to 3.0 kW of cooling capacity** (approx. 0.8 to 1.0 Ton of Refrigeration / TR).

---

## 2. PCM Thermal Battery Engineering

How much Phase Change Material (PCM) is needed to keep the room cool overnight (12 hours) without power?

**A. Overnight Heat Load:**
At night, the ambient temp drops (e.g., 25°C). The primary heat gain is transmission through the walls and product respiration.
*   Estimated nighttime load: ~0.3 kW (300 Watts) per hour.
*   Total energy needed for 12 hours: $0.3 \text{ kW} \times 12 \text{ hours} = \mathbf{3.6 \text{ kWh}}$ ($12,960 \text{ kJ}$)

**B. PCM Sizing:**
*   **Selected PCM:** Eutectic Salt Hydrate (Melting point 5°C).
*   **Latent Heat of Fusion:** $\approx 220 \text{ kJ/kg}$
*   **Mass of PCM Required:** $12,960 \text{ kJ} / 220 \text{ kJ/kg} = \mathbf{58.9 \text{ kg}}$
*   **Real-world safety margin:** Add 50% for degradation and uneven melting $\rightarrow$ **~90 kg to 100 kg of PCM.**
*   *Implementation:* This 100 kg of PCM is sealed in HDPE plastic flats/pouches and mounted directly beneath the evaporator fan inside the chamber.

---

## 3. Real-World Bill of Materials (BOM) & Cost Estimation
*Prices are approximate market rates in INR for a 1-Metric Ton System.*

| Component Category | Specific Item / Specification | Qty / Size | Est. Cost (INR) |
| :--- | :--- | :--- | :--- |
| **Insulated Structure** | 120mm PUF Panels with Cam Locks | $28 \text{ m}^2$ | ₹60,000 |
| **Refrigeration Unit** | 1.0 TR BLDC Variable Speed Compressor (R290) + Evaporator/Condenser Coils | 1 Set | ₹55,000 |
| **Solar Power** | 330W Monocrystalline Solar Panels | 9 Panels (~3kW) | ₹65,000 |
| | MPPT Solar Charge Controller (48V/60A) | 1 Unit | ₹12,000 |
| **Electrical Battery** | 48V, 100Ah LiFePO4 Battery (~4.8 kWh) | 1 Unit | ₹45,000 |
| **Thermal Battery (PCM)**| Eutectic Salt PCM (5°C melt) encapsulated in HDPE panels | 100 kg | ₹20,000 |
| **IoT & Control System**| ESP32, DS18B20 (x4), DHT22, PZEM-017, Relays, 4G SIM800L, Nextion Display | 1 Kit | ₹5,000 |
| **Misc & Installation** | Structural framing for panels, copper piping, wiring, refrigerant gas | Lumpsum | ₹15,000 |
| **TOTAL ESTIMATED CAPEX**| | | **~₹2,77,000** |

*Note: A traditional purely battery-powered system of this size would cost upwards of ₹4,50,000 due to the massive lithium battery required (15+ kWh).*

---

## 4. Control Logic & System Architecture (The "Smart" Brain)

The heart of the "Smart" requirement in SIH26005 is the controller algorithms. The ESP32 acts as the master controller for the 3-stage system.

### Operating Modes Logic:
1.  **Mode 1: High Solar (Daytime)**
    *   *Condition:* Solar PV generation > Compressor Power Draw.
    *   *Action:* Route solar power directly to the compressor via MPPT. Cool the room to 2°C to "overcool" and freeze the PCM completely. Charge the LiFePO4 battery with any excess solar power.
2.  **Mode 2: Low Solar (Cloudy / Evening)**
    *   *Condition:* Solar PV generation is low, room temp > 5°C, PCM is solid.
    *   *Action:* Draw power from the LiFePO4 battery to run the compressor at a reduced speed (Variable Frequency Drive) to maintain 5°C.
3.  **Mode 3: Zero Power / Nighttime (Passive Thermal)**
    *   *Condition:* Solar is 0, Battery SoC (State of Charge) drops below 20%.
    *   *Action:* **Turn off the compressor.** Turn on *only* a 12V 5W internal circulation fan. The PCM begins to melt, releasing cold air. The fan circulates this cold air over the vegetables. Total power draw is < 10W, easily sustained by the remaining 20% battery.

### IoT Tech Stack:
*   **Hardware:** ESP32 Microcontroller.
*   **Firmware:** FreeRTOS (C++) to handle multitasking (reading sensors, controlling relays, managing GSM communication).
*   **Backend/Cloud:** AWS IoT Core (MQTT) or Firebase Realtime Database.
*   **Frontend (Farmer App):** Flutter or React Native mobile app displaying:
    *   Current Temp & Humidity.
    *   Battery % and PCM Status (Solid/Melting).
    *   Push notifications (SMS fallback) for "Door Open" or "Temp Exceeded 10°C".

---

## 5. Hackathon Prototype Building Guide (For Finals Pitch)

You cannot bring a 1-ton cold room to the SIH venue. You must build a scaled-down functional prototype to prove the concept.

**Prototype Specs (50 Liters):**
1.  **The Box:** Buy a high-quality 50L polyurethane ice box (like a Coleman or camping cooler).
2.  **The Cooling:** Use a small 12V or 24V DC miniature compressor (like those found in portable car fridges - e.g., Secop Micro Compressor) or, if budget is extremely tight, high-power Peltier modules (Thermoelectric coolers) - *though note that Peltiers are highly inefficient and should only be used for proof of concept, not the final product.*
3.  **The PCM:** Buy commercial "Ice Packs" meant for vaccine transport (which melt at 2-8°C, not 0°C). Place 2-3 kg of these inside the cooler.
4.  **The Brains:** Mount the ESP32, an LCD screen, and 3 temperature sensors inside.
5.  **The Demonstration:**
    *   *Live Demo:* Run the cooler on a 12V power supply to freeze the PCM in front of the judges.
    *   *The "Magic" Trick:* Unplug the power supply completely. Show the judges the live dashboard on your phone. Demonstrate that over the next 3-4 hours of the judging phase, the internal temperature stays locked exactly at 5°C without a single drop of electricity, proving the PCM thermal battery concept.
