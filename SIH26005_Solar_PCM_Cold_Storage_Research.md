# SIH26005: Solar-Powered Smart Mini Cold Storage System with 3-Stage Backup

## 1. Executive Summary & Problem Alignment
The North Eastern Region (NER) of India suffers from significant post-harvest losses due to inadequate cold storage, frequent power cuts, and difficult terrain. To address **SIH26005**, we propose a highly innovative, decentralized **Solar-Powered Smart Mini Cold Storage System**.

The core innovation of this system is a **3-Stage Hybrid Power and Cooling Architecture** that utilizes:
1. **Direct Solar Power** for active cooling during the day.
2. **Electrical Battery Backup (LiFePO4)** to run the compressor during short power outages and immediately after sunset.
3. **Phase Change Material (PCM) Thermal Battery** to provide completely passive, zero-electricity cooling throughout the night or during prolonged periods of heavy cloud cover/rain (common in NER).

This system specifically preserves fresh vegetables (tomatoes, cabbage, beans, leafy greens) by maintaining temperatures between **4°C and 10°C** with high humidity, dramatically increasing shelf life while remaining low-cost, compact, and modular enough for village-level deployment.

---

## 2. The Core Innovation: 3-Stage Power & Cooling Backup
The traditional approach to solar cold storage relies heavily on massive electrical battery banks (lead-acid or lithium) to run a compressor 24/7. This makes systems bulky, expensive, and high-maintenance—violating the "low-cost" and "compact" requirements for NER.

Our solution intelligently shifts the energy storage load from *electrical* to *thermal*.

### Stage 1: Primary Active Cooling (Solar PV)
* **Operation:** During daylight hours (approx. 9 AM - 4 PM), solar panels directly power the DC variable-speed compressor.
* **Function:** Cools the storage chamber to the target temperature (e.g., 5°C) and simultaneously "charges" both the electrical battery and the PCM thermal battery (by freezing the PCM panels).

### Stage 2: Secondary Active Cooling (Electrical Battery Backup)
* **Operation:** Used during short, intermittent cloud cover and early evening.
* **Function:** A moderately sized Lithium Iron Phosphate (LiFePO4) battery powers the compressor to maintain temperature and finish freezing the PCM if needed. By sizing the battery *only* for transitional periods, we drastically reduce system cost and weight.

### Stage 3: Passive Thermal Cooling (PCM Thermal Battery)
* **Operation:** Engaged automatically at night or during prolonged multi-day grid/solar outages.
* **Function:** The compressor turns off completely. The frozen PCM panels inside the chamber begin to slowly melt, absorbing heat from the vegetables and ambient air. Because it is a *phase change*, the material absorbs massive amounts of latent heat while maintaining a constant temperature (e.g., exactly 5°C) for 12-16 hours without a single watt of electricity.

---

## 3. Phase Change Material (PCM) Thermal Battery Selection
For fresh vegetables, the ideal storage temperature is between **4°C and 10°C**. Therefore, we need a PCM with a melting point precisely in this range.

### Recommended PCM Material:
* **Target Melting Point:** 5°C to 6°C.
* **Best Options:**
  1. **Tetradecane (Organic Paraffin):** Melting point around ~5.8°C. Very stable, non-corrosive, high latent heat.
  2. **Salt Hydrates (Eutectic Mixtures):** Inorganic salt mixtures can be chemically engineered to melt at exactly 5°C. They are cheaper and have higher volumetric heat capacity than paraffins, making the panels thinner.
* **Selection for SIH:** Propose an **engineered Eutectic Salt Hydrate (e.g., PCM-05 or savE® FS05)**. It is cost-effective, non-toxic, and non-flammable.

### Implementation:
The PCM is encapsulated in High-Density Polyethylene (HDPE) panels. These panels are mounted on the ceiling and walls of the cold storage unit. During the day, the active refrigeration system cools the chamber down to 1°C - 3°C, which solidifies (charges) the 5°C PCM.

---

## 4. Technical System Sizing & Architecture (For a 1-Metric Ton Capacity System)
*This is an example sizing for a standard village-level aggregation point.*

1. **Refrigeration System:**
   * **Compressor:** 1.5 HP to 2 HP BLDC (Brushless DC) variable-speed compressor. DC compressors bypass the need for an inverter, improving energy efficiency by 15-20%.
   * **Refrigerant:** R290 (Propane) or R134a. R290 is preferred for high efficiency and low global warming potential.

2. **Solar PV Sizing:**
   * **Requirement:** NER experiences frequent cloud cover, so panels must be oversized.
   * **Proposed:** 2.5 kWp to 3 kWp Solar PV Array (Monocrystalline panels for better low-light performance).

3. **Electrical Battery Sizing:**
   * **Traditional requirement:** 15-20 kWh battery for night operation (Extremely expensive).
   * **Our PCM-Assisted Requirement:** Only **4 kWh to 5 kWh** LiFePO4 battery. This is enough to handle transient clouds and run the smart IoT sensors 24/7. The cooling load at night is entirely handled by the PCM.

4. **PCM Sizing:**
   * Assuming a required night-time cooling load of ~8 kWh, we need approximately 150-200 kg of Eutectic PCM (latent heat capacity of ~200 kJ/kg). The cost of this PCM is a fraction of the cost of the equivalent electrical battery storage.


## 5. IoT & Smart Monitoring System
The problem statement strictly requires smart monitoring and alerts. The system will use an edge-computing approach with cloud connectivity.

### Hardware Components:
* **Microcontroller:** ESP32 (Features built-in Wi-Fi/Bluetooth, low power consumption, and adequate processing power).
* **Sensors:**
  * **Temperature:** Multiple DS18B20 waterproof sensors distributed across the top, middle, and bottom of the chamber to ensure uniform cooling and monitor the PCM phase status.
  * **Humidity:** DHT22 or SHT31 sensor to monitor internal humidity (must stay between 85-95% for vegetables).
  * **Power Monitoring:** INA219/PZEM-017 DC voltage/current sensors to monitor solar generation, battery SoC (State of Charge), and compressor power draw.

### Smart Alert System & Interface:
* **Local Interface:** A small Nextion LCD touch display mounted on the outside of the unit, allowing farmers to see real-time temperature, battery status, and PCM charge level without opening the door (which lets out cold air).
* **Cloud Dashboard & Alerts:** Data is pushed to an AWS/Firebase backend. If Wi-Fi is unavailable (common in NER), a GSM Module (SIM800L) or LoRaWAN can be used to transmit data to the nearest gateway.
* **Alert Triggers (SMS/App push notifications):**
  * *Critical Temperature:* If internal temp exceeds 10°C.
  * *Power Failure:* If both solar and battery are dead and PCM is fully melted.
  * *Door Open Alarm:* If the insulated door is left open for more than 2 minutes.

---

## 6. Structural Design & Suitability for NER
To navigate the difficult terrain of the North Eastern Region, the system must be modular and heavily insulated.

* **Insulation (Crucial for PCM efficiency):** 100mm to 120mm Polyurethane Foam (PUF) panels. These have superior thermal resistance (R-value). The better the insulation, the longer the PCM will last at night.
* **Modularity:** The cold room must be designed in a "Flat-Pack" or "Knock-Down" manner. Instead of shipping a massive, heavy container up a winding mountain road, the PUF panels, compressor unit, and solar panels should be shipped separately and assembled on-site at the village using basic tools.
* **Weather Resistance:** The exterior must be made of pre-painted galvanized iron (PPGI) to resist heavy monsoon rains and rust, common in NER.


## 7. Cost Analysis & Economic Feasibility
The primary reason solar cold storage fails in rural India is the massive capital expenditure (CAPEX) and replacement cost (OPEX) of large lithium/lead-acid batteries.

### The PCM Cost Advantage:
* **Traditional System (100% Electrical Battery):** To store 10 kWh of energy for overnight cooling, a Li-ion battery costs approximately ₹150,000 - ₹200,000. It also must be replaced every 4-6 years.
* **Our Proposed System (PCM + Small Battery):**
  * 3 kWh LiFePO4 Battery: ~₹45,000.
  * 150 kg Eutectic PCM (₹200/kg): ~₹30,000.
  * **Total Energy Storage Cost:** ~₹75,000.
* **Savings:** By shifting the thermal load to PCM, we cut the energy storage cost by more than **50%**. Furthermore, PCM does not degrade like chemical batteries; it can undergo thousands of melt/freeze cycles over 15+ years with zero maintenance.

This drastic reduction in CAPEX and OPEX is what makes this system genuinely **affordable for farmer cooperatives and local markets.**

---

## 8. Conclusion & SIH Winning Pitch
**Why this solution wins SIH26005:**
1. **Directly addresses all constraints:** It specifically targets the unreliability of the grid in NER by utilizing a robust 3-stage backup system.
2. **True Innovation:** The integration of Phase Change Materials (PCM) elevates the project from a generic "solar fridge" to an advanced, thermally engineered solution.
3. **High Economic Viability:** Halving the battery costs makes commercial deployment highly feasible.
4. **Social Impact:** By deploying these at farm-gate aggregation points, NER farmers can preserve their high-value horticulture crops (reducing 30% spoilage to near 0%), allowing them to negotiate better market prices and double their effective income.

**Next Steps for Prototype (For the Hackathon Finals):**
* Build a scaled-down 50-100 Liter prototype using a small 12V/24V DC compressor.
* Create HDPE pouches of an organic PCM (or even salt water if eutectic salts aren't immediately available for the prototype) to demonstrate the passive cooling curve overnight.
* Hook up an ESP32 with temperature sensors and build a real-time web dashboard demonstrating the IoT capabilities and temperature stability when power is cut.
